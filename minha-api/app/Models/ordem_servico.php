<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ordem_servico extends Model
{
    protected $table = 'ordem_servico';     // unica config para bd
    protected $fillable = ['data', 'status', 'dataretirada', 'descproblema', 'senhaequip'];
    protected $hidden = ['pivot'];
    public function equipamentos()
    {
        return $this->belongsToMany('App\Models\Equipamentos', 'equipamentos_ordem', 'id_ordemservico', 'id_equipamentos')
            ->withTimestamps();
    }
}
