<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ParentingQuestion extends Model
{
    use HasFactory;

    public function answers()
    {
        return $this->hasMany('App\Models\ParentingAnswer');
    }

    public function user()
    {
        return $this->belongsTo('App\Models\User');
    }

    public function category()
    {
        return $this->belongsTo('App\Models\ParentingQuestionCategory', 'parenting_questions_category_id');
    }

    public function subcategory()
    {
        return $this->belongsTo('App\Models\ParentingQuestionSubcategory', 'parenting_questions_subcategory_id');
    }

    public function status()
    {
        return $this->belongsTo('App\Models\ParentingQuestionStatus', 'parenting_questions_status_id');
    }
}
