<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Vaccine extends Model
{
    use HasFactory;

    public function vaccines_places_vaccines()
    {
        return $this->hasMany('App\Models\VaccinePlaceVaccine', 'vaccine_id');
    }
}
