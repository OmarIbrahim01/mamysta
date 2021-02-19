<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ParentingQuestionSubcategory extends Model
{
    use HasFactory;

    public function category()
    {
        return $this->belongsTo('App\Models\ParentingQuestionCategory');
    }

    public function questions()
    {
        return $this->hasMany('App\Models\ParentingQuestion');
    }
}
