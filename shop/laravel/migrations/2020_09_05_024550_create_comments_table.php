<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCommentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('comments', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('product_id');
            $table->unsignedBigInteger('reply_to_id')->nullable();
            $table->unsignedBigInteger('author_id')->nullable();
            $table->string('author_name', 64)->nullable();
            $table->text('body');
            $table->timestamps();
            $table->timestamp('published_at')->nullable();
            $table->softDeletes('deleted_at', 0);

            $table->foreign('product_id')->references('id')->on('products');
            $table->foreign('reply_to_id')->references('id')->on('comments');
            $table->foreign('author_id')->references('id')->on('users');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('comments');
    }
}
