<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ParentingAnswer extends Model
{
    use HasFactory;

    public function question()
    {
        return $this->belongsTo('App\Models\ParentingQuestion');
    }

    public function status()
    {
        return $this->belongsTo('App\Models\ParentingAnswerStatus', 'parenting_answer_status_id');
    }

    public function user()
    {
        return $this->belongsTo('App\Models\User');
    }
    
    public function type()
    {
        return $this->belongsTo('App\Models\ParentingAnswerType', 'parenting_answer_type_id');
    }
    
}
