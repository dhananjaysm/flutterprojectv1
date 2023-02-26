import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mileazofltr/models/post_model.dart';
import 'package:mileazofltr/services/api/api.dart';

class PostService {
  API api = API();

  Future<List<PostModel>> fetchPosts() async {
    try {
      Response response = await api.sendRequest.get("/posts");
      List<dynamic> postMaps = response.data;
      return postMaps.map((postMap) => PostModel.fromJson(postMap)).toList();
    } catch (e) {
      throw e;
    }
  }
}
