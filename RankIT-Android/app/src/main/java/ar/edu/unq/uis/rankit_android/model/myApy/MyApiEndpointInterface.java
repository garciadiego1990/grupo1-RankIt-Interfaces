package ar.edu.unq.uis.rankit_android.model.myApy;

import ar.edu.unq.uis.rankit_android.model.clasesMinificadas.Minificadas;
import retrofit.http.*;
import retrofit.Call;

/**
 * Created by nicolas on 16/11/16.
 */

public interface MyApiEndpointInterface {

    @POST("usuarios")
    Call<Minificadas.LogUsuario> logInUsuario(@Body Minificadas.DatosUsuario datos);
    @GET("calificaciones")
    Call<Minificadas.CalificacionMinificada> calificaciones(String id);
    @DELETE("calificaciones")
    void delete(String id);
    @PUT("calificaciones")
    void editar(@Body Minificadas.CalificacionMinificada miniCalificacion);
    @POST("calificaciones")
    void nuevaCalificacion(@Body Minificadas.CalificacionMinificada miniCalificacion);


}
