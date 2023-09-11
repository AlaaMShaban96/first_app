

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controllers/article_controller.dart';
import 'package:test_app/helpers/helper.dart';

import 'package:test_app/mocks/mocks_article.dart';
import 'package:test_app/models/article.dart';
class ArticleList extends StatelessWidget  {
    ArticleList({super.key});
   var controller = Get.put(ArticleController());
   @override
  Widget build(BuildContext context) {
    return  articleList() ;
  }
  Widget articleList (){
    List<Article> articles = MocksArticle.all();
    return GetX<ArticleController>(
        builder: (controller){
            if(controller.isLoading.value ){
              return const Center(child: CircularProgressIndicator(),);
            }else{
              return  getList(controller);
            }
        },
    );

   }
   Widget getList( articleController){

     return ListView.builder(
       itemCount: articleController.articles.length,
       itemBuilder: (BuildContext context, int index) {
         // final item = articleController.articles[index];
         return Container(
           height: 136,
           margin:
           const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
           decoration: BoxDecoration(
               border: Border.all(color: const Color(0xFFE0E0E0)),
               borderRadius: BorderRadius.circular(8.0)),
           padding: const EdgeInsets.all(8),
           child: Row(
             children: [
               Expanded(
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(
                         articleController.articles[index].title??"text",
                         style: const TextStyle(fontWeight: FontWeight.bold),
                         maxLines: 2,
                         overflow: TextOverflow.ellipsis,
                       ),
                       const SizedBox(height: 8),
                       Text("${articleController.articles[index].author} · ${articleController.articles[index].postedOn}",
                           style: Theme.of(context).textTheme.caption),
                       const SizedBox(height: 8),
                       Row(
                         mainAxisSize: MainAxisSize.min,
                         children: [
                           Icons.bookmark_border_rounded,
                           Icons.share,
                           Icons.more_vert
                         ].map((e) {
                           return InkWell(
                             onTap: () {},
                             child: Padding(
                               padding: const EdgeInsets.only(right: 8.0),
                               child: Icon(e, size: 16),
                             ),
                           );
                         }).toList(),
                       )
                     ],
                   )),
               Container(
                   width: 100,
                   height: 100,
                   decoration: BoxDecoration(
                       color: Colors.grey,
                       borderRadius: BorderRadius.circular(8.0),
                       image: DecorationImage(
                         fit: BoxFit.cover,
                         image: NetworkImage(articleController.articles[index].imageUrl!),
                       ))),
             ],
           ),
         );
       },
     );
   }
}

