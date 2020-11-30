<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductVariant extends Model
{
    use HasFactory;

    public function stocks()
    {
    	return $this->hasMany('App\Models\ProductVariantStock');
    }

    public function images()
    {
    	return $this->hasMany('App\Models\ProductVariantImage');
    }

    public function color()
    {
    	return $this->belongsTo('App\Models\ProductColor' , 'product_color_id');
    }

    public function size()
    {
        return $this->belongsTo('App\Models\ProductSize' , 'product_size_id');
    }

    public function product()
    {
        return $this->belongsTo('App\Models\Product');
    }
}
