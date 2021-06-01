<?php

namespace Database\Seeders;

use App\Models\Grupo;
use App\Models\Permissao;
use Illuminate\Database\Seeder;

class PermissaoGrupoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $permissoes = Permissao::all();
        Grupo::all()->each(function ($grupo) use ($permissoes) {
            if ($grupo->id == 1) {

                $grupo->permissoes()->attach(
                    $permissoes->pluck('id')->toArray(),
                    ['valor' => 1]
                );
            } else {
                $grupo->permissoes()->attach(
                    $permissoes->pluck('id')->toArray(),
                    ['valor' => 0]
                );
            }
        });
    }
}
