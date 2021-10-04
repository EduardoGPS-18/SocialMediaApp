import 'dart:io';

import 'package:flutter/material.dart';

import '../../components/components.dart';
import 'auth.dart';

class AuthPage extends StatefulWidget {
  final PageController pageController = PageController();
  final AuthPagePresenter presenter;

  AuthPage({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  void initState() {
    super.initState();
    widget.presenter.pageIndex.listen((index) {
      widget.pageController.animateToPage(
        index,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
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
            PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: widget.pageController,
              children: [
                PageWithCenterCard(
                  size: size,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: size.width * 0.1,
                      ),
                      child: const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage("lib/ui/assets/icons/login_icon.png"),
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: "Iniciar Sessão com a sua",
                        style: Theme.of(context).textTheme.headline5?.copyWith(),
                        children: [
                          TextSpan(
                            text: "\nConta da SocialMedia",
                            style: Theme.of(context).textTheme.headline5?.copyWith(
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
                          style: Theme.of(context).textTheme.subtitle2?.copyWith(
                                color: Theme.of(context).colorScheme.onBackground,
                              ),
                        ),
                        TextButton(
                          onPressed: () => widget.presenter.setPageIndex(1),
                          child: Text(
                            "Registre-se",
                            style: Theme.of(context).textTheme.subtitle2?.copyWith(
                                  color: Theme.of(context).colorScheme.secondaryVariant,
                                ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: size.width * 0.1,
                        bottom: size.width * 0.04,
                      ),
                      child: CustomTextFormField(
                        segureText: false,
                        onChanged: widget.presenter.validateEmail,
                        size: size,
                        labelText: "E-mail",
                        prefixIcon: Icons.email,
                      ),
                    ),
                    CustomTextFormField(
                      segureText: true,
                      size: size,
                      labelText: "Senha",
                      onChanged: widget.presenter.validatePassword,
                      prefixIcon: Icons.security,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.09),
                      child: SizedBox(
                        height: size.width * 0.155,
                        width: size.width * 0.8,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "INICIAR SESSÃO",
                            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                  fontWeight: FontWeight.w900,
                                  color: Theme.of(context).colorScheme.background,
                                ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                PageWithCenterCard(
                  size: size,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
                      child: Text.rich(
                        TextSpan(
                          text: "Crie um nova Conta\nna ",
                          style: Theme.of(context).textTheme.headline5?.copyWith(),
                          children: [
                            TextSpan(
                              text: "SocialMedia",
                              style: Theme.of(context).textTheme.headline5?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: size.width * 0.04),
                      child: Column(children: [
                        InkWell(
                          onTap: widget.presenter.setImage, //função da imagem
                          child: StreamBuilder<File?>(
                            stream: widget.presenter.userImage,
                            builder: (context, snapshot) {
                              if (snapshot.data != null && snapshot.hasData) {
                                return CircleAvatar(
                                  radius: 50,
                                  backgroundImage: FileImage(snapshot.data!),
                                );
                              }
                              return const CircleAvatar(
                                radius: 50,
                                backgroundImage: AssetImage("lib/ui/assets/images/camera.png"),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: size.width * 0.01),
                          child: const Text("Adicione uma image"),
                        )
                      ]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: size.width * 0.03),
                      child: CustomTextFormField(
                        segureText: false,
                        size: size,
                        labelText: "Name",
                        onChanged: widget.presenter.validateName,
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
                      labelText: "Repitir a senha",
                      prefixIcon: Icons.security,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.035),
                      child: SizedBox(
                        height: size.width * 0.155,
                        width: size.width * 0.8,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "CADASTRAR",
                            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                  fontWeight: FontWeight.w900,
                                  color: Theme.of(context).colorScheme.background,
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
                          style: Theme.of(context).textTheme.subtitle2?.copyWith(
                                color: Theme.of(context).colorScheme.onBackground,
                              ),
                        ),
                        TextButton(
                          onPressed: () => widget.presenter.setPageIndex(0),
                          child: Text(
                            "Inciar Sessão",
                            style: Theme.of(context).textTheme.subtitle2?.copyWith(
                                  color: Theme.of(context).colorScheme.secondaryVariant,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
