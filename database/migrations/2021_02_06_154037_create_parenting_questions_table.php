<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateParentingQuestionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('parenting_questions', function (Blueprint $table) {
            $table->id();
            $table->integer('user_id');
            $table->integer('questions_category_id');
            $table->integer('questions_subcategory_id');
            $table->integer('questions_status_id');
            $table->integer('user_child_id')->nullable();;
            $table->string('child_age');
            $table->string('child_gender');
            $table->text('question');
            $table->boolean('privet')->default(0);
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
        Schema::dropIfExists('parenting_questions');
    }
}
