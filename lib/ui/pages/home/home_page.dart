import 'package:flutter/material.dart';

import 'home.dart';

import '../../../shared/shared.dart';
import '../../components/components.dart';

class HomePage extends StatefulWidget {
  final HomePagePresenter presenter;
  final PageController pageController = PageController();

  HomePage({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndexBottomNavigationBar = 0;

  @override
  void initState() {
    super.initState();
    widget.presenter.handlingError.listen((event) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(event),
        backgroundColor: Colors.red,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: const CustomAppBar(text: "Feed"),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: widget.pageController,
          children: [
            SingleChildScrollView(
              primary: true,
              child: Column(
                children: [
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
                    height: 0.015,
                  ),
                  ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return ViewPost(
                        size: size,
                      );
                    },
                  ),
                ],
              ),
            ),
            ProfilePage(
              size: size,
              name: "Pabricio",
              image: "lib/ui/assets/images/test.jpg",
              postQuantity: 30,
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
      ),
    );
  }
}
