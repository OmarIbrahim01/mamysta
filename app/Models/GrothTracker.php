<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class GrothTracker extends Model
{
    use HasFactory;


    public function child()
    {
    	return $this->belongsTo('App\Models\UserChild');
    }

    
}
