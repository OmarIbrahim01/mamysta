<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Region extends Model
{
    use HasFactory;

    public function cities()
    {
        return $this->hasMany('App\Models\City');
    }

    public function vaccine_places()
    {
        return $this->hasMany('App\Models\VaccinePlace', 'region_id');
    }
}
