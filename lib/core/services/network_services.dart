import 'package:dio/dio.dart';

import '../config/Model/model.dart';

class NetworkServices {
  final Dio _dio =
      Dio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com"));

  Future<List<ListModel>> fetchPost() async {
    final response = await _dio.get("/posts");
    return (response.data as List).map((e) => ListModel.fromJson(e)).toList();
  }

  Future<ListModel> addpost(ListModel newPost) async {
    final response = await _dio.post("/posts", data: newPost.toJson());
    print('response: ${response.data}');
    return ListModel.fromJson(response.data);
  }
}
