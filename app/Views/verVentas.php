<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ventas</title>
    <!-- Boostrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</head>
<body>
    
    <!-- nav bar -->
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Ventas empleados</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav">
                <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="<?php echo base_url('/') ?>">Home</a>
                </li>
                <li class="nav-item">
                <a class="nav-link" href="<?php echo base_url('ventas') ?>">Ventas Empleados</a>
                </li>
                <li class="nav-item">
                <a class="nav-link" href="#">Pricing</a>
                </li>
                <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    Dropdown link
                </a>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="#">Action</a></li>
                    <li><a class="dropdown-item" href="<?php echo base_url('ventas') ?>">Ventas Empleados</a></li>
                    <li><a class="dropdown-item" href="#">Something else here</a></li>
                </ul>
                </li>
            </ul>
            </div>
        </div>
    </nav>

    <div class="card m-2 p-1">
        <h2 class="text"> Ventas empleados Ver</h2>
        
        <!-- tabla -->
        <table class="table table-striped">
            <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Apellido</th>
                    <th scope="col">Total Ventas</th>
                    <th scope="col">Ventas Monto</th>
                    <th scope="col">Promedio Ventas</th>
                    <th scope="col">Funcionalidad</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach($data as $row): ?>
                    <tr>
                        <th scope="row"><?php echo $row['EMP_ID'] ?></th>
                        <td><?php echo $row['EMP_NOMBRE'] ?></td>
                        <td><?php echo $row['EMP_APELLIDO'] ?></td>
                        <td><?php echo $row['total_ventas'] ?></td>
                        <td><?php echo $row['ventas_monto'] ?></td>
                        <td><?php echo $row['promedio_ventas'] ?></td>
                        <td>
                            <button  class="btn btn-primary" onclick="verVendedor(<?php echo $row['EMP_ID'] ?>)">Ver</button>
                        </td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>

        <br>
        <!-- ver Vendedor  -->
        <div id="vendedor"></div>


        
    </div>
    

    <!-- js -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script>
        function verVendedor(id) {
            $.ajax({
                url: "<?php echo base_url('vendedor/') ?>" + id,
                type: "GET",
                dataType: "json",
                success: function (data) {
                    console.log(data);
                    var html = "<table class='table table-striped'>";
                    html += "<thead>";
                    html += "<tr>";
                    html += "<th scope='col'>ID</th>";
                    html += "<th scope='col'>Cliente</th>";
                    html += "<th scope='col'>Fecha</th>";
                    html += "<th scope='col'>Cantidad Vendida</th>";
                    html += "<th scope='col'>Precio Unitario</th>";
                    html += "<th scope='col'>Accion</th>";
                    html += "</tr>";
                    html += "</thead>";
                    html += "<tbody>";
                    for (var i = 0; i < data.data.length; i++) {
                        html += "<tr>";
                        html += "<th scope='row'>" + data.data[i].CLI_ID + "</th>";
                        html += "<td>" + data.data[i].CLI_NOMBRE + "</td>";
                        html += "<td>" + data.data[i].PED_FECHA + "</td>";
                        html += "<td>" + data.data[i].Cantidad_Vendida + "</td>";
                        html += "<td>" + data.data[i].DET_PRECIO_UNITARIO + "</td>";
                        /* ver modal cliente info */
                        html += "<td>";
                        html += "<button type='button' class='btn btn-primary' data-bs-toggle='modal' data-bs-target='#exampleModal'>Ver Cliente</button>";
                        html += "</tr>";
                    }
                    html += "</tbody>";
                    html += "</table>";

                    /* construir modal */
                    html += "<div class='modal fade' id='exampleModal' tabindex='-1' aria-labelledby='exampleModalLabel' aria-hidden='true'>";
                    html += "<div class='modal-dialog'>";
                    html += "<div class='modal-content'>";
                    html += "<div class='modal-header'>";
                    html += "<h5 class='modal-title' id='exampleModalLabel'>Modal title</h5>";
                    html += "<button type='button' class='btn-close' data-bs-dismiss='modal' aria-label='Close'></button>";
                    html += "</div>";
                    html += "<div class='modal-body'>";
                    /* mostrar info del cliente id recibido */
                    html += id;
                    /* Nombre Cliente */
                    html += "</div>";
                    html += "<div class='modal-footer'>";
                    html += "<button type='button' class='btn btn-secondary' data-bs-dismiss='modal'>Close</button>";
                    html += "</div>";


                    $("#vendedor").html(html);
                }
            });

}
    </script>
    

</body>
</html>