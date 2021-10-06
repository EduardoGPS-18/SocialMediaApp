import 'package:flutter/material.dart';

import '../../../shared/shared.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({Key? key}) : super(key: key);

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool isFocul = true;

    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: const CustomAppBar(
          text: "Criar postagem",
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(size.width * 0.02),
              child: ListTile(
                title: const Text(
                  "Pabricio Freitas",
                ),
                leading: Container(
                  width: size.width * 0.13,
                  height: size.width * 0.13,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("lib/ui/assets/images/test.jpg"),
                      )),
                ),
              ),
            ),
            CustomDivider(height: 0.002, size: size),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.06,
                vertical: size.width * 0.04,
              ),
              child: TextFormField(
                // focusNode: _focusNode,
                style: const TextStyle(
                  fontSize: 20,
                ),
                minLines: 2,
                maxLines: isFocul
                    ? 4
                    : 13, //Eu quero que mando esteja focado fique apenas 4 linha quando não tiver fica 13
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  hintStyle: TextStyle(fontSize: 20),
                  hintText: "Adicione o texto da sua postagem",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
        bottomSheet: SizedBox(
          height: 60,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              "Publicar",
              style: Theme.of(context).textTheme.headline6?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
