
package entidades;

public class facturas {
     private String Nom_fac,Concep_hospedaje_fac,Concep_transporte_fac,Concep_alimento_fac,Concep_otros_fac,Fecha_fac;
    private int Id_fac,Id_usu_fac;
    private double MXN_hospedaje_fac,MXN_transporte_fac,MXN_alimento_fac,MXN_otros_fac,Total_fac;

    public String getNom_fac() {
        return Nom_fac;
    }

    public void setNom_fac(String Nom_fac) {
        this.Nom_fac = Nom_fac;
    }

    public String getConcep_hospedaje_fac() {
        return Concep_hospedaje_fac;
    }

    public void setConcep_hospedaje_fac(String Concep_hospedaje_fac) {
        this.Concep_hospedaje_fac = Concep_hospedaje_fac;
    }

    public String getConcep_transporte_fac() {
        return Concep_transporte_fac;
    }

    public void setConcep_transporte_fac(String Concep_transporte_fac) {
        this.Concep_transporte_fac = Concep_transporte_fac;
    }

    public String getConcep_alimento_fac() {
        return Concep_alimento_fac;
    }

    public void setConcep_alimento_fac(String Concep_alimento_fac) {
        this.Concep_alimento_fac = Concep_alimento_fac;
    }

    public String getConcep_otros_fac() {
        return Concep_otros_fac;
    }

    public void setConcep_otros_fac(String Concep_otros_fac) {
        this.Concep_otros_fac = Concep_otros_fac;
    }

    public String getFecha_fac() {
        return Fecha_fac;
    }

    public void setFecha_fac(String Fecha_fac) {
        this.Fecha_fac = Fecha_fac;
    }

    public int getId_fac() {
        return Id_fac;
    }

    public void setId_fac(int Id_fac) {
        this.Id_fac = Id_fac;
    }

    public int getId_usu_fac() {
        return Id_usu_fac;
    }

    public void setId_usu_fac(int Id_usu_fac) {
        this.Id_usu_fac = Id_usu_fac;
    }

    public double getMXN_hospedaje_fac() {
        return MXN_hospedaje_fac;
    }

    public void setMXN_hospedaje_fac(double MXN_hospedaje_fac) {
        this.MXN_hospedaje_fac = MXN_hospedaje_fac;
    }

    public double getMXN_transporte_fac() {
        return MXN_transporte_fac;
    }

    public void setMXN_transporte_fac(double MXN_transporte_fac) {
        this.MXN_transporte_fac = MXN_transporte_fac;
    }

    public double getMXN_alimento_fac() {
        return MXN_alimento_fac;
    }

    public void setMXN_alimento_fac(double MXN_alimento_fac) {
        this.MXN_alimento_fac = MXN_alimento_fac;
    }

    public double getMXN_otros_fac() {
        return MXN_otros_fac;
    }

    public void setMXN_otros_fac(double MXN_otros_fac) {
        this.MXN_otros_fac = MXN_otros_fac;
    }

    public double getTotal_fac() {
        return Total_fac;
    }

    public void setTotal_fac(double Total_fac) {
        this.Total_fac = Total_fac;
    }
}
