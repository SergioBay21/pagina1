/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

/**
 *
 * @author sergi
 */
public class empleados {
    Conexion cn;
        public HashMap drop_empleado(){
        HashMap <String, String> drop = new HashMap();
        try {
            cn = new Conexion();
            String query = "SELECT idempleado as idempleado, concat_ws(' ', nombres, apellidos) as nombre FROM empleados;";
            cn.abrir_conexion();
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            while (consulta.next()){
                drop.put(consulta.getString("idempleado"), consulta.getString("nombre"));
            }
            cn.cerrar_conexion();
        
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        return drop;
    }
    
}
