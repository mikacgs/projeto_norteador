<?php

namespace App\Models;

use Illuminate\Auth\Authenticatable;
use Illuminate\Contracts\Auth\Access\Authorizable as AuthorizableContract;
use Illuminate\Contracts\Auth\Authenticatable as AuthenticatableContract;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Laravel\Lumen\Auth\Authorizable;

class User extends Model implements AuthenticatableContract, AuthorizableContract
{
    use Authenticatable, Authorizable, HasFactory, SoftDeletes;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email',
    ];

    /**
     * The attributes excluded from the model's JSON form.
     *
     * @var array
     */
    protected $hidden = [
        'senha', 'token', 'created_at', 'updated_at'
    ];
    protected $table = 'usuarios';


    public function pode($action = null)
    {
        if ($action == null) {
            return false;
        }
        $grupo = Grupo::find($this->id_grupo);
        $permissao = $grupo->permissoes->find($action);
        if ($permissao == null) {
            return false;
        }
        return $permissao->pivot->valor;
    }
}
