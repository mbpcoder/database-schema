<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDiscountsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('discounts', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('issuer_id');
            $table->unsignedBigInteger('user_id')->nullable();
            $table->string('code', 64)->unique();
            $table->string('title', 64);
            $table->unsignedInteger('count')->nullable();
            $table->unsignedInteger('used_count')->default(0);
            $table->unsignedInteger('amount');
            $table->text('description')->nullable();
            $table->timestamp('started_at');
            $table->timestamp('expired_at')->nullable();
            $table->timestamp('created_at')->useCurrent();

            $table->foreign('issuer_id')->references('id')->on('users');
            $table->foreign('user_id')->references('id')->on('users');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('discounts');
    }
}
