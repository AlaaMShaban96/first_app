import 'dart:convert';

import 'package:test_app/models/models.dart';

class Article  extends Models{

   int? id;
   String? title;
   String? imageUrl;
   String? author;
   String? postedOn;

   @override
   Map<String, dynamic> fillable= {
     'id': "",
     'title': "",
     'imageUrl': "",
     "author" : "",
     'postedOn':""
   };

   Article({ this.id,
     this.title,
     this.imageUrl,
     this.author,
     this.postedOn}) ;
  // static Map<String, dynamic> fromJson(json) =>  {
  //   'id': json['id'],
  //   'title': json['title'],
  //   'imageUrl': json['imageUrl'],
  //   "author" : json['author'],
  //   'postedOn':json['postedOn']
  // };

  // Map<String, dynamic> toJson() =>  {
  //     'id': id,
  //     'title': title,
  //     'imageUrl': imageUrl,
  //     "author" : author,
  //     'postedOn':postedOn
  //   };
  // factory Article.fromJson(Map<String, dynamic> json) {
  //   return Article(
  //       id: json['id'],
  //       title: json['title'],
  //       imageUrl: json['imageUrl'],
  //       author : json['author'],
  //       postedOn:json['postedOn']
  //   );
  // }
  // static Map<String, dynamic> toMap(Article article) => {
  //       'id': article.id,
  //       'title': article.title,
  //       'imageUrl': article.imageUrl,
  //       "author" : article.author,
  //       'postedOn':article.postedOn
  // };
  // static String encode(List<Article> articles) => json.encode(
  //   articles
  //       .map<Map<String, dynamic>>((article) => Article.toMap(article))
  //       .toList(),
  //
  // );
  // static List<Article> decode(String articles) =>
  //     (json.decode(articles) as List<dynamic>)
  //         .map<Article>((item) => Article.fromJson(item))
  //         .toList();

}