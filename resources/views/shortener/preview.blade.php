<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Preview • {{ config('app.name') }}</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <style>
    body { font-family: system-ui, -apple-system, Segoe UI, Roboto, sans-serif; }
    .card { max-width: 680px; margin: 2rem auto; padding: 1.25rem; border: 1px solid #e5e7eb; border-radius: 16px; }
    .btn { padding: .6rem 1rem; border-radius: 10px; border: 1px solid #111827; }
    .btn.primary { background: #111827; color: white; }
    .muted { color: #6b7280; }
    .kv { display:grid; grid-template-columns: 120px 1fr; gap:.5rem; }
  </style>
</head>
<body>
  <div class="card">
    @php $short = rtrim(config('app.url'), '/') . '/' . $row->code; @endphp
    <h1 style="font-size:1.4rem; margin-bottom:.25rem;"> Link Preview</h1>
    <p class="muted">Check the destination before you go.</p>

    <div class="kv" style="margin-top:1rem;">
      <div class="muted">Short</div><div><a href="{{ $short }}" target="_blank">{{ $short }}</a></div>
      <div class="muted">Original</div><div><a href="{{ $row->original_url }}" target="_blank">{{ $row->original_url }}</a></div>
      <div class="muted">Clicks</div><div>{{ $row->clicks }}</div>
      <div class="muted">Created</div><div>{{ $row->created_at->toDayDateTimeString() }}</div>
      <div class="muted">Expires</div><div>{{ $row->expires_at ? $row->expires_at->toDayDateTimeString() : 'Never' }}</div>
    </div>

    <div style="display:flex; gap:.5rem; margin-top:1rem;">
      <a class="btn primary" href="{{ $short }}" target="_blank">Go to site</a>
      <a class="btn" href="{{ route('home') }}">Back</a>
    </div>
  </div>
</body>
</html>
