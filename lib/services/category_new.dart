import 'dart:convert';
import 'package:news_api/model/article_model.dart/articlemodel.dart';
import 'package:http/http.dart' as http;

class CategoryNewsServices {
  List<ArticleModel> news = [];

  Future<void> fetchCategoryNews(String category) async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=9a922478bde34c1298d3aba0b7a4f66d';

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['context'],
          );
          news.add(articleModel);
        }
      });
    }
  }
}
