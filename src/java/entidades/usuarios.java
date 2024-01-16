
package entidades;

import backend.conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class usuarios {
   private String Nom_usu, App_usu,Apm_usu,Corre_usu,Contra_usu;
   private int Tipo_usu, Id_usu;

    public String getNom_usu() {
        return Nom_usu;
    }

    public void setNom_usu(String Nom_usu) {
        this.Nom_usu = Nom_usu;
    }

    public String getApp_usu() {
        return App_usu;
    }

    public void setApp_usu(String App_usu) {
        this.App_usu = App_usu;
    }

    public String getApm_usu() {
        return Apm_usu;
    }

    public void setApm_usu(String Apm_usu) {
        this.Apm_usu = Apm_usu;
    }

    public String getCorre_usu() {
        return Corre_usu;
    }

    public void setCorre_usu(String Corre_usu) {
        this.Corre_usu = Corre_usu;
    }

    public String getContra_usu() {
        return Contra_usu;
    }

    public void setContra_usu(String Contra_usu) {
        this.Contra_usu = Contra_usu;
    }

    public int getTipo_usu() {
        return Tipo_usu;
    }

    public void setTipo_usu(int Tipo_usu) {
        this.Tipo_usu = Tipo_usu;
    }

    public int getId_usu() {
        return Id_usu;
    }

    public void setId_usu(int Id_usu) {
        this.Id_usu = Id_usu;
    }
     public usuarios Validarusuario(String user, String contra){
        usuarios a=null;
        Connection cn=null;
        PreparedStatement pr=null;
        ResultSet rs=null;
        /*u=null;*/
        try{
              cn = conexion.getConnection();
            String sql="SELECT * FROM usuario_factura WHERE Correo_usu=? AND Contra_usu=?";
            pr=cn.prepareStatement(sql);
            pr.setString(1,user);
            pr.setString(2,contra);
            rs=pr.executeQuery();
            while(rs.next()){
                a=new usuarios();
                 a.setId_usu(rs.getInt("Id_usu"));
                 a.setTipo_usu(rs.getInt("Tipo_usu"));
                 a.setNom_usu(rs.getString("Nom_usu"));
                 a.setApp_usu(rs.getString("App_usu"));
                 a.setApm_usu(rs.getString("Apm_usu"));
                a.setCorre_usu(rs.getString("Correo_usu"));
                a.setContra_usu(rs.getString("Contra_usu"));
          
                break;
                
            }
        }catch(SQLException ex){
            a=null;
        }finally{
            try{;
                rs.close();
            }catch(SQLException ex){
                
            }
        }
        return a;
    }
}
