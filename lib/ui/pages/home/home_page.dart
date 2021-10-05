import 'package:flutter/material.dart';

import '../../../shared/shared.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool islog = true;
  bool onPressedFavorite = false;
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
                  child: WidgetPost(
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
                    return Column(children: [
                      SizedBox(
                        height: size.height * 0.33,
                        //color: Colors.grey,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: size.height * 0.02,
                          ),
                          child: Container(
                            //   color: Colors.red,
                            child: Column(
                              children: [
                                ListTile(
                                  leading: InkWell(
                                    onTap: () {},
                                    child: Container(
                                      width: size.width * 0.16,
                                      height: size.width * 0.16,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                "lib/ui/assets/images/test.jpg"),
                                          )),
                                    ),
                                  ),
                                  title: Padding(
                                    padding: EdgeInsets.only(
                                        bottom: size.width * 0.015),
                                    child: Text(
                                      "Pabricio Freitas",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  subtitle: Text("Terça-feira ás 08:22"),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: size.height * 0.005,
                                    horizontal: size.width * 0.045,
                                  ),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Text(
                                      "Mais um trabalho realizado com sucesso. Obrigado ao aplicativo por proporcionar essa oportunidade. ",
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.015,
                                  ),
                                  child: Row(
                                    children: [
                                      IconButton(
                                        iconSize: size.width * 0.07,
                                        onPressed: () {},
                                        icon: onPressedFavorite
                                            ? Icon(
                                                Icons.favorite_outlined,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .error,
                                              )
                                            : Icon(
                                                Icons.favorite_border_outlined,
                                              ),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Text.rich(
                                          TextSpan(
                                            text: "40",
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: " curtidas",
                                                style: TextStyle(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onBackground,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      //
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: size.width * 0.05,
                                        ),
                                        child: IconButton(
                                            iconSize: size.width * 0.07,
                                            onPressed: () {},
                                            icon: Icon(
                                                Icons.mode_comment_outlined)),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Text.rich(
                                          TextSpan(
                                            text: "40",
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: " comentários",
                                                style: TextStyle(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onBackground,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      CustomDivider(
                        size: size,
                        altura: 0.015,
                      ),
                    ]);
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
