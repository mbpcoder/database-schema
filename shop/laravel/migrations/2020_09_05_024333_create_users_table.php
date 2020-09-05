<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('avatar_id')->nullable();
            $table->string('name', 64);
            $table->string('username', 32)->unique()->nullable()->index();
            $table->string('email', 128)->unique()->nullable()->index();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('mobile', 16)->unique()->nullable()->index();
            $table->timestamp('mobile_verified_at')->nullable();
            $table->unsignedInteger('balance')->default(0);
            $table->string('password');
            $table->boolean('is_admin')->default(false);
            $table->boolean('disabled')->default(true);
            $table->text('description')->nullable();
            $table->rememberToken();
            $table->timestamps();
            $table->softDeletes('deleted_at', 0);

            $table->foreign('avatar_id')->references('id')->on('files');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
}
