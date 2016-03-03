<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateArisanDetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('arisan_details', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('arisan_id')->unsigned();
            $table->integer('user_id')->unsigned();
            $table->integer('urutan_pemenang');
            $table->timestamps();

            $table->foreign('arisan_id')
                ->references('id')
                ->on('arisans')
                ->onUpdate('cascade')
                ->onDelete('cascade');

            $table->foreign('user_id')
                ->references('id')
                ->on('users')
                ->onUpdate('cascade')
                ->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('arisan_details');
    }
}
