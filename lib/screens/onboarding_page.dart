import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/screens/location_list.dart';

class OnboardingPageModel {
  final String title;
  final String description;
  // final String image;
  final Color bgColor;
  final Color textColor;

  OnboardingPageModel(
      {required this.title,
        required this.description,
        // required this.image,
        this.bgColor = Colors.blue,
        this.textColor = Colors.white});
}

class OnboardingPage extends StatefulWidget {
  final List<OnboardingPageModel> pages;

  const OnboardingPage({Key? key, required this.pages}) : super(key: key);

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  bool _hasSeenOnboarding = false;

  @override
  void initState() {
    super.initState();
    // Check if the user has seen the onboarding screen.
    _getHasSeenOnboardingFromSharedPreferences();
  }
  void _getHasSeenOnboardingFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _hasSeenOnboarding = prefs.getBool('hasSeenOnboarding') ?? false;
    print("on _getHasSeenOnboardingFromSharedPreferences == ${prefs.getBool('hasSeenOnboarding')}");
  }
  // Store the currently visible page
  int _currentPage = 0;

  // Define a controller for the pageview
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    if (_hasSeenOnboarding) {
      // The user has seen the onboarding screen, so go to the next screen.
      return LocationList();
    } else {

      return Scaffold(
        body: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          color: widget.pages[_currentPage].bgColor,
          child: SafeArea(
            child: Column(
              children: [
                Expanded(
                  // Pageview to render each page
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: widget.pages.length,
                    onPageChanged: (idx) {
                      // Change current page when pageview changes
                      setState(() {
                        _currentPage = idx;
                      });
                    },
                    itemBuilder: (context, idx) {
                      final _item = widget.pages[idx];
                      return Column(
                        children: [
                          // Expanded(
                          //   flex: 3,
                          //   child: Padding(
                          //     padding: const EdgeInsets.all(32.0),
                          //     child: Image.asset(
                          //       _item.image,
                          //     ),
                          //   ),
                          // ),
                          Expanded(
                              flex: 1,
                              child: Column(children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(_item.title,
                                      style: Theme
                                          .of(context)
                                          .textTheme
                                          .headline6
                                          ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: _item.textColor,
                                      )),
                                ),
                                Container(
                                  constraints: BoxConstraints(maxWidth: 280),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24.0, vertical: 8.0),
                                  child: Text(_item.description,
                                      textAlign: TextAlign.center,
                                      style: Theme
                                          .of(context)
                                          .textTheme
                                          .bodyText2
                                          ?.copyWith(
                                        color: _item.textColor,
                                      )),
                                )
                              ]))
                        ],
                      );
                    },
                  ),
                ),

                // Current page indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: widget.pages
                      .map((item) =>
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        width: _currentPage == widget.pages.indexOf(item)
                            ? 20
                            : 4,
                        height: 4,
                        margin: const EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0)),
                      ))
                      .toList(),
                ),

                // Bottom buttons
                SizedBox(
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {

                            Navigator.pushAndRemoveUntil(context,  MaterialPageRoute(
                              builder:(context)=>LocationList(),
                            ), (route) => false);
                            // Handle Skipping onboarding page
                          },
                          child: Text(
                            "Skip",
                            style: TextStyle(color: Colors.white),
                          )),
                      TextButton(
                        onPressed: () {
                          if (_currentPage == widget.pages.length - 1) {
                            // This is the last page
                            print("testtt");

                            Navigator.pushAndRemoveUntil(context,  MaterialPageRoute(
                              builder:(context)=>LocationList(),
                            ), (route) => false);
                          } else {
                            _pageController.animateToPage(_currentPage + 1,
                                curve: Curves.easeInOutCubic,
                                duration: const Duration(milliseconds: 250));
                          }
                        },
                        child: Text(
                          _currentPage == widget.pages.length - 1
                              ? "Finish"
                              : "Next",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }
  }
}