package ar.edu.unq.uis.rankit_android.model.myApy;

import ar.edu.unq.uis.rankit_android.model.clasesMinificadas.Minificadas;
import okhttp3.ResponseBody;
import retrofit2.Call;
import retrofit2.http.Body;
import retrofit2.http.DELETE;
import retrofit2.http.GET;
import retrofit2.http.POST;
import retrofit2.http.PUT;
import java.util.List;


/**
 * Created by nicolas on 16/11/16.
 */

public interface MyApiEndpointInterface {

    @POST("usuarios")
    Call<Minificadas.LogUsuario> logInUsuario(@Body Minificadas.DatosUsuario datos);
    @GET("calificaciones")
    Call<List<Minificadas.CalificacionMinificada>> calificaciones(String idUsuario);
    @DELETE("calificaciones")
    Call<ResponseBody> delete(String id);
    @PUT("calificaciones")
    Call<ResponseBody> editar(@Body Minificadas.CalificacionMinificada miniCalificacion);
    @POST("calificaciones")
    Call<ResponseBody> nuevaCalificacion(@Body Minificadas.CalificacionMinificada miniCalificacion);


}
