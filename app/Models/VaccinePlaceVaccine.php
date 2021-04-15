<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class VaccinePlaceVaccine extends Model
{
    use HasFactory;

    public function vaccine()
    {
        return $this->BelongsTo('App\Models\Vaccine', 'vaccine_id');
    }

    public function vaccine_place()
    {
        return $this->BelongsTo('App\Models\VaccinePlace', 'vaccine_place_id');
    }
}
