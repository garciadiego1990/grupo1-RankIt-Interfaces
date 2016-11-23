package ar.edu.unq.uis.rankit_android.model.myService;


import okhttp3.OkHttpClient;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

/**
 * Created by nicolas on 16/11/16.
 */

public class ServiceGenerator {

    public static final String SERVER_NICO = "10.12.8.16";
    public static final String API_BASE_URL = "http://"+ SERVER_NICO +":9000/";
    private static OkHttpClient.Builder httpClient = new OkHttpClient.Builder();

    private static Retrofit.Builder builder =
            new Retrofit.Builder()
                    .baseUrl(API_BASE_URL)
                    .addConverterFactory(GsonConverterFactory.create());

    public static <S> S createService(Class<S> serviceClass) {

        Retrofit retrofit = builder.client(httpClient.build()).build();
        return retrofit.create(serviceClass);
    }
}

