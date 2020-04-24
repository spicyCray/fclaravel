<?php

namespace App\Http\Middleware;
use Closure;
use Illuminate\Auth\Middleware\Authenticate as Middleware;
class Authenticate extends Middleware
{
    /**
     * Get the path the user should be redirected to when they are not authenticated.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return string
     */
    protected function redirectTo($request)
    {
        if (! $request->expectsJson()) {

            echo "<pre>";
                print_r('22222');
            echo "</pre>";
            die;
            return route('login');
        }
    }

    // public function handle($request, Closure $next)
    // {
    //     if ($request->age <= 200) {
    //         return redirect('home');
    //     }

    //     return $next($request);
    // }
}
