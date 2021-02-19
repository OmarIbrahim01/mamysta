<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ParentingQuestionCategory extends Model
{
    use HasFactory;

    public function subcategories()
    {
        return $this->hasMany('App\Models\ParentingQuestionSubcategory');
    }
}
