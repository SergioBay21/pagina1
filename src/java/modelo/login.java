/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import static java.lang.System.out;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author sergi
 */
public class login {
    String usr,pass;
    Conexion cn;
    
    public login(){}
    public login(String usr, String pass) {
        this.usr = usr;
        this.pass = pass;
    }

    public String getUsr() {
        return usr;
    }

    public void setUsr(String usr) {
        this.usr = usr;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }
    public boolean login(){
        boolean login = false;
        Conexion cn;
        String usuario,contrasena;
        usuario = this.getUsr();
        contrasena = this.getPass();
        try {
            ResultSet resultado;
            PreparedStatement parametro;
            cn = new Conexion();
            cn.abrir_conexion();
            String query = "SELECT usuario,pass FROM usuarios WHERE usuario=? AND pass=?";
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setString(1, usuario);
            parametro.setString(2, contrasena);
            resultado = parametro.executeQuery();
            if (resultado.next()){
                login = true;
            }else{
                login = false;
                
            }
            cn.cerrar_conexion();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        
        return login;
    }
    }
