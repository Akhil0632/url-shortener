<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Requests\ShortenUrlRequest;
use App\Models\ShortUrl;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Str;

class ShortUrlApiController extends Controller
{
    public function store(ShortenUrlRequest $request)
    {
        $code = $request->filled('custom_alias')
            ? strtolower($request->input('custom_alias'))
            : $this->generateCode();

        if (ShortUrl::where('code', $code)->exists()) {
            return response()->json([
                'success' => false,
                'message' => 'That alias is already taken.'
            ], 409);
        }

        $expiresAt = $request->filled('expires_in')
            ? now()->addDays((int)$request->input('expires_in'))
            : null;

        $short = ShortUrl::create([
            'original_url' => $request->input('original_url'),
            'code'         => $code,
            'expires_at'   => $expiresAt,
        ]);

        Cache::put($this->cacheKey($code), [
            'url'        => $short->original_url,
            'expires_at' => optional($short->expires_at)->timestamp
        ], now()->addHours(24));

        return response()->json([
            'success'      => true,
            'short_url'    => rtrim(config('app.url'), '/') . '/' . $short->code,
            'code'         => $short->code,
            'original_url' => $short->original_url,
            'expires_at'   => $short->expires_at
        ]);
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
