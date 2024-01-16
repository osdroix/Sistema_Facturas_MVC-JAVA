
package backend;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class conexion {
       public static Connection getConnection(){


        Statement st = null;
        Connection con = null;
        String URL = "jdbc:mysql://localhost/facturacion?useSSL=false";
        String userName = "root";//Mi usuario
        String password = "";//Mi passwordivr4h3buj";//Mi usuario


        try{

            Class.forName("com.mysql.jdbc.Driver");
            con=(Connection) DriverManager.getConnection(URL,userName,password); 
            st = con.createStatement();
            System.out.println("Se conecto a la base de datos");

        }catch(Exception e){

            System.out.println("No se conecto a la bd");
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());

        }

        return con;

    } 
}
