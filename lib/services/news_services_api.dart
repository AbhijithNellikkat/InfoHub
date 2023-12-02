import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:news_app/models/model.dart';

class NewsApiServices {
  static const String apiKey = "c3cca2addbf24164b9503d9501a7b19e";

  final String url =
      "https://newsapi.org/v2/top-headlines?country=in&apiKey=$apiKey";
  late Dio dio;
  NewsApiServices() {
    dio = Dio();
  }

  Future<List<Article>> fetchNewsArticle() async {
    try {
      Response response = await dio.get(url);
      News newsResponse = News.fromJson(response.data);
      return newsResponse.articles;
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      log('$e');
      return [];
    }
  }
}
