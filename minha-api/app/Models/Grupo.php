<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Grupo extends Model
{
    public function permissoes()
    {
        return $this->belongsToMany('App\Models\Permissao', 'permissao_grupos', 'id_grupo', 'id_permissao')
            ->withTimestamps()->withPivot('valor');
    }
}
