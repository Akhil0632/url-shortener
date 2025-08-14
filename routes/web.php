<?php

use App\Http\Controllers\ShortUrlController;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Route::middleware('throttle:60,1')->group(function () {
    Route::get('/', [ShortUrlController::class, 'index'])->name('home');
    Route::post('/shorten', [ShortUrlController::class, 'store'])->name('shorten');
    Route::get('/preview/{code}', [ShortUrlController::class, 'preview'])->name('preview');
    Route::get('/{code}', [ShortUrlController::class, 'redirect'])->name('redirect');
});