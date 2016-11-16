package ar.edu.unq.uis.rankit_android.model.clasesMinificadas;

/**
 * Created by nicolas on 15/11/16.
 */

public class Minificadas {

    public class CalificacionMinificada {
        private Integer puntaje;
        private String detalle;
        private String evaluado;
        private String evaluador;
        private Integer id;
        private String tipo;
        private double ratingPromedio;

        public CalificacionMinificada(){}

        public CalificacionMinificada(Integer id, String nombreEvaluador, String nombreEvaluado, Integer puntaje, String detalle, String unTipo, double rating) {
            this.id = id;
            this.evaluador = nombreEvaluador;
            this.evaluado = nombreEvaluado;
            this.puntaje = puntaje;
            this.detalle = detalle;
            this.tipo = unTipo;
            this.ratingPromedio = rating;
        }
        public Integer getPuntaje() {
            return this.puntaje;
        }

        public String getDetalle() {
            return this.detalle;
        }

        public String getEvaluado() {
            return this.evaluado;
        }

        public String getEvaluador() {
            return this.evaluador;
        }

        public Integer getId() {
            return this.id;
        }

        public String getTipo() {
            return this.tipo;
        }

        public double getRatingPromedio() {
            return this.ratingPromedio;
        }

        public void setPuntaje(Integer puntaje) {
            this.puntaje = puntaje;
        }

        public void setDetalle(String detalle) {
            this.detalle = detalle;
        }

        public void setEvaluado(String evaluado) {
            this.evaluado = evaluado;
        }

        public void setEvaluador(String evaluador) {
            this.evaluador = evaluador;
        }

        public void setId(Integer id) {
            this.id = id;
        }

        public void setTipo(String tipo) {
            this.tipo = tipo;
        }

        public void setRatingPromedio(double rating) {
            this.ratingPromedio = rating;
        }
    }

    public class DatosUsuario {
        private String usuario;
        private String password;

        public DatosUsuario(){}

        public DatosUsuario(String usuario, String password) {
            this.usuario = usuario;
            this.password = password;
        }

        public String getUsuario() {
            return this.usuario;
        }

        public String getPassword() {
            return this.password;
        }

        public void setUsuario(String usuario) {
            this.usuario = usuario;
        }
        public void setPassword(String password) {
            this.password = password;
        }

    }

    public class LogUsuario {
        private Integer id;

        public LogUsuario() {}

        public LogUsuario(Integer id) {
            this.id = id;
        }

        public Integer getId() {
            return this.id;
        }

        public void setId(Integer id) {
            this.id = id;
        }
    }
}
