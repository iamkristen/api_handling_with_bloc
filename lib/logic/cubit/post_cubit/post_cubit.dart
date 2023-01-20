import 'package:api_handle/data/model/post_model.dart';
import 'package:api_handle/data/repositories/post_repo.dart';
import 'package:api_handle/logic/cubit/post_cubit/post_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostLoadingState()) {
    getData();
  }
  PostRepo _postRepo = PostRepo();

  void getData() async {
    try {
      List<PostModel> listData = await _postRepo.getData();
      emit(PostLoadedState(listData));
    } on DioError catch (ex) {
      if (ex.type == DioErrorType.other) {
        emit(PostErrorState(
            "Error Occured! Please check your internet connection"));
      } else if (ex.type == DioErrorType.connectTimeout) {
        emit(PostErrorState("Connection Timeout!"));
      } else {
        emit(PostErrorState(ex.message));
      }
    }
  }
}
