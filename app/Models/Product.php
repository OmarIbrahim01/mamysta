<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    public function subcategory()
    {
    	return $this->belongsTo('App\Models\ProductSubCategory');
    }

     public function brand()
    {
    	return $this->belongsTo('App\Models\Brand');
    }

    public function running_cost_percentage()
    {
    	return $this->belongsTo('App\Models\ProductRunningCostPercentage');
    }

     public function variants()
    {
        return $this->hasMany('App\Models\ProductVariant');
    }


}
