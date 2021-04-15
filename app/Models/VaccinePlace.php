<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class VaccinePlace extends Model
{
    use HasFactory;

    public function vaccines_places_vaccines()
    {
        return $this->hasMany('App\Models\VaccinePlaceVaccine', 'vaccine_place_id');
    }

    public function region()
    {
        return $this->BelongsTo('App\Models\Region', 'region_id');
    }

    public function city()
    {
        return $this->BelongsTo('App\Models\City', 'city_id');
    }
}
