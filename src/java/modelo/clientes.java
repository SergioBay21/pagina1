/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.util.HashMap;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author sergi
 */
public class clientes {
    int id,genero;
    String nombre,apellido,nit,telefono,email,fecha_ingreso;
    Conexion cn;
    public clientes(){}

    public clientes(int id, int genero, String nombre, String apellido, String nit, String telefono, String email, String fecha_ingreso) {
        this.id = id;
        this.genero = genero;
        this.nombre = nombre;
        this.apellido = apellido;
        this.nit = nit;
        this.telefono = telefono;
        this.email = email;
        this.fecha_ingreso = fecha_ingreso;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getGenero() {
        return genero;
    }

    public void setGenero(int genero) {
        this.genero = genero;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getNit() {
        return nit;
    }

    public void setNit(String nit) {
        this.nit = nit;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFecha_ingreso() {
        return fecha_ingreso;
    }

    public void setFecha_ingreso(String fecha_ingreso) {
        this.fecha_ingreso = fecha_ingreso;
    }
    
    public DefaultTableModel leer() throws SQLException{
    DefaultTableModel tabla = new DefaultTableModel();
    try{
    cn = new Conexion();
    cn.abrir_conexion();
    String query = "select idclientes,nombres,apellidos,nit,case when genero = 0 then 'FEMENINO' when genero = 1 then 'MASCULINO' else 'Unknown'end as sexo,telefono,correo_electronico, cast(fechaingreso as Date) as fechaingreso from clientes;";
    ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
    String encabezado[] = {"id","nombres","apellidos","nit","sexo","telefono","Correo","Fecha de Ingreso"};
    tabla.setColumnIdentifiers(encabezado);
      String datos[] = new String[9];
      while (consulta.next()){
          datos[0] = consulta.getString("idclientes");
          datos[1] = consulta.getString("nombres");
          datos[2] = consulta.getString("apellidos");
          datos[3] = consulta.getString("nit");
          datos[4] = consulta.getString("sexo");
          datos[5] = consulta.getString("telefono");
          datos[6] = consulta.getString("correo_electronico");
          datos[7] = consulta.getString("fechaingreso");
          tabla.addRow(datos);
      }
        cn.cerrar_conexion();
    }catch(SQLException ex){
    System.out.println(ex.getMessage());
    }
    return tabla;
    }
    
    public int agregar(){
        int retorno =0;
        try{
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "INSERT INTO clientes(nombres,apellidos,nit,genero,telefono,correo_electronico,fechaingreso) VALUES (?,?,?,?,?,?,?);";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setString(1,getNombre());
            parametro.setString(2,getApellido());
            parametro.setString(3,getNit());
            parametro.setInt(4,getGenero());
            parametro.setString(5,getTelefono());
            parametro.setString(6,getEmail());
            parametro.setString(7,getFecha_ingreso());
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
    return retorno;
    }
    public int modificar (){
        int retorno =0;
        try{
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "UPDATE clientes SET nombres= ?,apellidos= ?,nit= ?,genero= ?,telefono=?,correo_electronico=?,fechaingreso=? where idclientes=?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setString(1,getNombre());
            parametro.setString(2,getApellido());
            parametro.setString(3,getNit());
            parametro.setInt(4,getGenero());
            parametro.setString(5,getTelefono());
            parametro.setString(6,getEmail());
            parametro.setString(7, getFecha_ingreso());
            parametro.setInt(8, this.getId());
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
    return retorno;
    }
    public int eliminar(){
        int retorno =0;
        try{
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "DELETE FROM clientes WHERE idclientes=?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setInt(1, getId());
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
    return retorno;
    }
    public HashMap drop_cliente(){
        HashMap <String, String> drop = new HashMap();
        try {
            cn = new Conexion();
            String query = "SELECT idclientes as idclientes, concat_ws(' ', nombres, apellidos, nit) as nombre FROM clientes;";
            cn.abrir_conexion();
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            while (consulta.next()){
                drop.put(consulta.getString("idclientes"), consulta.getString("nombre"));
            }
            cn.cerrar_conexion();
        
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        return drop;
    }
}
