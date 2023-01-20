import 'dart:developer';

import 'package:api_handle/data/model/post_model.dart';
import 'package:api_handle/data/repositories/api/api.dart';
import 'package:dio/dio.dart';

class PostRepo {
  API _api = API();

  Future<List<PostModel>> getData() async {
    try {
      Response response = await _api.dio.get('posts');
      List<dynamic> postMaps = response.data;
      return postMaps.map((post) => PostModel.fromJson(post)).toList();
    } catch (ex) {
      rethrow;
    }
  }
}
