<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Permissao extends Model
{
    protected $table = 'permissoes';
   
    public function grupos()
    {
        return $this->belongsToMany('App\Models\Grupo', 'permissao_grupos', 'id_permissao', 'id_grupo')
            ->withTimestamps()->withPivot('valor');
    }
}
