<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ordem_servico;

class ordem_servicoController extends Controller
{

    public function all()
    {
        $ordem_servico = ordem_servico::all();
        //dd($ordem_servico); //drop down pega todo banco e organiza
        foreach ($ordem_servico as $ordem) {
            $dados[] = ["ordem" => $ordem, "equipamentos" => $ordem->equipamentos];
        }
        return response()->json($ordem_servico, 200);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        if (!$request->isJson()) return response()->json(['error' => 'os dados devem ser enviados no formato JSON'], 415);
        //$dados = $request->json()->all();
        
        $ordem_servico = ordem_servico::create($request->json()->all());

        return response()->json($ordem_servico, 201);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        if ($id == null) return response()->json(['error' => 'ID na url é obrigatória'], 400);
        $ordem_servico = ordem_servico::find($id);
        if ($ordem_servico == null) return response()->json(['error' => 'entidade não encontrada'], 404);

        $dados = $request->json()->all();
      
        if ($request->Json()->has('descproblema')) $ordem_servico->descproblema = $dados['descproblema'];
        if ($request->Json()->has('data')) $ordem_servico->data = $dados['data'];
        if ($request->Json()->has('status')) $ordem_servico->status = $dados['status'];
        if ($request->Json()->has('dataretirada')) $ordem_servico->dataretirada = $dados['dataretirada'];
        if ($request->Json()->has('senhaequip')) $ordem_servico->senhaequip = $dados['senhaequip'];

        if ($ordem_servico->save()) return response()->json($ordem_servico, 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        if ($id == null) return response()->json(['error' => 'ID na url é obrigatória'], 400);
        $ordem_servico = ordem_servico::find($id);
        if ($ordem_servico->delete()) return response()->json(['OK'], 200);
    }
}
