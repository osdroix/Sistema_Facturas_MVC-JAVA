
package backend;

import entidades.entidadfac;
import entidades.facturas;
import entidades.usuarios;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class crud {
      public static int guardar(usuarios e){
        
        int estado = 0;
        try{
            Connection con = conexion.getConnection();
           String q="insert into usuario_factura (Id_usu,Tipo_usu,Nom_usu,App_usu,Apm_usu,Correo_usu,Contra_usu)values(?,?,?,?,?,?,?)";
            PreparedStatement set=con.prepareStatement(q);
            set.setInt(1, e.getId_usu());
            set.setInt(2, e.getTipo_usu());
            set.setString(3, e.getNom_usu());
            set.setString(4, e.getApp_usu());
            set.setString(5, e.getApm_usu());
            set.setString(6, e.getCorre_usu());
            set.setString(7, e.getContra_usu());
            System.out.println("Tabla usuario_factura encontrada");
             estado = set.executeUpdate();
             
                System.out.print(e);
                con.close();
        }catch(Exception d){
            System.out.println("NO HAY TABLA  usuario_factura");
            System.out.println(d.getMessage());
            
                System.out.print(e);
            System.out.println(d.getStackTrace());
        }
        return estado;
    
    }
    public static int guardar_fa(facturas e){
        
        int estado = 0;
        try{
            Connection con = conexion.getConnection();
           String q="INSERT INTO factura (`Id_fac`, `Id_usu_fac`, `Fecha_fac`, `Nom_fac`, `Concep_hospedaje_fac`, `Concep_transporte_fac`, `Concep_alimento_fac`, `Concep_otros_fac`, `MXN_hospedaje_fac`, `MXN_transporte_fac`, `MXN_alimento_fac`, `MXN_otros_fac`, `Total_fac`)values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement set=con.prepareStatement(q);
            set.setInt(1, e.getId_fac());
            set.setInt(2, e.getId_usu_fac());
            set.setString(3, e.getFecha_fac());
            set.setString(4, e.getNom_fac());
            set.setString(5, e.getConcep_hospedaje_fac());
            set.setString(6, e.getConcep_transporte_fac());
            set.setString(7, e.getConcep_alimento_fac());
            set.setString(8, e.getConcep_otros_fac());
            set.setDouble(9, e.getMXN_hospedaje_fac());
            set.setDouble(10, e.getMXN_transporte_fac());
            set.setDouble(11, e.getMXN_alimento_fac());
            set.setDouble(12, e.getMXN_otros_fac());
            set.setDouble(13, e.getTotal_fac());
            System.out.println("Tabla factura encontrada");
             estado = set.executeUpdate();
             
                System.out.print(e);
                con.close();
        }catch(Exception d){
            System.out.println("NO HAY TABLA factura");
            System.out.println(d.getMessage());
            
                System.out.print(e);
            System.out.println(d.getStackTrace());
        }
        return estado;
    
    }
   
    public boolean validarregistro(String corre) throws SQLException, Exception{
        Connection con = conexion.getConnection();
        String q = "SELECT * FROM usuario_factura WHERE Correo_usu='"+corre+"'";
        PreparedStatement ps = con.prepareStatement(q);
        ResultSet rs = ps.executeQuery();
        
        return rs.next();
    }
    public boolean Mostar() throws SQLException, Exception{
        Connection con = conexion.getConnection();
        String q = "SELECT SUM(Total_fac) FROM factura"; 
        PreparedStatement ps = con.prepareStatement(q);
        ResultSet rs = ps.executeQuery();
        
        return rs.next();
    }
    public static ArrayList<usuarios> getUsu(String corre){
        
        ArrayList<usuarios> usus = new ArrayList();
        
        try{
            Connection c = conexion.getConnection();
            
            String x = "select * from usuario_factura where Correo_usu  like '"+corre+"'";
            PreparedStatement set1 = c.prepareStatement(x);
            ResultSet rs = set1.executeQuery();
            while (rs.next()) {
                usuarios u = new usuarios();
                u.setId_usu(rs.getInt("Id_usu"));
                u.setNom_usu(rs.getString("Nom_usu"));
                u.setApp_usu(rs.getString("App_usu"));
                u.setApm_usu(rs.getString("Apm_usu"));
                u.setCorre_usu(rs.getString("Correo_usu"));
                u.setContra_usu(rs.getString("Contra_usu"));
               
                usus.add(u);
            }
            c.close();
            
        }catch(Exception e){
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            
        }
        
        return usus;
    }
    public static ArrayList<usuarios> getusu(int i){
        
        ArrayList<usuarios> usus = new ArrayList();
        
        try{
            Connection c = conexion.getConnection();
            
            String x = "select * from usuario_factura where Id_usu like '"+i+"'";
            PreparedStatement set1 = c.prepareStatement(x);
            ResultSet rs = set1.executeQuery();
            while (rs.next()) {
                usuarios u = new usuarios();
                u.setId_usu(rs.getInt("Id_usu"));
                u.setNom_usu(rs.getString("Nom_usu"));
                u.setApp_usu(rs.getString("App_usu"));
                u.setApm_usu(rs.getString("Apm_usu"));
                u.setCorre_usu(rs.getString("Correo_usu"));
                u.setContra_usu(rs.getString("Contra_usu"));
               
                usus.add(u);
            }
            c.close();
            
        }catch(Exception e){
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            
        }
        
        return usus;
    }
    public static ArrayList<facturas> getfac(int id){
        
        ArrayList<facturas> f = new ArrayList();
        
        try{
            Connection c = conexion.getConnection();
            
            String x = "select * from factura where Id_usu_fac  like '"+id+"'";
            PreparedStatement set1 = c.prepareStatement(x);
            ResultSet rs = set1.executeQuery();
            while (rs.next()) {
                facturas u = new facturas();
                u.setId_fac(rs.getInt("Id_fac"));
                u.setId_usu_fac(rs.getInt("Id_usu_fac"));
                u.setFecha_fac(rs.getString("Fecha_fac"));
                u.setNom_fac(rs.getString("Nom_fac"));
                u.setConcep_hospedaje_fac(rs.getString("Concep_hospedaje_fac"));
                u.setConcep_transporte_fac(rs.getString("Concep_transporte_fac"));
                u.setConcep_alimento_fac(rs.getString("Concep_alimento_fac"));
                u.setConcep_otros_fac(rs.getString("Concep_otros_fac"));
                u.setMXN_hospedaje_fac(rs.getDouble("MXN_hospedaje_fac"));
                u.setMXN_transporte_fac(rs.getDouble("MXN_transporte_fac"));
                u.setMXN_alimento_fac(rs.getDouble("MXN_alimento_fac"));
                u.setMXN_otros_fac(rs.getDouble("MXN_otros_fac"));
                u.setTotal_fac(rs.getDouble("Total_fac"));
               
                f.add(u);
            }
            c.close();
            
        }catch(Exception e){
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            
        }
        
        return f;
    }
    public static ArrayList<entidadfac> getfac(){
        
        ArrayList<entidadfac> fac = new ArrayList();
        
        try{
            Connection c = conexion.getConnection();
            String x = "select * from usuario_factura INNER JOIN factura ON usuario_factura.Id_usu=factura.Id_usu_fac";
            PreparedStatement set1 = c.prepareStatement(x);
            ResultSet rs = set1.executeQuery();
            while (rs.next()) {
                entidadfac mostrar = new entidadfac();
                
                mostrar.setId_usu(rs.getInt("Id_usu"));
                mostrar.setNom_usu(rs.getString("Nom_usu"));
                mostrar.setApp_usu(rs.getString("App_usu"));
                mostrar.setApm_usu(rs.getString("Apm_usu"));
                mostrar.setCorre_usu(rs.getString("Correo_usu"));
                mostrar.setContra_usu(rs.getString("Contra_usu"));
                mostrar.setId_fac(rs.getInt("Id_fac"));
                mostrar.setId_usu_fac(rs.getInt("Id_usu_fac"));
                mostrar.setFecha_fac(rs.getString("Fecha_fac"));
                mostrar.setNom_fac(rs.getString("Nom_fac"));
                mostrar.setConcep_hospedaje_fac(rs.getString("Concep_hospedaje_fac"));
                mostrar.setConcep_transporte_fac(rs.getString("Concep_transporte_fac"));
                mostrar.setConcep_alimento_fac(rs.getString("Concep_alimento_fac"));
                mostrar.setConcep_otros_fac(rs.getString("Concep_otros_fac"));
                mostrar.setMXN_hospedaje_fac(rs.getDouble("MXN_hospedaje_fac"));
                mostrar.setMXN_transporte_fac(rs.getDouble("MXN_transporte_fac"));
                mostrar.setMXN_alimento_fac(rs.getDouble("MXN_alimento_fac"));
                mostrar.setMXN_otros_fac(rs.getDouble("MXN_otros_fac"));
                mostrar.setTotal_fac(rs.getDouble("Total_fac"));
               
                fac.add(mostrar);
            }
            c.close();
            
        }catch(Exception e){
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            
        }
        
        return fac;
    }
     public static ArrayList<entidadfac> getcor(String correo){
        
        ArrayList<entidadfac> fac = new ArrayList();
        
        try{
            Connection c = conexion.getConnection();
            String x = "select * from usuario_factura INNER JOIN factura ON usuario_factura.Id_usu=factura.Id_usu_fac WHERE `usuario_factura`.`Correo_usu` = '"+correo+"'";
            PreparedStatement set1 = c.prepareStatement(x);
            ResultSet rs = set1.executeQuery();
            while (rs.next()) {
                entidadfac mostrar = new entidadfac();
                
                mostrar.setId_usu(rs.getInt("Id_usu"));
                mostrar.setNom_usu(rs.getString("Nom_usu"));
                mostrar.setApp_usu(rs.getString("App_usu"));
                mostrar.setApm_usu(rs.getString("Apm_usu"));
                mostrar.setCorre_usu(rs.getString("Correo_usu"));
                mostrar.setContra_usu(rs.getString("Contra_usu"));
                mostrar.setId_fac(rs.getInt("Id_fac"));
                mostrar.setId_usu_fac(rs.getInt("Id_usu_fac"));
                mostrar.setFecha_fac(rs.getString("Fecha_fac"));
                mostrar.setNom_fac(rs.getString("Nom_fac"));
                mostrar.setConcep_hospedaje_fac(rs.getString("Concep_hospedaje_fac"));
                mostrar.setConcep_transporte_fac(rs.getString("Concep_transporte_fac"));
                mostrar.setConcep_alimento_fac(rs.getString("Concep_alimento_fac"));
                mostrar.setConcep_otros_fac(rs.getString("Concep_otros_fac"));
                mostrar.setMXN_hospedaje_fac(rs.getDouble("MXN_hospedaje_fac"));
                mostrar.setMXN_transporte_fac(rs.getDouble("MXN_transporte_fac"));
                mostrar.setMXN_alimento_fac(rs.getDouble("MXN_alimento_fac"));
                mostrar.setMXN_otros_fac(rs.getDouble("MXN_otros_fac"));
                mostrar.setTotal_fac(rs.getDouble("Total_fac"));
               
                fac.add(mostrar);
            }
            c.close();
            
        }catch(Exception e){
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            
        }
        
        return fac;
    }
     public static ArrayList<entidadfac> getid(int i){
        
        ArrayList<entidadfac> fac = new ArrayList();
        
        try{
            Connection c = conexion.getConnection();
            String x = "select * from usuario_factura INNER JOIN factura ON usuario_factura.Id_usu=factura.Id_usu_fac WHERE `factura`.`Id_fac` = '"+i+"'";
            PreparedStatement set1 = c.prepareStatement(x);
            ResultSet rs = set1.executeQuery();
            while (rs.next()) {
                entidadfac mostrar = new entidadfac();
                
                mostrar.setId_usu(rs.getInt("Id_usu"));
                mostrar.setNom_usu(rs.getString("Nom_usu"));
                mostrar.setApp_usu(rs.getString("App_usu"));
                mostrar.setApm_usu(rs.getString("Apm_usu"));
                mostrar.setCorre_usu(rs.getString("Correo_usu"));
                mostrar.setContra_usu(rs.getString("Contra_usu"));
                mostrar.setId_fac(rs.getInt("Id_fac"));
                mostrar.setId_usu_fac(rs.getInt("Id_usu_fac"));
                mostrar.setFecha_fac(rs.getString("Fecha_fac"));
                mostrar.setNom_fac(rs.getString("Nom_fac"));
                mostrar.setConcep_hospedaje_fac(rs.getString("Concep_hospedaje_fac"));
                mostrar.setConcep_transporte_fac(rs.getString("Concep_transporte_fac"));
                mostrar.setConcep_alimento_fac(rs.getString("Concep_alimento_fac"));
                mostrar.setConcep_otros_fac(rs.getString("Concep_otros_fac"));
                mostrar.setMXN_hospedaje_fac(rs.getDouble("MXN_hospedaje_fac"));
                mostrar.setMXN_transporte_fac(rs.getDouble("MXN_transporte_fac"));
                mostrar.setMXN_alimento_fac(rs.getDouble("MXN_alimento_fac"));
                mostrar.setMXN_otros_fac(rs.getDouble("MXN_otros_fac"));
                mostrar.setTotal_fac(rs.getDouble("Total_fac"));
               
                fac.add(mostrar);
            }
            c.close();
            
        }catch(Exception e){
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            
        }
        
        return fac;
    }
}
