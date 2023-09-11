import 'package:flutter/material.dart';
import 'package:test_app/widgets/sharing/bottom_navigation_bar_template.dart';
class Template extends StatefulWidget {
  Widget? body ;
  FloatingActionButton? floatingActionButton ;
  Template({super.key, this.body, this.floatingActionButton});

  @override
  // ignore: no_logic_in_create_state
  State<Template> createState() => _TemplateState(body: body,floatingActionButton: floatingActionButton);
}

class _TemplateState extends State<Template> {
  int _selectedIndex = 0;
  Widget? body ;
  FloatingActionButton? floatingActionButton  ;

  _TemplateState({this.body,this.floatingActionButton});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: BottomNavigationBarTemplate.appBar(),
      floatingActionButton:floatingActionButton  ,
      body:_selectedIndex != 0 ? BottomNavigationBarTemplate.selectWidget(_selectedIndex) : body,
      bottomNavigationBar: BottomNavigationBarTemplate.bottomNavigationBar(
          _selectedIndex, (index) {
        setState(() {
          _selectedIndex = index;

        });
      }),
    );
  }
}
