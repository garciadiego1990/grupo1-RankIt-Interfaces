package ar.edu.unq.uis.rankit_android.model.myApy;

import ar.edu.unq.uis.rankit_android.model.clasesMinificadas.CalificacionMinificada;
import ar.edu.unq.uis.rankit_android.model.clasesMinificadas.DatosUsuario;
import ar.edu.unq.uis.rankit_android.model.clasesMinificadas.LogUsuario;
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
    Call<LogUsuario> logInUsuario(@Body DatosUsuario datos);
    @GET("calificaciones")
    Call<List<CalificacionMinificada>> calificaciones(String idUsuario);
    @DELETE("calificaciones")
    Call<ResponseBody> delete(String id);
    @PUT("calificaciones")
    Call<ResponseBody> editar(@Body CalificacionMinificada miniCalificacion);
    @POST("calificaciones")
    Call<ResponseBody> nuevaCalificacion(@Body CalificacionMinificada miniCalificacion);


}
