<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePaymentTransactiobsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('payment_transactiobs', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id')->nullable();
            $table->unsignedBigInteger('invoice_id');
            $table->enum('payment_method', ['card', 'account', 'ach', 'ipg', 'ussd', 'credit' , 'cash']);
            $table->string('bank_name', 64)->nullable();
            $table->string('account', 64)->nullable();
            $table->string('card_number', 128)->nullable();
            $table->string('iban', 128)->nullable();
            $table->unsignedInteger('amount');
            $table->enum('status', ['pending', 'success', 'failed']);
            $table->string('reference_number', 64)->nullable();
            $table->text('details')->nullable();
            $table->text('description')->nullable();
            $table->timestamp('created_at')->useCurrent();

            $table->foreign('user_id')->references('id')->on('users');
            $table->foreign('invoice_id')->references('id')->on('invoices');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('payment_transactiobs');
    }
}
