import 'package:book_gallery/screens/favourite.dart';
import 'package:book_gallery/screens/profile.dart';
import 'package:book_gallery/screens/home.dart';
import 'package:flutter/material.dart';

class ScreenManager extends StatefulWidget {
  const ScreenManager({Key? key}) : super(key: key);

  @override
  _ScreenManagerState createState() => _ScreenManagerState();
}

class _ScreenManagerState extends State<ScreenManager> {
  int currentScreen = 0;
  final tabbedScreens = [
    { 'screen':'Books',
      'icon': Icon(
        Icons.book,
        color: const Color.fromRGBO(150, 148, 246, 1.0),
      ),
      'activeIcon' : Icon(
          Icons.book_online_outlined,
          color: const Color.fromRGBO(150, 148, 246, 1.0),
      )
    },
    {'screen':'Favourite Books',
      'icon': Icon(
        Icons.favorite_border_outlined,
        color:  const Color.fromRGBO(150, 148, 246, 1.0),
      ),
      'activeIcon' : Icon(
        Icons.favorite_outlined,
        color: const Color.fromRGBO(150, 148, 246, 1.0),
      )
    },
    {'screen':'Profile',
      'icon': Icon(
        Icons.person_outline,
        color:  const Color.fromRGBO(150, 148, 246, 1.0),
      ),
      'activeIcon' : Icon(
        Icons.person,
        color: const Color.fromRGBO(150, 148, 246, 1.0),
      )
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(150, 148, 246, 1.0),
          title: Text(
              '${tabbedScreens[currentScreen]['screen']}',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
            ),
          ),
        ),

        body: IndexedStack(
          index: currentScreen,
          children: [
              Home(),
              Favourite_Books(),
              Profile()
          ],
        ),

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentScreen,
          onTap: (screenIndex) => setState(() {
            currentScreen = screenIndex;
          }),
          iconSize: 27,
          items: tabbedScreens.map(
                  (screen) => BottomNavigationBarItem(
                    icon: screen['icon'] as Icon,
                    activeIcon: screen['activeIcon'] as Icon,
                    label: '${screen['screen']}',
                  )
            ).toList(),
        ),
    );
  }
}
