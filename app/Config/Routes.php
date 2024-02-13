<?php

use CodeIgniter\Router\RouteCollection;

/**
 * @var RouteCollection $routes
 */
$routes->get('/', 'Home::index');

/* vista ventas empleados */
$routes->get('ventas', 'Ventas::index');

//ver empleados
$routes->get('verVentas', 'Ventas::ver');

//ver empleados
$routes->get('vendedor/(:num)', 'Ventas::verVendedor/$1');

//ver detalle cliente
