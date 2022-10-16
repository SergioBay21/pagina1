<%-- 
    Document   : proveedores
    Created on : 10/10/2022, 02:47:19 PM
    Author     : sergi
--%>

<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.proveedores" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Proveedores</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <header>
        <div class="container">
        <h1>Formulario Proveedores</h1>
        </div>
    </header>
    <div class="container">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <div class="container-fluid">
        <a class="navbar-brand" href="#">Navbar</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="#">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="clientes.jsp">Abrir Clientes</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
        </div>
    <body>
        <div class="container">
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal_proveedor" onclick="limpiar()">
        Agregar Proveedor
        </button>
    <!-- Modal -->
    <div class="modal fade" id="modal_proveedor" tabindex="-1" aria-labelledby="modal_proveedor" data-bs-backdrop="static" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Agregar Cliente</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
              <form action="sr_proveedores" method="post">
        <label for="lbl_id">id</label>
        <input  type="text" name="txt_id" id="txt_id" value="0" readonly class="form-control">
        <label for="lbl_nombre_proveedor">Nombres</label>
        <input  type="text" name="txt_nombre_proveedor" id="txt_nombre_proveedor" class="form-control">
        <label for="lbl_nit">Nit</label>
        <input  type="text" name="txt_nit_proveedor" id="txt_nit_proveedor" class="form-control">
        <label for="lbl_direccion">Direccion</label>
        <input  type="text" name="txt_direccion_proveedor" id="txt_direccion_proveedor" class="form-control">
        <label for="lbl_telefono">Telefono</label>
        <input  type="text" name="txt_telefono_proveedor" id="txt_telefono_proveedor" class="form-control">   
        <div class="modal-footer">
            <button name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-primary">Agregar</button>
            <button name="btn_modificar" id="btn_modificar" value="modificar" class="btn btn-success">Modificar</button>
            <button name="btn_eliminar" id="btn_eliminar" value="eliminar" class="btn btn-danger">Eliminar</button>
        </div>
        </form>
                   
                </div>
          </div>
        </div>
      </div>
        <table border="1" class="table table-striped">
            <thead>
                <tr>
                <th>Id</th>
                <th>Nombre</th>
                <th>Nit</th>
                <th>Direccion</th>
                <th>Telefono</th>
                </tr>
            </thead>
            <tbody id="tbl_clientes">
        <% 
        proveedores proveedor = new proveedores();
        DefaultTableModel tabla = new DefaultTableModel();
        tabla = proveedor.leer();
        for (int t =0;t<tabla.getRowCount();t++){
                    out.println("<tr>");
                    out.println("<td>"+ tabla.getValueAt(t, 0) +"</td>");
                    out.println("<td>"+ tabla.getValueAt(t, 1) +"</td>");
                    out.println("<td>"+ tabla.getValueAt(t, 2) +"</td>");
                    out.println("<td>"+ tabla.getValueAt(t, 3) +"</td>");
                    out.println("<td>"+ tabla.getValueAt(t, 4) +"</td>");
                    out.println("</tr>");
            }
        %>
      
            </tbody>
        </table>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        <script type="text/javascript">
            function limpiar(){
                $("#txt_id").val(0);
                $("#txt_nombre_proveedor").val('');
                $("#txt_nit_proveedor").val('');
                $("#txt_direccion_proveedor").val('');
                $("#txt_telefono_proveedor").val('');
    }
            var table = document.getElementById('tbl_clientes');
                
                for(var i = 0; i < table.rows.length; i++)
                {
                    table.rows[i].onclick = function()
                    {
                         //rIndex = this.rowIndex;
                         document.getElementById("txt_id").value = this.cells[0].innerHTML;
                         document.getElementById("txt_nombre_proveedor").value = this.cells[1].innerHTML;
                         document.getElementById("txt_nit_proveedor").value = this.cells[2].innerHTML;
                         document.getElementById("txt_direccion_proveedor").value = this.cells[3].innerHTML;
                         document.getElementById("txt_telefono_proveedor").value = this.cells[4].innerHTML;
                         $("#modal_proveedor").modal('show');
                    };
                }
        </script>
    </body>
    <footer class="text-center text-white fixed-bottom" style="background-color: #BFBFBF;">
  <!-- Grid container -->
  <div class="container p-4"></div>
  <!-- Grid container -->

  <!-- Copyright -->
  <div class="text-center p-3">
    © 2022 Copyright:
    <a class="text-white" href="https://okdiario.com/img/2022/01/21/5-rasgos-que-definen-la-personalidad-de-los-gatos.jpg">Sergio Bay</a>
  </div>
  <!-- Copyright -->
</footer>
</html>
