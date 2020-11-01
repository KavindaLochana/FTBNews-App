import 'dart:convert';

import 'package:flutter_newsapp/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async{
    
    String url = "http://newsapi.org/v2/top-headlines?country=us&apiKey=ed48345b36e54a1e81e4e21a57b320a3";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

        if(element["urlToImage"] != null && element ["description"] != null){
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element["author"],
            description: element["description"],
            url: element["url"],
            urlToImage: element ["urlToImage"],
            content: element ["context"]//he used context
          );

          news.add(articleModel);
        }

      });
    }



  }
}

class CategoryNewsClass {
  List<ArticleModel> news = [];

  Future<void> getNews(String category) async{

    String url = "http://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=ed48345b36e54a1e81e4e21a57b320a3";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

        if(element["urlToImage"] != null && element ["description"] != null){
          ArticleModel articleModel = ArticleModel(
              title: element['title'],
              author: element["author"],
              description: element["description"],
              url: element["url"],
              urlToImage: element ["urlToImage"],
              content: element ["context"]//he used context
          );

          news.add(articleModel);
        }

      });
    }



  }
}