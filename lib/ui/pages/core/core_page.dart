import 'package:flutter/material.dart';
import '../../../shared/shared.dart';
import 'core.dart';

class CorePageApp extends StatefulWidget {
  final CorePresenter presenter;
  final PageController pageController = PageController();
  final FeedPresenter feedPresenter;
  final ProfilePresenter profilePresenter;

  CorePageApp(
      {Key? key,
      required this.presenter,
      required this.feedPresenter,
      required this.profilePresenter})
      : super(key: key);

  @override
  _CorePageAppState createState() => _CorePageAppState();
}

class _CorePageAppState extends State<CorePageApp> {
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

    widget.presenter.pageIndexNotifier.addListener(() {
      widget.pageController.animateToPage(
        widget.presenter.pageIndexNotifier.value,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
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
            FeedPage(
              size: size,
              presenter: widget.feedPresenter,
            ),
            ProfilePage(
              size: size,
              presenter: widget.profilePresenter,
            )
          ],
        ),
        bottomNavigationBar: ValueListenableBuilder<int>(
          valueListenable: widget.presenter.pageIndexNotifier,
          builder: (context, value, _) => BottomNavigationBar(
            elevation: 15,
            backgroundColor: Theme.of(context).colorScheme.background,
            onTap: (index) {
              widget.presenter.pageIndexNotifier.value = index;
            },
            currentIndex: value,
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
      ),
    );
  }
}
