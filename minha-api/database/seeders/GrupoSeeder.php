<?php

namespace Database\Seeders;

use App\Models\Grupo;
use Illuminate\Database\Seeder;

class GrupoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Grupo::create([
            'nome_grupo' => 'Administrador',
        ]);
        Grupo::create([
            'nome_grupo' => 'Vendedor',
        ]);
        Grupo::create([
            'nome_grupo' => 'Cliente',
        ]);
    }
}
