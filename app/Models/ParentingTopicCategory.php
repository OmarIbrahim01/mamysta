<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ParentingTopicCategory extends Model
{
    use HasFactory;

    public function topics()
    {
    	return $this->hasMany('App\Models\ParentingTopic');
    }
}
