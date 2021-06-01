<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    private $permissoes = [
        'CRIAR_USUARIOS' => '1',
        'LISTAR_USUARIOS' => '2',
        'ATUALIZAR_USUARIOS' => '3',
        'DELETAR_USUARIOS' => '4'
    ];
    private $id_cliente = 2;

    public function __construct()
    {
        $this->middleware('auth', ['only' => ['listar', 'guardar', 'exibir', 'atualizar', 'deletar']]);
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function listar()
    {

        if (Auth::user()->pode($this->permissoes['LISTAR_USUARIOS'])) {
            $usuarios = User::all();
            return response()->json($usuarios, 200);
        } else {
            return response('Sem permissão para acessar o recurso', 403);
        }
    }
    public function login(Request $request)
    {
        $usuario = User::where('email', $request['email'])->first();
        if ($usuario != null && $usuario->senha == sha1($request['senha'])) {
            return response()->json(['Token' => $usuario->token], 200);
        } else {
            return response()->json(['usuario_no_banco' => $usuario, 'email_request' => $request['email'], 'senha_request' => $request['senha']], 403);
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function guardar(Request $request)
    {
        $usuario_autenticado = Auth::user();
        $usuario = User::where('email', $request['email'])->first();

        if ($usuario != null) {
            return response()->json(['message' => 'Usuario já existe.'], 200);
        }
        if ($usuario == null) {
            if ($request->isJson()) {
                $novo_usuario = new User();
                $novo_usuario->id_grupo = $request['id_grupo'];
                $novo_usuario->usuario = $request['usuario'];
                $novo_usuario->email = $request['email'];
                $novo_usuario->cpf = $request['cpf'];
                $novo_usuario->nascimento = $request['nascimento'];
                $novo_usuario->endereco = $request['endereco'];
                $novo_usuario->senha = sha1($request['senha']);
                $novo_usuario->token = Hash::make($request['senha']);
            } else {
                return response()->json(
                    ['error' => 'os dados devem ser enviados no formato JSON'],
                    415
                );
            }
        }
        if ($usuario_autenticado == null) {
            $novo_usuario->id_grupo = $this->id_cliente;
            if ($novo_usuario->save()) {
                return response()->json($novo_usuario, 201);
            } else {
                return response()->json(['error' => 'algum problema na API'], 500);
            }
        }
        if ($usuario_autenticado->pode($this->permissoes['CRIAR_USUARIOS'])) {
            if ($novo_usuario->save()) {
                return response()->json($novo_usuario, 201);
            } else {
                return response()->json(['error' => 'algum problema na API'], 500);
            }
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function exibir($id)
    {
        if (Auth::user()->pode($this->permissoes['LISTAR_USUARIOS'])) {
            $usuario = User::withTrashed()->find($id);
            if ($usuario == null) {
                return response()->json(['error' => 'Usuario nao encontrado'], 200);
            }
            $dados[] = $usuario->toArray();
            return response()->json($usuario, 200);
        } else {
            return response('Sem permissão para acessar o recurso.', 403);
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function atualizar(Request $request, $id)
    {

        if (Auth::user()->pode($this->permissoes['ATUALIZAR_USUARIOS'])) {
            if ($id == null) {
                return response()->json(['error' => 'id na URL é obrigatória'], 400);
            }
            $usuario = User::find($id);
            if ($usuario == null) {
                return response()->json(['error' => 'usuario n encontrado'], 404);
            }
            $count = 0;
            if (isset($request['id_grupo'])) {
                $usuario->id_grupo = $request['id_grupo'];
                $count++;
            }
            if (isset($request['usuario'])) {
                $usuario->usuario = $request['usuario'];
                $count++;
            }
            if (isset($request['email'])) {
                return response()->json(['error' => 'Nao é possivel mudar email'], 415);
            }
            if (isset($request['cpf'])) {
                $count++;
                $usuario->cpf = $request['cpf'];
            }
            if (isset($request['nascimento'])) {
                $usuario->nascimento = $request['nascimento'];
                $count++;
            }
            if (isset($request['endereco'])) {
                $usuario->endereco = $request['endereco'];
                $count++;
            }
            if (isset($request['senha'])) {
                // $count++;
                // $usuario->senha = sha1($request['senha']);
                return response()->json(['error' => 'Nao é possivel mudar senha'], 415);
            }
            if ($count = 0) {
                return response()->json(['alert' => 'Nenhuma informação alterada'], 415);
            }
            if ($usuario->save()) {
                return response()->json($usuario, 201);
            } else {
                return response()->json(['error' => 'algum problema na API'], 500);
            }
        } else {
            return response('Sem permissão para acessar o recurso', 403);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function deletar($id)
    {
        if (Auth::user()->pode($this->permissoes['DELETAR_USUARIOS'])) {
            $usuario = User::find($id);
            $usuario->delete();
            return response()->json(['message' => 'ok'], 200);
        }
    }
}
