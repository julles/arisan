<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMixTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('arisan_mix', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('arisan_id')->unsigned();
            $table->integer('putaran_ke');
            $table->integer('pemenang')->unsigned();
            $table->timestamps();
            $table->foreign('arisan_id')
                ->references('id')
                ->on('arisans')
                ->onUpdate('cascade')
                ->onDelete('cascade');
            $table->foreign('pemenang')
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
        Schema::drop('arisan_mix');
    }
}
