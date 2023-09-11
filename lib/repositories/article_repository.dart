import 'package:flutter/cupertino.dart';

import '../mocks/mocks_article.dart';
import '../models/article.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class ArticleRepository {
  getAllArticles() async {
    var db = FirebaseFirestore.instance;
    print("testttttttttttttt");
    var x = await db.collection("users").get();
    print("testttttttttttttt2222222--------222-2- ${x}");


    List<Article> articles = MocksArticle.all();
    // List<Article> articles =  this.articles.snapshots() as List<Article>;
    return articles;
  }


}