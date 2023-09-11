import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:test_app/controllers/article_controller.dart';
import 'package:test_app/helpers/helper.dart';
import 'package:test_app/models/article.dart';
import 'package:test_app/widgets/sharing/bottom_navigation_bar_template.dart';
import 'package:test_app/widgets/sharing/template.dart';
class ArticleForm extends StatefulWidget {
  const ArticleForm({super.key});

  @override
  State<ArticleForm> createState() => _ArticleFormState();
}

class _ArticleFormState extends State<ArticleForm> {
  TextEditingController nameController = TextEditingController();
  // TextEditingController titleController = TextEditingController();
  String fullName = '';
  Article newArticle = Article();
  ArticleController articleController =Get.find();

  @override
  Widget build(BuildContext context) {

              return Template(
                floatingActionButton: null,
                body:
                   Center(child:
                    Column(
                    children:
                      <Widget>[
                          textFieldInput("title",(text) =>setState(() =>newArticle.title = text)),
                          textFieldInput("imageUrl",(text) =>setState(() =>newArticle.imageUrl = text)),
                          textFieldInput("author",(text) =>setState(() =>newArticle.author = text)),
                          textFieldInput("postedOn",(text) =>setState(() =>newArticle.postedOn = text)),
                          ElevatedButton(
                          onPressed: () {
                          newArticle.id=22;
                          articleController.addArticle(newArticle);
                          },
                          child: const Text('Submit'),
                          )
                      ]
                    )
                  ),
              );

  }
}
// ignore: use_function_type_syntax_for_parameters
Widget textFieldInput( String labelText,onChanged(text)){
  return Container(
      margin: const EdgeInsets.all(20),
      child: TextField(
        decoration:  InputDecoration(
          border: const OutlineInputBorder(),
          labelText:  labelText,
        ),
        onChanged:onChanged));
}