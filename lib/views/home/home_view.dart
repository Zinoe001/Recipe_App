import 'package:flutter/material.dart';
import 'package:recipe_app_practice/views/body/body1.dart';
import 'package:recipe_app_practice/widgets/recipe_custom_icons.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

int _selectedPage = 0;
PageController _pageController = PageController();

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    onPageChange(int index) {
      setState(() {
        _selectedPage = index;
      });
      _pageController.jumpToPage(index);
    }

    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        body: PageView(
          controller: _pageController,
          children: <Widget>[
            const Body1(),
            Container(
              color: Colors.amber,
            ),
            Container(
              color: Colors.orange,
            ),
            Container(
              color: Colors.red,
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(RecipeApp.home), label: ""),
            BottomNavigationBarItem(icon: Icon(RecipeApp.bookmark), label: ""),
            BottomNavigationBarItem(icon: Icon(RecipeApp.local_mall), label: ""),
            BottomNavigationBarItem(
              icon: Icon(RecipeApp.profile),
              label: "",
            ),
          ],
          currentIndex: _selectedPage,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          onTap: onPageChange,
        ),
      ),
    );
  }
}
