<?php

/* Modelo */
namespace App\Models;
use CodeIgniter\Model;

class ventasModel extends Model{

    protected $table = 'tbl_pedidos';

    protected $primaryKey = 'PED_ID';
    
    protected $returnType = 'array';

    protected $allowedFields = ['PED_ID', 'EMP_ID', 'CLI_ID', 'PED_FECHA', 'PED_TOTAL'];

    /* LISTA EMPLEADOS CON TOTAL DE VENTAS Y PROM VENTAS */
    public function listarVentas(){
        /* SQL */
        $sql = "
            SELECT 
                e.EMP_ID, e.EMP_NOMBRE, e.EMP_APELLIDO,
                COUNT(p.PED_ID) as total_ventas,
                SUM(p.PED_TOTAL) as ventas_monto, 
                AVG(p.PED_TOTAL) as promedio_ventas
            FROM tbl_empleados e
                        INNER JOIN tbl_pedidos p ON e.EMP_ID = p.EMP_ID
                        GROUP BY e.EMP_ID
            ORDER BY ventas_monto DESC;
        ";
        /* Ejecutar SQL */
        $query = $this->db->query($sql);
        /* Resultado */
        return $query->getResultArray();

    }

    /* LISTA VENTAS POR EMPLEADO */
    public function listarVentasVendedor($id){
        /* SQL */
        $sql = "
            SELECT 
                c.CLI_ID,
                c.CLI_NOMBRE,
                p.PED_FECHA,
                d.DET_CANTIDAD as Cantidad_Vendida,
                d.DET_PRECIO_UNITARIO
            FROM tbl_pedidos p
                INNER JOIN tbl_detalle_pedidos d ON p.PED_ID = d.PED_ID
                INNER JOIN tbl_clientes c ON p.CLI_ID = c.CLI_ID
            WHERE p.EMP_ID = $id
            GROUP BY c.CLI_ID, p.PED_FECHA, d.DET_PRECIO_UNITARIO
            ORDER BY d.DET_CANTIDAD DESC;
        ";
        /* Ejecutar SQL */
        $query = $this->db->query($sql);
        /* enviar json */
        return $query->getResultArray();

    }

}