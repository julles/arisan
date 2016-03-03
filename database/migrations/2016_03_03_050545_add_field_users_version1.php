<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddFieldUsersVersion1 extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('users', function (Blueprint $table) {
            $table->string('nik');
            $table->text('address');
            $table->string('postal_code');
            $table->string('phone');
            $table->datetime('birthday');
            $table->string('birthplace');
            $table->enum('sex',['m'=>'Male','f'=>'Female']);
            $table->enum('marital',['s'=>'Single','m'=>'Married']);
            $table->string('job');
            
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('users', function (Blueprint $table) {
            //
        });
    }
}
