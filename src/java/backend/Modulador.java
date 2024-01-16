/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package backend;

import entidades.facturas;
import entidades.usuarios;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author osdroix
 */
@WebServlet(name = "Modulador", urlPatterns = {"/Modulador"})
public class Modulador extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String accion = request.getParameter("accion");
        
        switch(accion){
            case "Registro":
            String Nom,App,Apm,Correo,Contraseña;
            int Tipo;
           Nom = request.getParameter("nom");
           App = request.getParameter("app");
           Apm = request.getParameter("apm")     ;
           Correo = request.getParameter("corre");
           Contraseña = request.getParameter("contra");  
           Tipo = Integer.parseInt(request.getParameter("tipo"));
           crud validar = new crud();
           usuarios e = new  usuarios();
        {
            try {
                if(validar.validarregistro(Correo)){
                    response.sendRedirect("Anuncios/Dashboard.jsp?in=El correo &error=se encuentra registrado&img=https://cdn-icons-png.flaticon.com/512/497/497738.png");
                }
                e.setTipo_usu(Tipo);
                e.setNom_usu(Nom);
                e.setApp_usu(App);
                e.setApm_usu(Apm);
                e.setCorre_usu(Correo);
                e.setContra_usu(Contraseña);
                
                        int query = crud.guardar(e);
                
            
                        response.sendRedirect("Anuncios/Dashboard.jsp?in=Registro &error=Exitoso&img=https://zellusmarketing.com/wp-content/uploads/2021/03/icon-1.9s-266px.gif");
            
            } catch (Exception ex) {
                Logger.getLogger(Modulador.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
             break;
            case "Registro-fac":
            String nom,hospe,trans,alim,otros,fecha;
            int id; 
            double mxn,mxn1,mxn2,mxn3,total;
                nom = request.getParameter("nom");
                hospe = request.getParameter("hospe");
                trans = request.getParameter("trans");
                alim = request.getParameter("alim");
                otros = request.getParameter("otros");
                fecha = request.getParameter("fecha");
                id = Integer.parseInt(request.getParameter("id"));
                mxn = Double.parseDouble(request.getParameter("mxn"));
                mxn1 = Double.parseDouble(request.getParameter("mxn1"));
                mxn2 = Double.parseDouble(request.getParameter("mxn2"));
                mxn3 = Double.parseDouble(request.getParameter("mxn3"));
                total = Double.parseDouble(request.getParameter("total"));
                facturas k = new facturas();
        {
            try {
                        k.setId_usu_fac(id);
                        k.setFecha_fac(fecha);
                        k.setNom_fac(nom);
                        k.setConcep_hospedaje_fac(hospe);
                        k.setConcep_transporte_fac(trans);
                        k.setConcep_alimento_fac(alim);
                        k.setConcep_otros_fac(otros);
                        k.setMXN_hospedaje_fac(mxn);
                        k.setMXN_transporte_fac(mxn1);
                        k.setMXN_alimento_fac(mxn2);
                        k.setMXN_otros_fac(mxn3);
                        k.setTotal_fac(total);
                        int query = crud.guardar_fa(k);
                
            
                        response.sendRedirect("Anuncios/Dashboard-fac.jsp?in=Registro &error=Exitoso&img=https://zellusmarketing.com/wp-content/uploads/2021/03/icon-1.9s-266px.gif");
            
            } catch (Exception ex) {
                Logger.getLogger(Modulador.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
             break;
            case "Registro-fac_e":
                nom = request.getParameter("nom");
                hospe = request.getParameter("hospe");
                trans = request.getParameter("trans");
                alim = request.getParameter("alim");
                otros = request.getParameter("otros");
                fecha = request.getParameter("fecha");
                id = Integer.parseInt(request.getParameter("id"));
                mxn = Double.parseDouble(request.getParameter("mxn"));
                mxn1 = Double.parseDouble(request.getParameter("mxn1"));
                mxn2 = Double.parseDouble(request.getParameter("mxn2"));
                mxn3 = Double.parseDouble(request.getParameter("mxn3"));
                total = Double.parseDouble(request.getParameter("total"));
                facturas fac = new facturas();
        {
            try {
                        fac.setId_usu_fac(id);
                        fac.setFecha_fac(fecha);
                        fac.setNom_fac(nom);
                        fac.setConcep_hospedaje_fac(hospe);
                        fac.setConcep_transporte_fac(trans);
                        fac.setConcep_alimento_fac(alim);
                        fac.setConcep_otros_fac(otros);
                        fac.setMXN_hospedaje_fac(mxn);
                        fac.setMXN_transporte_fac(mxn1);
                        fac.setMXN_alimento_fac(mxn2);
                        fac.setMXN_otros_fac(mxn3);
                        fac.setTotal_fac(total);
                        int query = crud.guardar_fa(fac);
                
            
                        response.sendRedirect("Anuncios/Dashboard-fac_e.jsp?in=Registro &error=Exitoso&img=https://zellusmarketing.com/wp-content/uploads/2021/03/icon-1.9s-266px.gif");
            
            } catch (Exception ex) {
                Logger.getLogger(Modulador.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
             break;
            case "Login":
            
            try (PrintWriter out = response.getWriter()) {
                    String corre = request.getParameter("corre");
                    String contraseña = request.getParameter("contra"); 
                    usuarios u = new usuarios();
                    u = u.Validarusuario(corre, contraseña);


                   if (u!=null) {
                       HttpSession sesionOk=request.getSession();
                        sesionOk.setAttribute("user", u);
                        usuarios x=(usuarios)sesionOk.getAttribute("user");
                            if (u.getTipo_usu() == 1) {
                            response.sendRedirect("/Facturas/Admin/menu.jsp");

                            }else if(u.getTipo_usu() == 0){
                            response.sendRedirect("/Facturas/Admin-s/menu.jsp");
                            }
                            }    
                   response.sendRedirect("Anuncios/Dashboard.jsp?in=Error 404 &error=usuario no contrado&img=https://cdn-icons-png.flaticon.com/512/497/497738.png");

                }catch(Exception c){
                 System.out.println(c.getMessage());
                        System.out.println(c.getStackTrace());
                }
             break;
            case "cerrar-sesion":
                   HttpSession sesion=request.getSession();
                    sesion.removeAttribute("user");
                    sesion.invalidate();
                
            
                  response.sendRedirect("Anuncios/Dashboard.jsp?in=Cerrando sesion&img=https://25.media.tumblr.com/tumblr_m8kuxjuJcg1qdemqzo1_400.gif&error=Hasta luego");
             break;
            case "editar":
                try (PrintWriter out = response.getWriter()) {
            Statement set = null;
                Connection con = conexion.getConnection();
            try {
                set = con.createStatement();
            } catch (SQLException ex) {
                Logger.getLogger(Modulador.class.getName()).log(Level.SEVERE, null, ex);
            }
                String Nom_e,App_e,Apm_e,Correo_e,Contraseña_e;
                int id_e;
                Nom_e = request.getParameter("nom");
                App_e = request.getParameter("app");
                Apm_e = request.getParameter("apm")     ;
                Correo_e = request.getParameter("corre");
                Contraseña_e = request.getParameter("contra");
                id_e = Integer.parseInt(request.getParameter("id")); 
               
                     String q="UPDATE `usuario_factura` SET `Nom_usu` = '"+Nom_e+"', `App_usu` = '"+App_e+"', `Apm_usu` = '"+Apm_e+"', `Correo_usu` = '"+Correo_e+"', `Contra_usu` = '"+Contraseña_e+"' WHERE `usuario_factura`.`Id_usu` = '"+id_e+"'";
            try {
                set.executeUpdate(q);
            } catch (SQLException ex) {
                Logger.getLogger(Modulador.class.getName()).log(Level.SEVERE, null, ex);
            }
                 HttpSession sesion_e=request.getSession();
                 sesion_e.removeAttribute("user");
                 sesion_e.invalidate();
                response.sendRedirect("Anuncios/Dashboard.jsp?in=Cerrando sesion&img=https://25.media.tumblr.com/tumblr_m8kuxjuJcg1qdemqzo1_400.gif&error=Hasta luego");
        }
            break;
            case "Editar_fac_e":
                try (PrintWriter out = response.getWriter()) {
            Statement set = null;
                Connection con = conexion.getConnection();
            try {
                set = con.createStatement();
            } catch (SQLException ex) {
                Logger.getLogger(Modulador.class.getName()).log(Level.SEVERE, null, ex);
            }
                nom = request.getParameter("nom");
                hospe = request.getParameter("hospe");
                trans = request.getParameter("trans");
                alim = request.getParameter("alim");
                otros = request.getParameter("otros");
                fecha = request.getParameter("fecha");
                id = Integer.parseInt(request.getParameter("id"));
                mxn = Double.parseDouble(request.getParameter("mxn"));
                mxn1 = Double.parseDouble(request.getParameter("mxn1"));
                mxn2 = Double.parseDouble(request.getParameter("mxn2"));
                mxn3 = Double.parseDouble(request.getParameter("mxn3"));
                total = Double.parseDouble(request.getParameter("total"));
               
                     String q="UPDATE `factura` SET `Fecha_fac` = '"+fecha+"',"
                             + "`Nom_fac` = '"+nom+"', `Concep_hospedaje_fac` = '"+hospe+"',"
                             + "`Concep_transporte_fac` = '"+trans+"',`Concep_alimento_fac` = '"+alim+"',"
                             + "`Concep_otros_fac` = '"+otros+"',`MXN_hospedaje_fac` = '"+mxn+"',"
                             + "`MXN_transporte_fac` = '"+mxn1+"',`MXN_alimento_fac` = '"+mxn2+"',"
                             + "`MXN_otros_fac` = '"+mxn3+"',`Total_fac` = '"+total+"'  WHERE `factura`.`Id_fac` = '"+id+"'";
            try {
                set.executeUpdate(q);
            } catch (SQLException ex) {
                Logger.getLogger(Modulador.class.getName()).log(Level.SEVERE, null, ex);
            }
                 response.sendRedirect("Anuncios/Dashboard-fac_e.jsp?in=Exito &error=Modificado exitosamente.&img=https://zellusmarketing.com/wp-content/uploads/2021/03/icon-1.9s-266px.gif");
            }
            break;
            case "Editar_fac":
                try (PrintWriter out = response.getWriter()) {
            Statement set = null;
                Connection con = conexion.getConnection();
            try {
                set = con.createStatement();
            } catch (SQLException ex) {
                Logger.getLogger(Modulador.class.getName()).log(Level.SEVERE, null, ex);
            }
                nom = request.getParameter("nom");
                hospe = request.getParameter("hospe");
                trans = request.getParameter("trans");
                alim = request.getParameter("alim");
                otros = request.getParameter("otros");
                fecha = request.getParameter("fecha");
                id = Integer.parseInt(request.getParameter("id"));
                mxn = Double.parseDouble(request.getParameter("mxn"));
                mxn1 = Double.parseDouble(request.getParameter("mxn1"));
                mxn2 = Double.parseDouble(request.getParameter("mxn2"));
                mxn3 = Double.parseDouble(request.getParameter("mxn3"));
                total = Double.parseDouble(request.getParameter("total"));
               
                     String q="UPDATE `factura` SET `Fecha_fac` = '"+fecha+"',"
                             + "`Nom_fac` = '"+nom+"', `Concep_hospedaje_fac` = '"+hospe+"',"
                             + "`Concep_transporte_fac` = '"+trans+"',`Concep_alimento_fac` = '"+alim+"',"
                             + "`Concep_otros_fac` = '"+otros+"',`MXN_hospedaje_fac` = '"+mxn+"',"
                             + "`MXN_transporte_fac` = '"+mxn1+"',`MXN_alimento_fac` = '"+mxn2+"',"
                             + "`MXN_otros_fac` = '"+mxn3+"',`Total_fac` = '"+total+"'  WHERE `factura`.`Id_fac` = '"+id+"'";
            try {
                set.executeUpdate(q);
            } catch (SQLException ex) {
                Logger.getLogger(Modulador.class.getName()).log(Level.SEVERE, null, ex);
            }
                 response.sendRedirect("Anuncios/Dashboard-fac.jsp?in=Exito &error=Modificado exitosamente.&img=https://zellusmarketing.com/wp-content/uploads/2021/03/icon-1.9s-266px.gif");
            }
            break;
    }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
