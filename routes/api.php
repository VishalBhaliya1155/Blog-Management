<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

use App\Http\Controllers\AuthController;
use App\Http\Controllers\BlogController;

Route::post('/login', [AuthController::class, 'login']);
Route::post('/Register', [AuthController::class, 'register']);
Route::get('/phpinfo', function() {
    phpinfo();
});
Route::middleware('auth:sanctum')->group(function () {
    Route::post('/blogs/create', [BlogController::class, 'store']);
    Route::match(['get', 'post'], '/blogs', [BlogController::class, 'index']);
    Route::post('/blogs/update', [BlogController::class, 'update']);
    Route::post('/blogs/delete', [BlogController::class, 'destroy']);
    Route::post('/blog/like', [BlogController::class, 'toggleLike']);
});

