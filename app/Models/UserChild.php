<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Vaccine;
use App\Models\UserChild;
use Auth;
use Carbon\Carbon;

class UserChild extends Model
{
    use HasFactory;

    public function user()
    {
        return $this->belongsTo('App\Models\User');
    }

    public function gender()
    {
        return $this->belongsTo('App\Models\Gender');
    }

    public function groth_tracker_records()
    {
    	return $this->hasMany('App\Models\GrothTracker');
    }


    public function vaccines()
    {
        return $this->hasMany('App\Models\ChildVaccine');
    }


    
}
