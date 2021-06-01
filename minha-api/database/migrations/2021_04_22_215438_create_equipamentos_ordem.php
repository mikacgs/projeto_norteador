<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEquipamentosOrdem extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('equipamentos_ordem', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('id_equipamentos')->unsigned();
            $table->foreign('id_equipamentos')->references('id')->on('equipamentos');
            $table->bigInteger('id_ordemservico')->unsigned();
            $table->foreign('id_ordemservico')->references('id')->on('ordem_servico');
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
        Schema::dropIfExists('equipamentos_ordem');
    }
}
