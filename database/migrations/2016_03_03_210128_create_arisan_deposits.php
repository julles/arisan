<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateArisanDeposits extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('arisans_deposits', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('arisan_detail_id')->unsigned();
            $table->integer('putaran_ke');
            $table->timestamps();
            $table->foreign('arisan_detail_id')
                ->references('id')
                ->on('arisan_details')
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
        Schema::drop('arisans_deposits');
    }
}
