import 'package:flutter/material.dart';

import '../pages.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late PageController pageController;

  bool islog = true;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              top: size.height * 0.0,
              child: Container(
                height: size.height * 0.4,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            Positioned(
              left: size.width * 0.05,
              right: size.width * 0.05,
              bottom: size.height * 0.05,
              top: size.height * 0.05,
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: pageController,
                children: [
                  SizedBox(
                    child: SingleChildScrollView(
                      child: SizedBox(
                        height: size.height,
                        child: Center(
                          child: Container(
                            height: size.height * 0.9,
                            width: size.width * 0.9,
                            decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius:
                                      25.0, // has the effect of softening the shadow
                                  spreadRadius:
                                      1.0, // has the effect of extending the shadow
                                  offset: Offset(
                                    2.0, // horizontal, move right 10
                                    2.0, // vertical, move down 10
                                  ),
                                ),
                              ],
                              borderRadius:
                                  BorderRadius.circular(size.width * 0.015),
                              color: Theme.of(context).colorScheme.background,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              //mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //Login
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: size.width * 0.1),
                                  child: const CircleAvatar(
                                    radius: 50,
                                    backgroundImage: AssetImage(
                                        "lib/ui/assets/icons/login_icon.png"),
                                  ),
                                ),
                                Text.rich(
                                  TextSpan(
                                    text: "Iniciar Sessão com a sua",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        ?.copyWith(),
                                    children: [
                                      TextSpan(
                                        text: "\nConta da SocialMedia",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5
                                            ?.copyWith(
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Novo na SocialMedia?",
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2
                                          ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onBackground,
                                          ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          pageController.animateToPage(1,
                                              duration:
                                                  const Duration(seconds: 1),
                                              curve: Curves.easeInOut);
                                        });
                                      },
                                      child: Text(
                                        "Registre-se",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2
                                            ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondaryVariant,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: size.width * 0.1,
                                      bottom: size.width * 0.04),
                                  child: CustomTextFormField(
                                    segureText: false,
                                    size: size,
                                    labelText: "E-mail",
                                    prefixIcon: Icons.email,
                                  ),
                                ),
                                CustomTextFormField(
                                  segureText: true,
                                  size: size,
                                  labelText: "Senha",
                                  prefixIcon: Icons.security,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: size.height * 0.09),
                                  child: SizedBox(
                                    height: size.width * 0.155,
                                    width: size.width * 0.8,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: Text(
                                        "INICIAR SESSÃO",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            ?.copyWith(
                                              fontWeight: FontWeight.w900,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .background,
                                            ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  //
                  //
                  //
                  //REgistro
                  SizedBox(
                    child: SingleChildScrollView(
                      child: SizedBox(
                        height: size.height,
                        child: Center(
                          child: Container(
                            height: size.height * 0.9,
                            width: size.width * 0.9,
                            decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius:
                                      25.0, // has the effect of softening the shadow
                                  spreadRadius:
                                      1.0, // has the effect of extending the shadow
                                  offset: Offset(
                                    2.0, // horizontal, move right 10
                                    2.0, // vertical, move down 10
                                  ),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(
                                size.width * 0.015,
                              ),
                              color: Theme.of(context).colorScheme.background,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              //mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: size.height * 0.02),
                                  child: Text.rich(
                                    TextSpan(
                                      text: "Crie um nova Conta\nna ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5
                                          ?.copyWith(),
                                      children: [
                                        TextSpan(
                                          text: "SocialMedia",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5
                                              ?.copyWith(
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ],
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      bottom: size.width * 0.04),
                                  child: Column(children: [
                                    InkWell(
                                      onTap: () {}, //função da imagem
                                      child: const CircleAvatar(
                                        radius: 50,
                                        backgroundImage: AssetImage(
                                            "lib/ui/assets/images/camera.png"),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: size.width * 0.01),
                                      child: const Text("Adicione uma imagem"),
                                    )
                                  ]),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      bottom: size.width * 0.03),
                                  child: CustomTextFormField(
                                    segureText: false,
                                    size: size,
                                    labelText: "Nome",
                                    prefixIcon: Icons.person,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    bottom: size.width * 0.03,
                                  ),
                                  child: CustomTextFormField(
                                    segureText: false,
                                    size: size,
                                    labelText: "E-mail",
                                    prefixIcon: Icons.email,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    bottom: size.width * 0.03,
                                  ),
                                  child: CustomTextFormField(
                                    segureText: true,
                                    size: size,
                                    labelText: "Senha",
                                    prefixIcon: Icons.security,
                                  ),
                                ),
                                CustomTextFormField(
                                  segureText: true,
                                  size: size,
                                  labelText: "Repita a senha",
                                  prefixIcon: Icons.security,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: size.height * 0.035),
                                  child: SizedBox(
                                    height: size.width * 0.155,
                                    width: size.width * 0.8,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: Text(
                                        "CADASTRAR",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            ?.copyWith(
                                              fontWeight: FontWeight.w900,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .background,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Eu já tenho uma conta?",
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2
                                          ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onBackground,
                                          ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          pageController.animateToPage(0,
                                              duration:
                                                  const Duration(seconds: 1),
                                              curve: Curves.easeInOut);
                                        });
                                      },
                                      child: Text(
                                        "Iniciar Sessão",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2
                                            ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondaryVariant,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
left: size.width * 0.05,
      right: size.width * 0.05,
      bottom: size.height * 0.05,
      top: size.height * 0.05,
*/