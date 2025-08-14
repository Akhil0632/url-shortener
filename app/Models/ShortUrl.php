<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Carbon;

class ShortUrl extends Model
{
    protected $fillable = ['original_url', 'code', 'expires_at'];
    protected $casts = ['expires_at' => 'datetime'];

    public function getIsExpiredAttribute(): bool
    {
        return $this->expires_at !== null && $this->expires_at->isPast();
    }
}
