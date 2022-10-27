/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author sergi
 */
public class productos {
    Conexion cn;
        public HashMap drop_producto(){
        HashMap <String, String> drop = new HashMap();
        try {
            cn = new Conexion();
            String query = "SELECT idproductos as idproductos, descripcion FROM productos;";
            cn.abrir_conexion();
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            while (consulta.next()){
                drop.put(consulta.getString("idproductos"), consulta.getString("descripcion"));
            }
            cn.cerrar_conexion();
        
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        return drop;
    }
    public DefaultTableModel leer_tabla() throws SQLException{
    DefaultTableModel tabla = new DefaultTableModel();
    try{
    cn = new Conexion();
    cn.abrir_conexion();
    String query = "SELECT idproductos,descripcion,precio_venta FROM productos;";
    ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
    String encabezado[] = {"id","cantidad","descripcion","precio_unitario","total"};
    tabla.setColumnIdentifiers(encabezado);
      String datos[] = new String[9];
      while (consulta.next()){
          datos[0] = consulta.getString("idproductos");
          datos[1] = consulta.getString("descripcion");
          datos[2] = consulta.getString("precio_venta");
          tabla.addRow(datos);
      }
        cn.cerrar_conexion();
    }catch(SQLException ex){
    System.out.println(ex.getMessage());
    }
    return tabla;
    }
}
