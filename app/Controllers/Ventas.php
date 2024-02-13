<?php

namespace App\Controllers;
use  App\Models\ventasModel;


class Ventas extends BaseController
{
    public function index(): string
    {
        return view('ventas');
    }

    public function ver(): string
    {
        $ventasModel = new ventasModel();
        $data = [
            'data' => $ventasModel->listarVentas()
        ];
        return view('verVentas', $data);
        
    }

    public function verVendedor($id): string
    {
        $ventasModel = new ventasModel();
        $data = [
            'data' => $ventasModel->listarVentasVendedor($id)
        ];
        
        return json_encode($data);
    }
}
