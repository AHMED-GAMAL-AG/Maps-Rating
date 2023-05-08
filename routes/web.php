<?php

use App\Http\Controllers\CategoryController;
use App\Http\Controllers\ContactController;
use App\Http\Controllers\LikeController;
use App\Http\Controllers\PlaceController;
use App\Http\Controllers\ReviewController;
use App\Http\Controllers\SearchController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::middleware([
    'auth:sanctum',
    config('jetstream.auth_session'),
    'verified'
])->group(function () {
    Route::get('/dashboard', function () {
        return view('dashboard');
    })->name('dashboard');
});

Route::resource('/report' , ContactController::class , ['only' => ['create' , 'store'] ]);

Route::get('/' , [PlaceController::class , 'index'])->name('home');
Route::get('/{place}/{slug}' , [PlaceController::class , 'show'])->name('place.show');

Route::get('/search' , [SearchController::class , 'autoComplete'])->name('auto-complete');
Route::post('/search' , [SearchController::class , 'show'])->name('search');

Route::get('/{category:slug}' , [CategoryController::class , 'show'])->name('category.show'); // {category:slug} is to make laravel to search by the slug not the id as default

Route::post('/review' , [ReviewController::class , 'store'])->name('review.store');

Route::post('/like' , [LikeController::class , 'store'])->name('like.store');
