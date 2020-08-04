import 'package:cubit_test/network/model/post.dart';
import 'package:dio/dio.dart';

class PostRepository {
  Dio dio = new Dio();
  Response response;
  String uri = "https://jsonplaceholder.typicode.com/posts";

  Future<List<PostModel>> index() async {
    try {
      response = await dio.get(uri);
      List list = response.data;
      List<PostModel> post = list.map((e) => PostModel.fromJson(e)).toList();
      return post;
    } catch (e) {
      throw Exception(e);
    }
  }
}
