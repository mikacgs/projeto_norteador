<?php

namespace Database\Seeders;

use App\Models\Permissao;
use Illuminate\Database\Seeder;

class PermissaoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Permissao::create([
            'nome_permissao' => 'Criar usuário',
        ]);
        Permissao::create([
            'nome_permissao' => 'Listar usuário',
        ]);
        Permissao::create([
            'nome_permissao' => 'Alterar usuário',
        ]);
        Permissao::create([
            'nome_permissao' => 'Deletar usuário',
        ]);
        Permissao::create([
            'nome_permissao' => 'Gerenciar grupos',
        ]);
        Permissao::create([
            'nome_permissao' => 'Listar Grupos',
        ]);
        Permissao::create([
            'nome_permissao' => 'Listar Permissoes',
        ]);
    }
}
