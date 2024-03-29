<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ParentingTopic extends Model
{
    use HasFactory;

    public function user()
    {
    	return $this->belongsTo('App\Models\User');
    }

    public function category()
    {
    	return $this->belongsTo('App\Models\ParentingTopicCategory', 'parenting_topic_category_id');
    }

    public function status()
    {
    	return $this->belongsTo('App\Models\ParentingTopicStatus', 'parenting_topic_status_id');
    }
}
