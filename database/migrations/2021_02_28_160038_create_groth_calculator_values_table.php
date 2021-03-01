<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateGrothCalculatorValuesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('groth_calculator_values', function (Blueprint $table) {
            $table->id();
            $table->integer('gender_id');
            $table->integer('age');
            $table->integer('length_from');
            $table->integer('length_to');
            $table->integer('weight_from');
            $table->integer('weight_to');
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
        Schema::dropIfExists('groth_calculator_values');
    }
}
