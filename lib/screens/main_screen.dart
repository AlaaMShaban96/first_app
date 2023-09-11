import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controllers/auth_controller.dart';
import 'package:test_app/widgets/article/article_list.dart';
import 'package:test_app/widgets/sharing/bottom_navigation_bar_template.dart';
import 'package:test_app/widgets/sharing/template.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState()  =>   _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context)  {
    return Template(
      body:  ArticleList(),
      floatingActionButton:  BottomNavigationBarTemplate.floatingActionButton(context),
    );
    return Scaffold(
      appBar: BottomNavigationBarTemplate.appBar(),
      floatingActionButton:BottomNavigationBarTemplate.floatingActionButton(context),
      body: BottomNavigationBarTemplate.selectWidget(_selectedIndex) ,
      bottomNavigationBar: BottomNavigationBarTemplate.bottomNavigationBar(_selectedIndex,(index) {
        setState(() {
          _selectedIndex = index;
        });
      }),
    );
  }
}

