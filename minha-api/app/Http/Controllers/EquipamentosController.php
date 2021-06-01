<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Equipamentos;

class EquipamentosController extends Controller
{

    public function all()
    {
        $equipamentos = Equipamentos::all();
        //dd($equipamentos); //drop down pega todo banco e organiza
        return response () -> json($equipamentos, 200);

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
        if(!$request->isJson()) return response()->json(['error'=> 'os dados devem ser enviados no formato JSON'],415);
        //dd($request->json()->all());
        //$dados = $request->json()->all();
        $equipamentos = Equipamentos::create($request->json()->all());
        return response()->json($equipamentos, 201);
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
        if($id==null) return response()->json(['error'=> 'ID na url é obrigatória'],400);
        $equipamentos = Equipamentos::find($id);
        if($equipamentos==null) return response()->json(['error'=> 'entidade não encontrada'],404);
        
        $dados = $request -> json()->all();
        if($request->Json()->has('descequipamentos')) $equipamentos->descequipamentos = $dados ['descequipamentos'];
        if($request->Json()->has('serieequipamentos')) $equipamentos->serieequipamentos = $dados ['serieequipamentos'];
        if($request->Json()->has('valorequipamentos')) $equipamentos->valorequipamentos = $dados ['valorequipamentos'];
      
        if($equipamentos->save()) return response()->json($equipamentos, 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        if($id==null) return response()->json(['error'=> 'ID na url é obrigatória'],400);
        $equipamentos = Equipamentos::find($id);
        if($equipamentos->delete()) return response()->json(['OK'], 200);
    }
}
