<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUser extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('usuarios', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('id_grupo')->nullable();
            $table->foreign('id_grupo')
                ->references('id')
                ->on('grupos');
            $table->string('usuario', 200);
            $table->string('email', 100)->unique();
            $table->string('cpf', 14);
            $table->date('nascimento');
            $table->string('endereco', 200);
            $table->string('senha', 40);
            $table->string('token', 60)->nullable();
            $table->softDeletes();
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
        Schema::dropIfExists('usuarios');
    }
}
