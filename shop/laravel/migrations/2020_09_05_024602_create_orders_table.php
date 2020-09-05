<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('orders', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id');
            $table->string('tracking_code', 32)->unique();
            $table->unsignedInteger('item_count')->default(0);
            $table->unsignedInteger('item_price')->default(0);
            $table->unsignedInteger('delivery_cost')->default(0);
            $table->unsignedInteger('value_added_tax')->default(0);
            $table->unsignedInteger('discount')->default(0);
            $table->unsignedInteger('total_price')->default(0);
            $table->boolean('pending')->default(true);
            $table->boolean('cash_on_delivery')->default(false);
            $table->timestamps();

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
        Schema::dropIfExists('orders');
    }
}
