import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/meal.dart';
import 'package:flutter_complete_guide/screens/categories_screen.dart';
import 'package:flutter_complete_guide/screens/favoirtes_screen.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {'page': FavoritesScreen(widget.favoriteMeals), 'title': 'Favorites'},
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        // initialIndex: 0,
        child: Scaffold(
          drawer: MainDrawer(),
          appBar: AppBar(
            title: Text(_pages[_selectedPageIndex]['title']),
            // bottom: TabBar(
            //   tabs: [
            //     Tab(
            //       icon: Icon(Icons.category),
            //       text: 'Categories',
            //     ),
            //     Tab(
            //       icon: Icon(Icons.star),
            //       text: 'Favorites',
            //     ),
            //   ],
            // ),
          ),
          // body: TabBarView(children: [
          //   CategoriesScreen(),
          //   FavoritesScreen(),
          // ]),
          body: _pages[_selectedPageIndex]['page'],
          bottomNavigationBar: BottomNavigationBar(
            onTap: _selectPage,
            backgroundColor: Colors.pink,
            unselectedItemColor: Colors.white,
            selectedItemColor: Colors.amber,
            currentIndex: _selectedPageIndex,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                backgroundColor: Colors.pink,
                label: 'Categories',
                icon: Icon(Icons.category),
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.pink,
                label: 'Favorites',
                icon: Icon(Icons.star),
              ),
            ],
          ),
        ));
  }
}
