import 'package:flutter/material.dart';

import '../widget/custom_text_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

bool _segureText = true;

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Stack(
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
            child: SingleChildScrollView(
              child: Container(
                height: size.height * 0.9,
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
                        ))
                  ],
                  borderRadius: BorderRadius.circular(size.width * 0.015),
                  color: Theme.of(context).colorScheme.background,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: size.width * 0.1),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            AssetImage("lib/ui/assets/icons/login_icon.png"),
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: "Iniciar Sessão com a sua",
                        style:
                            Theme.of(context).textTheme.headline5?.copyWith(),
                        children: [
                          TextSpan(
                            text: "\nConta da SocialMedia",
                            style:
                                Theme.of(context).textTheme.headline5?.copyWith(
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
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                              ),
                        ),
                        TextButton(
                            onPressed: () {},
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
                            ))
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: size.width * 0.1, bottom: size.width * 0.04),
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
                      padding: EdgeInsets.only(top: size.height * 0.09),
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
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// color: Theme.of(context).colorScheme.onPrimary,

 