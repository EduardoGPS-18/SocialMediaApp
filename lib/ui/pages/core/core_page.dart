import 'package:flutter/material.dart';
import '../../../shared/shared.dart';
import 'core.dart';

class CorePageApp extends StatefulWidget {
  final CorePresenter presenter;
  final PageController pageController = PageController();
  final FeedPresenter feedPresenter;
  CorePageApp({
    Key? key,
    required this.presenter,
    required this.feedPresenter,
  }) : super(key: key);

  @override
  _CorePageAppState createState() => _CorePageAppState();
}

class _CorePageAppState extends State<CorePageApp> {
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
    widget.presenter.updateUserId();
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
            FeedPage(
              size: size,
              presenter: widget.feedPresenter,
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
