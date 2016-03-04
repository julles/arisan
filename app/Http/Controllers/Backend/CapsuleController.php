<?php

namespace App\Http\Controllers\Backend;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Models\Menu;

class CapsuleController extends Controller
{
    public $menu;
    public $user;

    public function __construct()
    {
    
    }
}
