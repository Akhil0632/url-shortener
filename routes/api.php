<?php

use App\Http\Controllers\Api\ShortUrlApiController;
use Illuminate\Support\Facades\Route;

Route::post('/shorten', [ShortUrlApiController::class, 'store']);