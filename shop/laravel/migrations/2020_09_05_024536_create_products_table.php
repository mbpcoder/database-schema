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
            $table->unsignedBigInteger('category_id')->nullable();
            $table->unsignedBigInteger('thumbnail_id')->nullable();
            $table->string('name', 128);
            $table->string('slug', 128)->unique();
            $table->string('summary', 256)->nullable();
            $table->text('description')->nullable();
            $table->unsignedInteger('price');
            $table->unsignedInteger('quantity')->default(0);
            $table->unsignedInteger('priority')->default(0);
            $table->boolean('disabled')->default(true);
            $table->timestamps();
            $table->softDeletes('deleted_at', 0);

            $table->foreign('category_id')->references('id')->on('categories');
            $table->foreign('thumbnail_id')->references('id')->on('files');
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
