/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;
import java.sql.Connection;
import java.sql.DriverManager;
    import java.sql.SQLException;
/**
 *
 * @author sergi
 */
public class Conexion {
    public Connection conexionBD;
    public final String urlConexion = "jdbc:mysql://localhost:3306/db_final";
    public final String usuario = "usr_final";
    public final String contra = "Final_2002";
    public final String jdbc = "com.mysql.cj.jdbc.Driver";
    
    public void abrir_conexion(){
        try{
            Class.forName(jdbc);
            conexionBD = DriverManager.getConnection(urlConexion,usuario,contra);
        }catch(Exception ex){
            System.out.println("Error..." + ex.getMessage());
        }
    }
    public void cerrar_conexion(){
        try{
            conexionBD.close();
        }catch(SQLException ex){
            
        }
    }
}
