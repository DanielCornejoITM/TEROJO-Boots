<?php
session_start();
if (!isset($_SESSION['ID'])) {
header("Location:../Carrito/Error.php");
}
$Quien=	$_SESSION['ID'];
$Venta=	$_SESSION['IDVenta'];
include '../Conexion.php';
include 'Metodos.php';
  ?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
  <title>Tea Rouge</title>
  <!-- Bootstrap -->
  <link href="../../css/bootstrap.min.css" rel="stylesheet">
  <link rel="shortcut icon" type="image/png" href="../../img/favicon.ico"/>
  <link href="https://fonts.googleapis.com/css?family=Lobster|Merriweather" rel="stylesheet">
  <link href="../../css/general.css" rel="stylesheet">
  <link href="../../css/Logo.css" rel="stylesheet">
  <link href="../../font/flaticon.css" rel="stylesheet">

</head>

<body>
  <?php include "../Sesion/Modal_Sesion.php" ?>


  <nav class="navbar navbar-default">
    <div class="container-fluid">
      <!-- Brand and toggle get grouped for better mobile display -->
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
          <span class="flaticon-menu"></span>
        </button>
        <a class="navbar-brand" href="../../"> <img class="Logito" src="../../img/logo-peque.png" alt=""></a>
      </div>

      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav navbar-right">
          <li><a href="../../"><span class="flaticon-home"></span><br>Home</a></li>
          <li><a href="../Nosotros/"><span class="flaticon-tea-cup"></span><br>Nosotros</a></li>
          <?php if (isset($_SESSION['ID'])) echo "<li><a href='../Carrito'><span class='flaticon-basket'></span><br>Canasto</a></li> "; ?>
          <li><a href="../Tienda/"><span class="flaticon-teapot"></span><br>Tienda</a></li>
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> <span class="flaticon-user"><br> Usuario</span></a>
            <ul class="dropdown-menu">
             <?php
             if (!isset($_SESSION['ID']))
               echo "<li><a href='#' data-toggle='modal' data-target='#exampleModal'>Iniciar Sesion</a></li>";
             else echo "<li><a href='../Sesion/Opciones/Cerrar.php'>Cerrar Sesion</a></li>";

             ?>
           </ul>
         </li>
       </ul>

     </div>
     <!-- /.navbar-collapse -->
   </div>
   <!-- /.container-fluid -->
 </nav>
 <main>
   <div class='container'>
   <div class='row'>
     <div class='col-md-10 col-lg-10 col-lg-offset-1 col-md-offset-1 col-sm-12'>
       <div class="page-header">
     <h1>Su ultima Compra <small><?php echo Nombre($Quien)  ?>  </small> </h1>
   </div>
       <?php
  if ($conn->connect_error) return 0;
  else{

    $sql=" select I.ProductoNom as Producto,P.Cantidad as Cuantos ,I.Precio as Costo,P.Total as Pago from Pedidos P inner join Ventas V on V.VentaID=P.VentaID inner join Inventario I on P.InventarioID=I.InventarioID  where V.VentaID=".$Venta." ;";
    $result1 = $conn->query($sql);
    //Si El numero de columnas de la consulta es 0, retornamos 0
    if ($result1->num_rows > 0){
      echo "

      <div class='panel panel-default'>
        <!-- Default panel contents -->
        <div class='panel-heading text-center'><h3>Tu Compra ".VentaFecha($Quien,$Venta)."</h3></div>

        <!-- Table -->
        <table class='table table-responsive'>
          <tr>
      <th>Nombre del Producto</th>
      <th>Precio</th>
      <th>Cantidad</th>
      <th>Total</th>
      </tr>

      ";
      while($row = $result1->fetch_assoc()) {
        echo "<tr>";
        echo "<td>".$row["Producto"]."</td>";
        echo "<td>".$row["Costo"]."</td>";
        echo "<td>".$row["Cuantos"]."</td>";
        echo "<td>".$row["Pago"]."</td>";
        echo "</tr>";
      }
      echo "</table></div>";
    }
    else echo "No se Encontro Nada";
  }

         ?>




       </div>
</div>
<div class="row">
  <div class="text-center col-md-8 col-sm-12">
    <button class="btn btn-danger" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
      Direccion de Envio
    </button>
    <div class="collapse" id="collapseExample">
      <div class="panel panel-default">
        <div class="panel-body">
          <ul class="list-group">
            <?php
            if ($conn->connect_error) return 0;
            else{
              $sql="select Calle,Numero,Colonia,CP,Ciudad,Estado,Pais from Direcciones where UsuarioID= ".$Quien.";";
              $result1 = $conn->query($sql);
              //Si El numero de columnas de la consulta es 0, retornamos 0
              if ($result1->num_rows > 0){
                while($row = $result1->fetch_assoc()) {
                  echo "<li class='list-group-item'>Calle: ".$row["Calle"]."</li>";
                  echo "<li class='list-group-item'>Numero: ".$row["Numero"]."</li>";
                  echo "<li class='list-group-item'>Colonia: ".$row["Colonia"]."</li>";
                  echo "<li class='list-group-item'>Codigo Postal: ".$row["CP"]."</li>";
                  echo "<li class='list-group-item'>Ciudad: ".$row["Ciudad"]."</li>";
                  echo "<li class='list-group-item'>Estado: ".$row["Estado"]."</li>";
                  echo "<li class='list-group-item'>Pais: ".$row["Pais"]."</li>";
                }
              }
              else echo "No se Encontro Nada";
            }
              $conn-> close();
              ?>

          </ul>
        </div>
      </div>



    </div>

  </div>
  <div class="col-md-4 col-sm-12">
    <h3> Total a Pagar</h3>
    <?php echo "<h2>".VentaTotal($Quien,$Venta)."</h2>";?>
  </div>
</div>


     </div>
   </div>
 </div>
</main>
<br>
<footer class="footer TREED">
  <div class="container text-center">
    <div class="row">
      <h1> Visita Nuestras redes sociales</h1>
      <h2> <a class="Quitar" href="#">Facebook</a></h2>
      <h2> <a  class="Quitar"href="#">Twitter</a></h2>
      <h2> <a  class="Quitar"href="#">Github</a></h2>
      <h2> <a  class="Quitar"href="#">Nosotros</a></h2>
    </div>
    <div class="row right">
      <div class="col-md-3 col-md-offset-10">
        <h1 class="ELobster">Tea Rouge</h1>
      </div>
    </div>
  </div>
</footer>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../../js/bootstrap.min.js"></script>
</body>

</html>
