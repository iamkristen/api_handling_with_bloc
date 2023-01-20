import 'package:api_handle/logic/cubit/post_cubit/post_cubit.dart';
import 'package:api_handle/logic/cubit/post_cubit/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Api Handling"),
        ),
        body: BlocBuilder<PostCubit, PostState>(builder: (context, state) {
          if (state is PostLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PostLoadedState) {
            return ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: ((context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 12),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(12)),
                    child: ListTile(
                      tileColor: Colors.deepPurple.withOpacity(.2),
                      // style: ListTileStyle.drawer
                      leading: Text(state.posts[index].userId.toString()),
                      title: Text(state.posts[index].title!),
                      subtitle: Text(state.posts[index].body!),
                    ),
                  );
                }));
          } else if (state is PostErrorState) {
            return Center(
              child: Text(state.errorMessage.toString()),
            );
          } else {
            return const Center(
              child: Text("Something went Wrong"),
            );
          }
        }));
  }
}
