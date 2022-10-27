 <%@page import="java.sql.ResultSet"%>
<%@page import="modelo.Conexion"%>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%-- 
    Document   : maestro_detalle_ventas
    Created on : 22/10/2022, 12:29:47 PM
    Author     : sergi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.clientes" %>
<%@page import="modelo.empleados" %>
<%@page import="modelo.productos" %>
<%@page import="java.util.HashMap" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <body>
        <div class="container">
            <div class="row">
              <div class="col">
                <label class="form-label">No. Factura</label>
                <input type="text" class="form-control" id="txt_no_factura" name="txt_no_factura">
                <label class="form-label">Serie</label>
                <input type="text" class="form-control" id="txt_serie" name="txt_serie">
                <label class="form-label">Fecha</label>
                <input type="date" class="form-control" id="txt_date" name="txt_date">
              </div>
              <div class="col">
               <label class="form-label">Cliente</label><a href="clientes.jsp">Agregar Cliente</a>
                <select id="slc_cliente" class="form-select">
                    <option>--  Elija Cliente --</option>
                <%
                clientes Cliente;
                Cliente = new clientes();
                HashMap<String,String> drop = Cliente.drop_cliente();
                for (String i: drop.keySet()){
                out.println("<option value='"+ i +"'>" +drop.get(i)+ "</option>");
                    }
                %>
                </select>
                
                <label class="form-label">Empleado</label><a href="clientes.jsp">Empleado</a>
                <select id="slc_empleado" class="form-select">
                    <option>--  Elija Empleado --</option>
                <%
                empleados Empleado;
                Empleado = new empleados();
                HashMap<String,String> drop_e = Empleado.drop_empleado();
                for (String i: drop_e.keySet()){
                out.println("<option value='"+ i +"'>" +drop_e.get(i)+ "</option>");
                    }
                %>
                </select>
                <label class="form-label">Fecha de ingreso</label>
                <input type="date" class="form-control" id="txt_fecha_ingreso" name="txt_fecha_ingreso">
              </div>
            </div>
        </div>
        <div class="container">
            <table class="table table-striped">
                <thead>
                    <tr>
                    <th>Id Producto</th>
                    <th>Cantidad</th>
                    <th>Descripcion</th>
                    <th>Precio unitario</th>
                    <th>Total</th>
                    </tr>
                </thead>
                <tbody id="tbl_venta">
       
                </tbody>
            </table>
            <div class="d-grid gap-2 col-2 mx-auto">
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal_productos" onclick="limpiar()">Agregar Producto</button>
            </div>
        </div>
        <div class="modal fade" tabindex="-1" id="modal_productos" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title">Agregar Producto</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <form>                 
                <label class="form-label">Id Producto</label>
                <input type="text" class="form-control" id="txt_idproducto" name="txt_idproducto" readonly>
                <label class="form-label">Cantidad</label>
                <input type="text" class="form-control" id="txt_cantidad" name="txt_cantidad" onchange="total()">
                <label class="form-label">Descripcion</label>
                <input type="text" class="form-control" id="txt_descripcion_producto" name="txt_descripcion_producto" readonly>
                <label class="form-label">Precio Unitario</label>
                <input type="text" class="form-control" id="txt_precio_unitario" name="txt_precio_unitario" readonly>
                <label class="form-label">Total</label>
                <input type="text" class="form-control" id="txt_total" name="txt_total">
                <label></label>
                </form>
                 <!-- <form>
                      <input type="text" class="form-control" id="txt_buscar" name="txt_buscar" placeholder="Buscar por descripcion del producto"> 
                      <button class="btn btn-primary" value="Buscar">Buscar</button>
                  </form>-->
            <table class="table table-striped">
            <thead>
              <tr>
                <th scope="col">Id</th>
                <th scope="col">Descripcion</th>
                <th scope="col">Precio Unitario</th>
              </tr>
            </thead>
            <tbody id="tabla_productos">
                <%
                productos producto = new productos();
                DefaultTableModel tabla = new DefaultTableModel();
                tabla = producto.leer_tabla();
                for (int t =0;t<tabla.getRowCount();t++){
                    out.println("<tr>");
                    out.println("<td>"+ tabla.getValueAt(t, 0) +"</td>");
                    out.println("<td>"+ tabla.getValueAt(t, 1) +"</td>");
                    out.println("<td>"+ tabla.getValueAt(t, 2) +"</td>");
                    out.println("</tr>");
                    }
                %>
            </tbody>
            </table>
              </div>
              <div class="modal-footer">
                
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" onclick="celda()">Save changes</button>                
              </div>
            </div>
          </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        <script type="text/javascript">
            var table = document.getElementById('tabla_productos');

                for(var i = 0; i < table.rows.length; i++)
                {
                    table.rows[i].onclick = function()
                    {
                        rIndex = this.rowIndex;
                        document.getElementById("txt_idproducto").value = this.cells[0].innerHTML;
                        document.getElementById("txt_descripcion_producto").value = this.cells[1].innerHTML;
                        document.getElementById("txt_precio_unitario").value = this.cells[2].innerHTML;
                    };
                }
                function limpiar(){
                $("#txt_idproducto").val(0);
                $("#txt_descripcion_producto").val('');
                $("#txt_precio_unitario").val('');
                $("#txt_cantidad").val('');
                $("#txt_total").val('');
    }

                function total(){
                    var precio_u = document.getElementById("txt_precio_unitario");
                    var cant = document.getElementById("txt_cantidad");
                    var total = precio_u.value * cant.value;
                    document.getElementById("txt_total").value = total;
            }
                function celda(){
                    tbl = document.getElementById("tbl_venta");
                    row = tbl.insertRow(0);      
                    var newCell = row.insertCell(0);
                    newCell.innerHTML= document.getElementById("txt_idproducto").value;
                    var newCell = row.insertCell(1);
                    newCell.innerHTML= document.getElementById("txt_cantidad").value;
                    var newCell = row.insertCell(2);
                    newCell.innerHTML= document.getElementById("txt_descripcion_producto").value;
                    var newCell = row.insertCell(3);
                    newCell.innerHTML= document.getElementById("txt_precio_unitario").value;
                    var newCell = row.insertCell(4);
                    newCell.innerHTML= document.getElementById("txt_total").value;
                    }
        </script>

    </body>
</html>
