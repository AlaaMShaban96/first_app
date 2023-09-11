import 'package:get/get.dart';
import 'package:test_app/models/article.dart';
import 'package:test_app/repositories/article_repository.dart';

class ArticleController extends GetxController {
  var articles =<Article>[].obs;
  var isLoading=true.obs;
  var isError=false.obs;
  var articleRepo = ArticleRepository();
  @override
  void onInit() {
    getArticles();
    super.onInit();
  }


  getArticles() async {
    try{
      var respArticles = await articleRepo.getAllArticles();
      print("this is the resp from function ${respArticles}");
      if(respArticles != null)
        {
          articles.value=respArticles;

        }else{
        isLoading(false);
      }
      // articles.value=articleRepo.getAllArticles();
    }catch(e){
      isLoading(false);
      isError(true);
    }
  }
  addArticle(Article article){
    articles.add(article);
    Get.snackbar( "congregation", "has been add successfully");
    // const GetSnackBar(title : "done");
    print("add success");
  }

}