<?php

namespace App\Http\Controllers;

use App\Models\Grupo;
use App\Models\Permissao;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class GrupoController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    private $permissoes = [
        'GERENCIAR_GRUPOS' => '5',
        'LISTAR_GRUPOS' => '6',
        'LISTAR_PERMISSOES' => '7'
    ];

    public function listar()
    {
        if (Auth::user()->pode($this->permissoes['LISTAR_GRUPOS'])) {
            $usuarios = Grupo::all();
            return response()->json($usuarios, 200);
        } else {
            return response('Sem permissão para acessar o recurso', 403);
        }
    }
    public function guardar(Request $request)
    {
        $usuario_autenticado = Auth::user();
        $grupo = Grupo::where('nome_grupo', $request['nome_grupo'])->first();

        if ($grupo == null) {
            if ($request->isJson()) {
                $grupo = new Grupo();
                $grupo->nome_grupo = $request['nome_grupo'];
            } else {
                return response()->json(
                    ['error' => 'os dados devem ser enviados no formato JSON'],
                    415
                );
            }
        } else {
            return response()->json($grupo, 200);
        }
        if ($usuario_autenticado == null) {
            return response()->json(['error' => 'Sem permissão para acessar o recurso'], 403);
        }
        if ($usuario_autenticado->pode($this->permissoes['GERENCIAR_GRUPOS'])) {
            if ($grupo->save()) {
                return response()->json($grupo, 201);
            } else {
                return response()->json(['error' => 'algum problema na API'], 500);
            }
        } else {
            return response()->json(['error' => 'Sem permissão para acessar o recurso'], 403);
        }
    }
    public function atualizar(Request $request, $id)
    {
        $usuario_autenticado = Auth::user();
        $grupo = Grupo::find($id)->first();

        if ($grupo == null) {
            return response()->json(
                ['error' => 'não encontrado'],
                404
            );
        } else {
            if ($request->isJson()) {
                if ($usuario_autenticado == null) {
                    return response()->json(['error' => 'Sem permissão para acessar o recurso'], 403);
                }
                $grupo->nome_grupo = $request['nome_grupo'];
                if ($usuario_autenticado->pode($this->permissoes['GERENCIAR_GRUPOS'])) {
                    if ($grupo->save()) {
                        return response()->json($grupo, 201);
                    } else {
                        return response()->json(['error' => 'algum problema na API'], 500);
                    }
                } else {
                    return response()->json(['error' => 'Sem permissão para acessar o recurso'], 403);
                }
            } else {
                return response()->json(
                    ['error' => 'os dados devem ser enviados no formato JSON'],
                    415
                );
            }
        }
    }

    public function autorizar(Request $request, $id)
    {
        $usuario_autenticado = Auth::user();
        $grupo = Grupo::find($id);
        if ($grupo == null) {
            return response()->json(['error' => 'Grupo não encontrado'], 404);
        }
        if ($usuario_autenticado == null) {
            return response()->json(['error' => 'Sem permissão para acessar o recurso'], 403);
        }
        $permissao = Permissao::find($request['id_permissao']);

        if ($permissao == null) {
            return response()->json(['error' => 'Permissao não encontrada'], 404);
        }
        if ($usuario_autenticado->pode($this->permissoes['GERENCIAR_GRUPOS'])) {
            if ($grupo->permissoes->find($permissao->id)) {
                $grupo->permissoes()->detach($permissao);
                $grupo->permissoes()->attach($permissao, ['valor' => 1]);
                return response()->json('ok', 200);
            }
            $grupo->permissoes()->attach($permissao, ['valor' => 1]);
            return response()->json('ok', 200);
        } else {
            return response()->json(['error' => 'Sem permissão para acessar o recurso'], 403);
        }
    }
    public function desautorizar(Request $request, $id)
    {
        $usuario_autenticado = Auth::user();
        $grupo = Grupo::find($id);
        if ($grupo == null) {
            return response()->json(['error' => 'Grupo não encontrado'], 404);
        }
        if ($usuario_autenticado == null) {
            return response()->json(['error' => 'Sem permissão para acessar o recurso'], 403);
        }
        $permissao = Permissao::find($request['id_permissao']);
        if ($permissao == null) {
            return response()->json(['error' => 'Permissao não encontrada'], 404);
        }
        if ($usuario_autenticado->pode($this->permissoes['GERENCIAR_GRUPOS'])) {
            $grupo->permissoes()->detach($permissao);
        } else {
            return response()->json(['error' => 'Sem permissão para acessar o recurso'], 403);
        }
    }
    public function exibir($id)
    {
        if (Auth::user()->pode($this->permissoes['LISTAR_GRUPOS'])) {
            $grupo = Grupo::find($id);
            if ($grupo == null) {
                return response()->json(['error' => 'Grupo nao encontrado'], 200);
            }
            $dados[] = $grupo->toArray();
            return response()->json($grupo, 200);
        } else {
            return response('Sem permissão para acessar o recurso.', 403);
        }
    }
    public function listar_permissoes()
    {
        $permissoes = Permissao::all();
        if (Auth::user()->pode($this->permissoes['LISTAR_PERMISSOES'])) {
            return response()->json($permissoes, 200);
        } else {
            return response('Sem permissão para acessar o recurso.', 403);
        }
    }
}
