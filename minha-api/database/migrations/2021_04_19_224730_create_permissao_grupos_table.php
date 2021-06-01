<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePermissaoGruposTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('permissao_grupos', function (Blueprint $table) {
            $table->unsignedBigInteger('id_grupo')->nullable();
            $table->foreign('id_grupo')
                ->references('id')
                ->on('grupos');
            $table->unsignedBigInteger('id_permissao')->nullable();
            $table->foreign('id_permissao')
                ->references('id')
                ->on('permissoes');
            $table->boolean('valor')->default(false);
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
        Schema::dropIfExists('permissao_grupos');
    }
}
