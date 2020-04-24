<?php
namespace App\Http\Middleware;

use Closure;

class ApiJwt
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        // dd($request);
        // echo "<pre>";
        //     var_dump($request);
        // echo "</pre>";
        // die;
        return $next($request);
    }
}
