import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mileazofltr/logic/cubits/post_cubit/post_state.dart';
import 'package:mileazofltr/models/post_model.dart';
import 'package:mileazofltr/services/post_service.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostLoadingState()) {
    fetchPosts();
  }

  PostService postService = PostService();
  void fetchPosts() async {
    try {
      List<PostModel> posts = await postService.fetchPosts();
      emit(PostLoadedState(posts));
    } on DioError catch (ex) {
      emit(PostErrorState(ex.type.toString()));
    }
  }
}
