<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Equipamentos extends Model
{
    protected $table = 'equipamentos';     // unica config para bd
    protected $fillable = ['descequipamentos', 'serieequipamentos','valorequipamentos'];//habilita gravar bd
    protected $hidden = ['pivot'];
    public function ordem_servico(){
        return $this->belongsToMany('App\Models\ordem_sevico','equipamentos_ordem','id_equipamentos','id_ordemservico')
        ->withTimestamps();
    }
}
