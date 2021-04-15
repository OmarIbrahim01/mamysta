<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ChildVaccine extends Model
{
    use HasFactory;


    public function child()
    {
        return $this->belongsTo('App\Models\UserChild', 'user_child_id');
    }

    public function vaccine()
    {
        return $this->belongsTo('App\Models\Vaccine', 'vaccine_id');
    }


}
