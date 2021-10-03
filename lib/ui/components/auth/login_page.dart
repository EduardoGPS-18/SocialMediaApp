import 'package:flutter/material.dart';

import 'auth.dart';

class LoginPage extends StatefulWidget {
  Size size;

  LoginPage({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: widget.size.height,
        child: Center(
          child: Container(
            height: widget.size.height * 0.9,
            width: widget.size.width * 0.9,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 25.0, // has the effect of softening the shadow
                  spreadRadius: 1.0, // has the effect of extending the shadow
                  offset: Offset(
                    2.0, // horizontal, move right 10
                    2.0, // vertical, move down 10
                  ),
                ),
              ],
              borderRadius: BorderRadius.circular(widget.size.width * 0.015),
              color: Theme.of(context).colorScheme.background,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: widget.size.width * 0.1),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        AssetImage("lib/ui/assets/icons/login_icon.png"),
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
                      onPressed: () {},
                      child: Text(
                        "Registre-se",
                        style: Theme.of(context).textTheme.subtitle2?.copyWith(
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
                      top: widget.size.width * 0.1,
                      bottom: widget.size.width * 0.04),
                  child: CustomTextFormField(
                    segureText: false,
                    size: widget.size,
                    labelText: "E-mail",
                    prefixIcon: Icons.email,
                  ),
                ),
                CustomTextFormField(
                  segureText: true,
                  size: widget.size,
                  labelText: "Senha",
                  prefixIcon: Icons.security,
                ),
                Padding(
                  padding: EdgeInsets.only(top: widget.size.height * 0.09),
                  child: SizedBox(
                    height: widget.size.width * 0.155,
                    width: widget.size.width * 0.8,
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
          ),
        ),
      ),
    );
  }
}
