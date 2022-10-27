<%-- 
    Document   : clientes
    Created on : 10/10/2022, 02:47:07 PM
    Author     : sergi
--%>

<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.clientes" %>
<%@page import="java.util.HashMap" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clientes</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <header>
        <nav class="navbar" style="background-color: #7ACBEB">
        <div class="container">
        <a class="navbar-brand" href="#">
        <img src="despensafelizlogo.png" alt="" width="68" height="52">
      </a>
    </div>
  </nav>
    </header>

    <body>    
            <!-- Button trigger modal -->
    <div class="container">
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal_cliente" onclick="limpiar()">
        Agregar Ciente
        </button>
    <!-- Modal -->
    <div class="modal fade" id="modal_cliente" tabindex="-1" aria-labelledby="modal_cliente" data-bs-backdrop="static" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Agregar Cliente</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="location.reload()"></button>
          </div>
          <div class="modal-body">
              <form class="form-group" action="sr_clientes" method="post">
                <label for="lbl_id">id</label>
                <input  type="text" name="txt_id" id="txt_id" class="form-control" value="0" readonly>
                <label for="lbl_nombres">Nombres</label>
                <input  type="text" name="txt_nombres" id="txt_nombres" class="form-control">
                <label for="lbl_apellidos">Apellidos</label>
                <input  type="text" name="txt_apellidos" class="form-control" id="txt_apellidos">
                <label for="lbl_nit">Nit</label>   
                <input  type="text" name="txt_nit" id="txt_nit" class="form-control">
                <label for="lbl_nit">Genero</label>
                <select name="drop_genero" id="drop_genero" class="form-control">
                    <option value="0">Femenino</option>
                    <option value="1">Maculino</option>
                </select>
                <label for="lbl_telefono">Telefono</label>
                <input  type="text" name="txt_telefono" id="txt_telefono" class="form-control">
                <label for="lbl_nit">Correo Electronico</label>
                <input  type="text" name="txt_email" id="txt_email" class="form-control">
                <label for="lbl_nit">Fecha de Ingreso</label>
                <input  type="date" name="txt_date" id="txt_date" class="form-control">
                <div class="modal-footer">
                    <button name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-primary">Agregar</button>
                    <button name="btn_modificar" id="btn_modificar" class="btn btn-success" value="modificar">Modificar</button>
                    <button name="btn_eliminar" id="btn_eliminar" class="btn btn-danger" value="eliminar">Eliminar</button>
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
                <th>Nombres</th>
                <th>Apellidos</th>
                <th>Nit</th>
                <th>Genero</th>
                <th>Telefono</th>
                <th>Correo Electronico</th>
                <th>Fecha de Ingreso</th>
                </tr>
            </thead>
            <tbody id="tbl_clientes">
        <% 
        clientes Cliente = new clientes();
        DefaultTableModel tabla = new DefaultTableModel();
        tabla = Cliente.leer();
        for (int t =0;t<tabla.getRowCount();t++){
                    out.println("<tr>");
                    out.println("<td>"+ tabla.getValueAt(t, 0) +"</td>");
                    out.println("<td>"+ tabla.getValueAt(t, 1) +"</td>");
                    out.println("<td>"+ tabla.getValueAt(t, 2) +"</td>");
                    out.println("<td>"+ tabla.getValueAt(t, 3) +"</td>");
                    out.println("<td>"+ tabla.getValueAt(t, 4) +"</td>");
                    out.println("<td>"+ tabla.getValueAt(t, 5) +"</td>");
                    out.println("<td>"+ tabla.getValueAt(t, 6) +"</td>");
                    out.println("<td>"+ tabla.getValueAt(t, 7) +"</td>");
                    out.println("</tr>");
            }
        %>
      
            </tbody>
        </table>
        <a href="maestro_detalle_ventas.jsp">Maestro detalle</a>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        <script type="text/javascript">
            function limpiar(){
                $("#txt_id").val(0);
                $("#txt_nombres").val('');
                $("#txt_apellidos").val('');
                $("#txt_nit").val('');
                $("#drop_genero").val('0');
                $("#txt_telefono").val('');
                $("#txt_email").val('');
                $("#txt_date").val('');
    }
            var table = document.getElementById('tbl_clientes');
                
                for(var i = 0; i < table.rows.length; i++)
                {
                    table.rows[i].onclick = function()
                    {
                         
                         //rIndex = this.rowIndex;
                         document.getElementById("txt_id").value = this.cells[0].innerHTML;
                         document.getElementById("txt_nombres").value = this.cells[1].innerHTML;
                         document.getElementById("txt_apellidos").value = this.cells[2].innerHTML;
                         document.getElementById("txt_nit").value = this.cells[3].innerHTML;
                         if(this.cells[4].innerHTML = 0){
                             document.getElementById("drop_genero").value = 0;       
                         } else{
                             document.getElementById("drop_genero").value = 1;
                         }
                         document.getElementById("txt_telefono").value = this.cells[5].innerHTML;
                         document.getElementById("txt_email").value = this.cells[6].innerHTML;
                         document.getElementById("txt_date").value = this.cells[7].innerHTML;
                         $("#modal_cliente").modal('show');
                    };
                }
        </script>
        </div>
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
