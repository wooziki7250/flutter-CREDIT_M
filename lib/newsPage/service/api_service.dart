import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:new_team4_app/newsPage/model/article_model.dart';

class ApiService {
  final endPointUrl =
      "https://newsapi.org/v2/top-headlines?country=kr&category=business&apiKey=fc91df7c3f9448dbacdb20e8db54d6f9";
  final client = http.Client;

  Future<List<Article>> getArticle() async {
    final uri = Uri.parse(endPointUrl);
    http.Response response = await http.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    List<dynamic> body = json['articles'];
    List<Article> articles =
        body.map((dynamic item) => Article.fromJson(item)).toList();
    return articles;
  }
}
