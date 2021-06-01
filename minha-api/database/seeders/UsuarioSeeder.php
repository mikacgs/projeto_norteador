<?php

namespace Database\Seeders;

use App\Models\User;
use App\Models\Usuario;
use Illuminate\Database\Seeder;

class UsuarioSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        User::create([
            'id_grupo' => 1,
            'usuario' => 'Michael',
            'email' => 'mika@email.com',
            'cpf' => '000.000.000-00',
            'nascimento' => '2000-04-05',
            'endereco' => 'Rua exemplo nº1',
            'senha' => sha1('123456'),
            'token' => '$2y$10$IRy5L6kAncmvA5gdPZ1BYOVVlxFaNvRusuXDAV8mBpQsttW52LKhW'
        ]);
        User::create([
            'id_grupo' => 2,
            'usuario' => 'Marcio',
            'email' => 'marcio@email.com',
            'cpf' => '000.000.000-00',
            'nascimento' => '2000-04-05',
            'endereco' => 'Rua exemplo nº1',
            'senha' => sha1('123456'),
            'token' => 'desprotegido'
        ]);
        User::create([
            'id_grupo' => 3,
            'usuario' => 'Guilherme',
            'email' => 'guilerme@email.com',
            'cpf' => '000.000.000-00',
            'nascimento' => '2000-04-05',
            'endereco' => 'Rua exemplo nº1',
            'senha' => sha1('123456'),
            'token' => 'sem_token'
        ]);
    }
}
