<%-- 
    Document   : index
    Created on : Oct 9, 2022, 7:52:21 PM
    Author     : SistemasU
--%>
<%@page import="modelo.marca"%>
<%@page import="modelo.producto"%>
<%@page import="java.util.HashMap"%>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Producto</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    </head>
    <body>
        <h1>Formulario Productos</h1>
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal_producto" onclick="limpiar()">Nuevo</button>
        <button type="button" name="btn_marcas" id="btn_marcas"  onclick="location.href='marca.jsp';" class="btn btn-primary">Marcas</button>
        <div class="container">
              <div class="modal" id="modal_producto">
            <div class="modal-dialog">
            <div class="modal-content">
      
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Formulario Producto</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
        
                <!-- Modal body -->
                <div class="modal-body">    
        <form action="sr_producto" method="post" class="form-group">
                <label for="lbl_id"><b>ID:</b></label>
                <input type="text" name="txt_id" id="txt_id" class="form-control" value="0" readonly>
                <label for="lbl_producto"><b>Producto:</b></label>
                <input type="text" name="txt_producto" id="txt_producto" class="form-control" placeholder="Ejemplo P001" pattern="P[0-9]{3}" required>
                <label for="lbl_drop_marcas"><b>Marca:</b></label>
                <select name="drop_marcas" id="drop_marcas" class="form-control">
                    <%
                       marca Marcas = new marca();
                       HashMap<String,String> drop = Marcas.drop_marcas();
                       for (String i: drop.keySet()){
                            out.println("<option value='" + i + "'>" + drop.get(i) + "</option>");
                        }
                       
                     %>
                    
                </select>
                <label for="lbl_descripcion"><b>Descripcion:</b></label>
                <input type="text" name="txt_descripcion" id="txt_descripcion" class="form-control" placeholder="Ejemplo Laptop HP" required>
                <label for="lbl_imagen"><b>Imagen:</b></label>
                <input type="text" name="txt_imagen" id="txt_imagen" class="form-control" placeholder="Ejemplo Imagen">
                <label for="lbl_precio_costo"><b>Precio Costo:</b></label>
                <input type="text" name="txt_precio_costo" id="txt_precio_costo" class="form-control" placeholder="Ejemplo 999.99" required>
                <label for="lbl_precio_venta"><b>Precio Venta:</b></label>
                <input type="text" name="txt_precio_venta" id="txt_precio_venta" class="form-control" placeholder="Ejemplo 999.99" required>
                <label for="lbl_existencia"><b>Existencia:</b></label>
                <input type="text" name="txt_existencia" id="txt_existencia" class="form-control" placeholder="Ejemplo 0001" required>
                <label for="lbl_fecha_ingreso"><b>Fecha de Ingreso:</b></label>
                <input type="datetime" name="txt_fecha_ingreso" id="txt_fecha_ingreso" class="form-control" placeholder="Ejemplo 12-12-1999" >
                
                     <br>
                     <button name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-primary">Guardar</button>
                     <button name="btn_modificar" id="btn_modificar" value="modificar" class="btn btn-success">Modificar</button>
                     <button name="btn_eliminar" id="btn_eliminar" value="eliminar" class="btn btn-danger" onclick="javascript:if(!confirm('¿Desea Eliminar?'))return false">Eliminar</button>
                     <button type="button" class="btn btn-warning" data-dismiss="modal">Cerrar</button>
            </form>
        </div>
        
      </div>
    </div>
  </div>
    <table class="table table-striped">
    <thead>
      <tr>
        <th>Producto</th>
        <th>Descripcion</th>
        <th>Imagen</th>
        <th>Precio Costo</th>
        <th>Precio Venta</th>
        <th>Existencia</th>
        <th>Fecha Ingreso</th>
        <th>Marca</th>
      </tr>
    </thead>
    <tbody id="tbl_producto">
        <%
            producto Producto = new producto();
            DefaultTableModel tabla = new DefaultTableModel();
            tabla = Producto.leer();
            for (int t=0;t<tabla.getRowCount();t++){
                out.println("<tr data-id=" + tabla.getValueAt(t,0) + " data-id_p=" + tabla.getValueAt(t,9) + " >");
                out.println("<td>" + tabla.getValueAt(t,1) + "</td>");
                out.println("<td>" + tabla.getValueAt(t,2) + "</td>");
                out.println("<td>" + tabla.getValueAt(t,3) + "</td>");
                out.println("<td>" + tabla.getValueAt(t,4) + "</td>");
                out.println("<td>" + tabla.getValueAt(t,5) + "</td>");
                out.println("<td>" + tabla.getValueAt(t,6) + "</td>");
                out.println("<td>" + tabla.getValueAt(t,7) + "</td>");
                out.println("<td>" + tabla.getValueAt(t,8) + "</td>");  
                out.println("</tr>");
            }
        %>

    </tbody>
  </table>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
        <script type="text/javascript">
            function limpiar(){
                $("#txt_id").val(0);
                $("#txt_producto").val('');
                $("#txt_drop_marcas").val('1');
                $("#txt_descripcion").val('');
                $("#txt_imagen").val('');
                $("#txt_precio_costo").val('');
                $("#txt_precio_venta").val('');
                $("#txt_existencia").val('');
                $("#txt_fecha_ingreso").val('');
            }
            
            $('#tbl_producto').on('click','tr td',function(evt){
                var target,id,id_p,producto,descripcion,imagen,precio_costo,precio_venta,existencia,fecha_ingreso;
                target = $(event.target);
                id = target.parent().data('id');
                id_p = target.parent().data('id_p');
                producto = target.parent("tr").find("td").eq(0).html();
                descripcion = target.parent("tr").find("td").eq(1).html();
                imagen = target.parent("tr").find("td").eq(2).html();
                precio_costo = target.parent("tr").find("td").eq(3).html();
                precio_venta = target.parent("tr").find("td").eq(4).html();
                existencia = target.parent("tr").find("td").eq(5).html();
                fecha_ingreso = target.parent("tr").find("td").eq(6).html();
                $("#txt_id").val(id);
                $("#txt_producto").val(producto);
                $("#txt_descripcion").val(descripcion);
                $("#txt_imagen").val(imagen);
                $("#txt_precio_costo").val(precio_costo);
                $("#txt_precio_venta").val(precio_venta);
                $("#txt_existencia").val(existencia);
                $("#txt_fecha_ingreso").val(fecha_ingreso);
                $("#txt_drop_marcas").val(id_p);
                $("#modal_producto").modal('show');
            });
            
        </script>
    </body>
</html>
