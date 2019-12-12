package example;

import com.apollographql.apollo.ApolloCall;
import com.apollographql.apollo.ApolloClient;
import com.apollographql.apollo.api.Response;
import com.apollographql.apollo.exception.ApolloException;
import com.example.MyQuery;
import com.example.UpdateBookTitleMutation;
import com.example.type.UpdateBookTitleInput;
import org.jetbrains.annotations.NotNull;

public class Main {
    public static void main(String[] args) {
        ApolloClient apolloClient = ApolloClient.builder().build();
        apolloClient.query(
                MyQuery.builder().build()
        ).enqueue(new ApolloCall.Callback<MyQuery.Data>() {

            @Override
            public void onResponse(@NotNull Response<MyQuery.Data> dataResponse) {

                for (MyQuery.Book book : dataResponse.data().books()) {
                    System.out.println(book.author());
                    System.out.println(book.title());
                }
            }

            @Override
            public void onFailure(@NotNull ApolloException e) {

            }

        });
        UpdateBookTitleInput input = UpdateBookTitleInput.builder().id("1").title("newTitle").build();
        UpdateBookTitleMutation mutation = UpdateBookTitleMutation.builder().input(input).build();

        apolloClient.mutate(mutation).enqueue(new ApolloCall.Callback<UpdateBookTitleMutation.Data>() {
            @Override
            public void onResponse(@NotNull Response<UpdateBookTitleMutation.Data> response) {

            }

            @Override
            public void onFailure(@NotNull ApolloException e) {

            }
        });
    }

}
