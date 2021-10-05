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
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Column(children: [
                      SizedBox(
                        height: 230,
                        //color: Colors.grey,
                        child: Column(
                          children: [
                            ListTile(
                              leading: GestureDetector(
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
                                padding:
                                    EdgeInsets.only(bottom: size.width * 0.02),
                                child: Text(
                                  "Pabricio Freitas",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              subtitle: Text("Pabricio Freitas"),
                            ),
                            Text(
                                "Mais um trabalho realizado com sucesso. Obrigado ao aplicativo por proporcionar essa oportunidade")
                          ],
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
