import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/components.dart';
import '../../helpers/errors/errors.dart';
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

    widget.presenter.handlingError.listen((event) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(event),
        backgroundColor: Colors.red,
      ));
    });
    widget.presenter.navigateToStream.listen((event) {
      if (event.isNotEmpty) {
        Get.offAllNamed(event);
      }
    });
  }

  void registerUser() async {
    await widget.presenter.registerUser();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final presenter = widget.presenter;
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
                  controller: widget.pageController,
                  size: size,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: size.width * 0.1,
                      ),
                      child: const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(
                          "lib/ui/assets/icons/login_icon.png",
                        ),
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
                          onPressed: () => presenter.setPageIndex(1),
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
                      child: StreamBuilder<UIError>(
                        stream: widget.presenter.emailError,
                        initialData: UIError.noError,
                        builder: (context, snapshot) {
                          return CustomTextFormField(
                            keyboardType: TextInputType.emailAddress,
                            segureText: false,
                            errorText: snapshot.hasData && snapshot.data == UIError.noError ? null : snapshot.data?.description,
                            onChanged: presenter.validateEmail,
                            size: size,
                            labelText: "E-mail",
                            prefixIcon: Icons.email,
                          );
                        },
                      ),
                    ),
                    StreamBuilder<UIError>(
                      stream: widget.presenter.passwordError,
                      initialData: UIError.noError,
                      builder: (context, snapshot) {
                        return CustomTextFormField(
                          errorText: snapshot.hasData && snapshot.data == UIError.noError ? null : snapshot.data?.description,
                          segureText: true,
                          size: size,
                          labelText: "Senha",
                          onChanged: presenter.validatePassword,
                          prefixIcon: Icons.lock_sharp,
                        );
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.09),
                      child: SizedBox(
                        height: size.width * 0.155,
                        width: size.width * 0.8,
                        child: StreamBuilder<bool>(
                          stream: widget.presenter.isFormValid,
                          builder: (context, snapshot) {
                            return ElevatedButton(
                              onPressed: snapshot.data == true ? presenter.loginUser : null,
                              child: Text(
                                "INICIAR SESSÃO",
                                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                      fontWeight: FontWeight.w900,
                                      color: Theme.of(context).colorScheme.background,
                                    ),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
                PageWithCenterCard(
                  controller: widget.pageController,
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
                          onTap: presenter.setImage, //função da imagem
                          child: StreamBuilder<File?>(
                            stream: presenter.userImage,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
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
                          child: const Text("Tire uma foto"),
                        )
                      ]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: size.width * 0.03),
                      child: StreamBuilder<UIError>(
                          stream: presenter.nameError,
                          initialData: UIError.noError,
                          builder: (context, snapshot) {
                            return CustomTextFormField(
                              errorText: snapshot.hasData && snapshot.data == UIError.noError ? null : snapshot.data?.description,
                              segureText: false,
                              size: size,
                              labelText: "Nome",
                              onChanged: presenter.validateName,
                              prefixIcon: Icons.person,
                            );
                          }),
                    ),
                    StreamBuilder<UIError>(
                        stream: widget.presenter.emailError,
                        initialData: UIError.noError,
                        builder: (context, snapshot) {
                          return Padding(
                            padding: EdgeInsets.only(
                              bottom: size.width * 0.03,
                            ),
                            child: CustomTextFormField(
                              keyboardType: TextInputType.emailAddress,
                              errorText: snapshot.hasData && snapshot.data == UIError.noError ? null : snapshot.data?.description,
                              segureText: false,
                              size: size,
                              labelText: "E-mail",
                              onChanged: presenter.validateEmail,
                              prefixIcon: Icons.email,
                            ),
                          );
                        }),
                    StreamBuilder<UIError>(
                      stream: widget.presenter.passwordError,
                      initialData: UIError.noError,
                      builder: (context, snapshot) {
                        return Padding(
                          padding: EdgeInsets.only(
                            bottom: size.width * 0.03,
                          ),
                          child: CustomTextFormField(
                            errorText: snapshot.hasData && snapshot.data == UIError.noError ? null : snapshot.data?.description,
                            onChanged: presenter.validatePassword,
                            segureText: true,
                            size: size,
                            labelText: "Senha",
                            prefixIcon: Icons.lock_sharp,
                          ),
                        );
                      },
                    ),
                    StreamBuilder<UIError>(
                        stream: widget.presenter.confirmPasswordError,
                        initialData: UIError.noError,
                        builder: (context, snapshot) {
                          return CustomTextFormField(
                            errorText: snapshot.hasData && snapshot.data == UIError.noError ? null : snapshot.data?.description,
                            segureText: true,
                            size: size,
                            labelText: "Repita a senha",
                            onChanged: presenter.validateConfirmPassword,
                            prefixIcon: Icons.lock_sharp,
                          );
                        }),
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.035),
                      child: SizedBox(
                        height: size.width * 0.155,
                        width: size.width * 0.8,
                        child: StreamBuilder<bool>(
                          stream: presenter.isFormValid,
                          builder: (context, snapshot) {
                            return ElevatedButton(
                              onPressed: snapshot.data == true ? registerUser : null,
                              child: Text(
                                "CADASTRAR",
                                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                      fontWeight: FontWeight.w900,
                                      color: Theme.of(context).colorScheme.background,
                                    ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Já possui uma conta?",
                          style: Theme.of(context).textTheme.subtitle2?.copyWith(
                                color: Theme.of(context).colorScheme.onBackground,
                              ),
                        ),
                        TextButton(
                          onPressed: () => presenter.setPageIndex(0),
                          child: Text(
                            "Iniciar Sessão",
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
