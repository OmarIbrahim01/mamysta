<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->text('description')->nullable();
            $table->integer('product_section_id');
            $table->integer('product_category_id');
            $table->integer('product_sub_category_id');
            $table->integer('product_brand_id');
            $table->integer('gender_id');
            $table->integer('min_age_id');
            $table->integer('max_age_id');
            $table->text('thumbnail')->nullable();
            $table->integer('product_status_id');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('products');
    }
}
