<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOrdemServico extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('ordem_servico', function (Blueprint $table) {
            $table->id();
            $table->date('data')->nullable();
            $table->string('status',45)->nullable();
            $table->date('dataretirada')->nullable();
            $table->string('descproblema',150)->nullable();
            $table->string('senhaequip',50)->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('ordem_servico');
    }
}
