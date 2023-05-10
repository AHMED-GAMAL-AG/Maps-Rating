<?php

namespace App\Providers;

use App\Http\ViewComposers\CategoryComposer;
use Illuminate\Support\Facades\Blade;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        view()->composer(['includes.header', 'includes.category_list'], CategoryComposer::class);

        Blade::if('owner', function () {
            return auth()->user() && auth()->user()->hasRole('owner');
        });
    }
}
