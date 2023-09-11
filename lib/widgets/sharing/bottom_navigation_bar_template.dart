import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:test_app/controllers/auth_controller.dart';
import 'package:test_app/screens/location_list.dart';
import 'package:test_app/widgets/article/article_form.dart';
import 'package:test_app/widgets/article/article_list.dart';
import 'package:get/get.dart';

class BottomNavigationBarTemplate  {
   // BottomNavigationBar({super.key,required this.selectedIndex});

static PreferredSizeWidget appBar(){
  AuthController authController =Get.find();
  // User? user =authController.user as User;
  var userEmail= authController.getUser();
  print("user from PreferredSizeWidget ===>${userEmail!}");
  return AppBar(
      title:  Text("Welcome  ${userEmail!}")
  );
}
static Widget selectWidget(index){
  return _widgets[index];
}

static List<Widget> navBarItems(){
  return _widgets;
}
static List<SalomonBottomBarItem> getNavBarItems(){
  return _navBarItems;
}
static FloatingActionButton floatingActionButton(context) {
    return FloatingActionButton(
      onPressed: () {
        Get.to(const ArticleForm());
        // Navigator.push(context,MaterialPageRoute(
        //     builder:(context)=>const ArticleForm()
        // ));
      },
      child: const Icon(Icons.add),
    );
  }
static bottomNavigationBar (int selectedIndex , onTap(index)){
  return SalomonBottomBar(
    currentIndex: selectedIndex,
    selectedItemColor: const Color(0xff6200ee),
    unselectedItemColor: const Color(0xff757575),
      onTap: onTap,
    items: BottomNavigationBarTemplate.getNavBarItems(),
  );
}
}

final _navBarItems = [
  SalomonBottomBarItem(
    icon: const Icon(Icons.home),
    title: const Text("article"),
    // title:  ArticleList(),
    selectedColor: Colors.purple,
  ),
  SalomonBottomBarItem(
    icon: const Icon(Icons.favorite_border),
    title: const Text("locations"),
    selectedColor: Colors.pink,
  ),
  SalomonBottomBarItem(
    icon: const Icon(Icons.favorite_border),
    title: const Text("Likes3"),
    selectedColor: Colors.pink,
  ),
  SalomonBottomBarItem(
    icon: const Icon(Icons.search),
    title: const Text("Search"),
    selectedColor: Colors.orange,
  ),
];
final _widgets =[
    ArticleList(),
    LocationList(),
    ArticleList(),
    ArticleList()
];
