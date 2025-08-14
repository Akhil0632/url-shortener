<?php

namespace App\Http\Controllers;

use App\Http\Requests\ShortenUrlRequest;
use App\Models\ShortUrl;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Str;
use Illuminate\Support\Carbon;
use Symfony\Component\HttpFoundation\Response;

class ShortUrlController extends Controller
{
    public function index()
    {
        $list = ShortUrl::latest()->paginate(10);
        return view('shortener.index', compact('list'));
    }

    public function store(ShortenUrlRequest $request)
    {
        $base = rtrim(config('app.url'), '/');

        $code = $request->filled('custom_alias')
            ? strtolower($request->input('custom_alias'))
            : $this->generateCode();

        if (ShortUrl::where('code', $code)->exists()) {
            return back()->withErrors(['custom_alias' => 'That alias is taken. Try another.'])->withInput();
        }

        $expiresAt = $request->filled('expires_in')
            ? now()->addDays((int)$request->input('expires_in'))
            : null;

        $short = ShortUrl::create([
            'original_url' => $request->input('original_url'),
            'code' => $code,
            'expires_at' => $expiresAt,
        ]);

        Cache::put($this->cacheKey($code), [
            'url' => $short->original_url,
            'expires_at' => optional($short->expires_at)->timestamp
        ], now()->addHours(24));

        return redirect()->route('home')->with('shortened', "$base/{$short->code}");
    }

    public function redirect(string $code)
    {
        $cache = Cache::get($this->cacheKey($code));
        if ($cache) {
            if (isset($cache['expires_at']) && $cache['expires_at'] !== null && Carbon::createFromTimestamp($cache['expires_at'])->isPast()) {
                abort(Response::HTTP_GONE, 'This short link has expired.');
            }
            ShortUrl::where('code', $code)->increment('clicks');
            return redirect()->away($cache['url']);
        }

        $row = ShortUrl::where('code', $code)->firstOrFail();
        if ($row->is_expired) {
            abort(Response::HTTP_GONE, 'This short link has expired.');
        }

        Cache::put($this->cacheKey($code), [
            'url' => $row->original_url,
            'expires_at' => optional($row->expires_at)->timestamp
        ], now()->addHours(24));

        $row->increment('clicks');
        return redirect()->away($row->original_url);
    }

    public function preview(string $code)
    {
        $row = ShortUrl::where('code', $code)->firstOrFail();
        return view('shortener.preview', compact('row'));
    }

    private function generateCode(int $length = 7): string
    {
        do {
            $code = Str::lower(Str::random($length));
        } while (ShortUrl::where('code', $code)->exists());

        return $code;
    }

    private function cacheKey(string $code): string
    {
        return "shorturl:{$code}";
    }
}
