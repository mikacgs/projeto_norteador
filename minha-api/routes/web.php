<?php

/** @var \Laravel\Lumen\Routing\Router $router */

use FastRoute\Route;

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$router->get('/', function () use ($router) {
    return $router->app->version();
});
$router->group(['prefix' => '/usuario'], function () use ($router) {
    $router->get('/', ['as' => 'usuario.list', 'uses' => 'UserController@listar']);
    $router->post('/', ['as' => 'usuario.create', 'uses' => 'UserController@guardar']);
    $router->get('/{id}', ['as' => 'usuario.show', 'uses' => 'UserController@exibir']);
    $router->put('/{id}', ['as' => 'usuario.update', 'uses' => 'UserController@atualizar']);
    $router->delete('/{id}', ['as' => 'usuario.delete', 'uses' => 'UserController@deletar']);
});

$router->post('/login', ['as' => 'usuario.login', 'uses' => 'UserController@login']);

$router->group(['prefix' => '/grupo'], function () use ($router) {
    $router->get('/', ['as' => 'grupo.list', 'uses' => 'GrupoController@listar']);
    $router->post('/', ['as' => 'grupo.create', 'uses' => 'GrupoController@guardar']);
    $router->put('/{id}', ['as' => 'grupo.create', 'uses' => 'GrupoController@atualizar']);
    $router->post('/{id}', ['as' => 'grupo.update', 'uses' => 'GrupoController@autorizar']);
    $router->delete('/{id}', ['as' => 'grupo.delete', 'uses' => 'GrupoController@desautorizar']);
});

$router->get('/permissao', ['as' => 'permissao.list', 'uses' => 'GrupoController@listar_permissoes']);



$router->get('/equipamentos', ['as' => 'equipamentos.all', 'uses' => 'EquipamentosController@all']);
//rotas necessarias para cada entidade - urls
$router->post('/equipamentos', ['as' => 'equipamentos.post', 'uses' => 'EquipamentosController@store']);
$router->put('/equipamentos/{id}', ['as' => 'equipamentos.put', 'uses' => 'EquipamentosController@update']);
$router->delete('/equipamentos/{id}', ['as' => 'equipamentos.delete', 'uses' => 'EquipamentosController@destroy']);

$router->get('/ordem_servico', ['as' => 'ordem_servico.all', 'uses' => 'ordem_servicoController@all']);
//rotas necessarias para cada entidade - urls
$router->post('/ordem_servico', ['as' => 'ordem_servico.post', 'uses' => 'ordem_servicoController@store']);
$router->put('/ordem_servico/{id}', ['as' => 'ordem_servico.put', 'uses' => 'ordem_servicoController@update']);
$router->delete('/ordem_servico/{id}', ['as' => 'ordem_servico.delete', 'uses' => 'ordem_servicoController@destroy']);
