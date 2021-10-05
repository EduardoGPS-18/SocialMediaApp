import 'package:flutter/material.dart';

import '../../../shared/shared.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool islog = true;
  int _currentIndexBottomNavigationBar = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(text: "Feed"),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: PageController(initialPage: 0),
        children: [
          SingleChildScrollView(
            primary: true,
            child: Column(children: [
              SizedBox(
                  height: size.height * 0.15,
                  child: Post(
                    image: "lib/ui/assets/images/test.jpg",
                    hintTextTextField: "Adicione uma postagem",
                    functionBottonTextField: () {},
                    functionImage: () {},
                    size: size,
                  )),
              CustomDivider(
                size: size,
                altura: 0.015,
              ),
              ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return ViewPost(
                      size: size,
                    );
                  }),
            ]),
          )
        ],
      ),
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
