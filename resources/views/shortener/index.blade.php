<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>{{ config('app.name') }}</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script>
    function copyToClipboard(text) {
      navigator.clipboard.writeText(text).then(() => {
        const n = document.getElementById('copyNotice');
        n.textContent = 'Copied!';
        n.classList.remove('hidden');
        setTimeout(()=> n.classList.add('hidden'), 1500);
      });
    }
  </script>
  <style>
    body { font-family: system-ui, -apple-system, Segoe UI, Roboto, sans-serif; }
    .card { max-width: 760px; margin: 2rem auto; padding: 1.25rem; border: 1px solid #e5e7eb; border-radius: 16px; }
    .btn { padding: .6rem 1rem; border-radius: 10px; border: 1px solid #111827; }
    .btn.primary { background: #111827; color: white; }
    .input { width: 100%; padding: .7rem .9rem; border: 1px solid #d1d5db; border-radius: 12px; }
    .row { display: grid; gap: .75rem; grid-template-columns: 1fr 180px; }
    .muted { color: #6b7280; font-size: .9rem; }
    table { width: 100%; border-collapse: collapse; }
    th, td { padding: .6rem; border-bottom: 1px solid #e5e7eb; text-align: left; }
    .badge { font-size: .75rem; background: #eef2ff; padding: .2rem .5rem; border-radius: 999px; }
  </style>
</head>
<body>
  <div class="card">
    <h1 style="font-size:1.6rem; margin-bottom:.25rem;">🔗 {{ config('app.name') }}</h1>
    <p class="muted">Paste a long URL, optionally set a custom alias and expiration.</p>

    @if ($errors->any())
      <div style="background:#fef2f2; border:1px solid #fecaca; padding:.75rem; border-radius:10px; margin:.75rem 0;">
        <ul style="margin:0; padding-left:1rem;">
          @foreach ($errors->all() as $error)
            <li>{{ $error }}</li>
          @endforeach
        </ul>
      </div>
    @endif

    @if (session('shortened'))
      @php $short = session('shortened'); @endphp
      <div style="background:#ecfeff; border:1px solid #a5f3fc; padding:.75rem; border-radius:10px; margin:.75rem 0; display:flex; align-items:center; gap:.5rem;">
        <span> Short link created:</span>
        <a href="{{ $short }}" target="_blank">{{ $short }}</a>
        <button class="btn" onclick="copyToClipboard('{{ $short }}')">Copy</button>
        <a class="btn" href="{{ route('preview', basename($short)) }}">Preview</a>
        <span id="copyNotice" class="muted hidden"></span>
      </div>
    @endif

    <form action="{{ route('shorten') }}" method="post" style="display:grid; gap:.75rem; margin-top:.75rem;">
      @csrf
      <label>Long URL</label>
      <input class="input" name="original_url" type="url" placeholder="https://example.com/some/very/long/path?with=query" required value="{{ old('original_url') }}">

      <div class="row">
        <div>
          <label class="muted">Custom alias (optional)</label>
          <input class="input" name="custom_alias" placeholder="e.g. mypromo" value="{{ old('custom_alias') }}">
          <div class="muted">Your link will look like: {{ rtrim(config('app.url'), '/') }}/<em>alias</em></div>
        </div>
        <div>
          <label class="muted">Expire in days (optional)</label>
          <input class="input" name="expires_in" type="number" min="1" max="365" placeholder="e.g. 30" value="{{ old('expires_in') }}">
        </div>
      </div>

      <div>
        <button class="btn primary" type="submit">Shorten</button>
      </div>
    </form>
  </div>

  <div class="card">
    <div style="display:flex; align-items:center; justify-content:space-between;">
      <h2 style="font-size:1.2rem;">Recent links</h2>
      <span class="badge">Latest</span>
    </div>

    @if($list->count())
      <div style="overflow:auto;">
        <table>
          <thead>
            <tr>
              <th>Short</th>
              <th>Original</th>
              <th>Clicks</th>
              <th>Expires</th>
              <th>Preview</th>
            </tr>
          </thead>
          <tbody>
            @foreach ($list as $item)
              @php
                $short = rtrim(config('app.url'), '/') . '/' . $item->code;
              @endphp
              <tr>
                <td><a href="{{ $short }}" target="_blank">{{ $short }}</a></td>
                <td style="max-width:420px; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;">
                  <a href="{{ $item->original_url }}" target="_blank">{{ $item->original_url }}</a>
                </td>
                <td>{{ $item->clicks }}</td>
                <td>{{ $item->expires_at ? $item->expires_at->diffForHumans() : '—' }}</td>
                <td><a class="btn" href="{{ route('preview', $item->code) }}">Preview</a></td>
              </tr>
            @endforeach
          </tbody>
        </table>
      </div>

      <div style="margin-top:.75rem;">{{ $list->links() }}</div>
    @else
      <p class="muted">No links yet.</p>
    @endif
  </div>
</body>
</html>
