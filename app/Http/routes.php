<?php
Route::get('/',function(){
    	return redirect(config('oblagio.backendUrl').'/'.config('oblagio.firstMenu').'/index');
});

Route::group(['middleware'=>['web']] , function(){
	Route::get('auth','Backend\AuthController@login');
	Route::post('auth','Backend\AuthController@postLogin');
	Route::get('auth/sign-out','Backend\AuthController@signOut');
	Route::get('auth/forgot-password','Backend\AuthController@forgotPassword');
	Route::post('auth/forgot-password','Backend\AuthController@postForgotPassword');

});
	
Route::group(['prefix' => og()->backendUrl , 'middleware' => ['auth']],function(){
		
		Route::get('/' , function(){
			return redirect('auth');
		});
		Route::auth();
		if(\Schema::hasTable('menus'))
		{
			foreach(og()->menu()->whereRaw('permalink != "#"')->get() as $row)
			{
				$controllerPath = app_path('Http/Controllers/'.$row->controller.'.php');

				if(file_exists($controllerPath))
				{
					Route::controller($row->permalink,$row->controller);
				}
			}
		}
});

