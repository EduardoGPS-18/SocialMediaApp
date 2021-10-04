import 'package:flutter/material.dart';

import '../../../shared/shared.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController pageController;

  bool islog = true;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  int _currentIndexBottomNavigationBar = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: CustomAppBar(text: "Feed"),

      bottomNavigationBar: BottomNavigationBar(
        elevation: 15,
        backgroundColor: Theme.of(context).colorScheme.background,
        onTap: (index) {
          setState(() {
            _currentIndexBottomNavigationBar = index;
          });
        },
        currentIndex: _currentIndexBottomNavigationBar,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Postar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
