import 'package:newsapp/models/article.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class News {
  List<Article> news = [];

  Future<void> getNews() async {
    String url = 'http://newsapi.org/v2/top-headlines?country=us&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&apiKey=b284713ed1ae44d8abfb3344496e8cfd';
    
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element){
        if(element['urlToImage']!=null && element['description']!=null) {
          Article article = Article(
            title: element['title'],
            author: element['author'],
            published: DateTime.parse(element['publishedAt']),
            imgUrl: element['urlToImage'],
            content: element['content'],
            articleUrl: element['url'],
            description: element['description'],
          );
          news.add(article);
        }
      });
    }
  }
}

class CategoryNews {
  List<Article> news = [];

  Future<void> getCategoryNews(String category) async {
    String url = 'http://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=b284713ed1ae44d8abfb3344496e8cfd';
    
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element){
        if(element['urlToImage']!=null && element['description']!=null) {
          Article article = Article(
            title: element['title'],
            author: element['author'],
            published: DateTime.parse(element['publishedAt']),
            imgUrl: element['urlToImage'],
            content: element['content'],
            articleUrl: element['url'],
            description: element['description'],
          );
          news.add(article);
        }
      });
    }
  }
}