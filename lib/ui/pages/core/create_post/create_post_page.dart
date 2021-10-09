import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../shared/shared.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({Key? key}) : super(key: key);

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  final FocusNode _textFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool isFocul = _textFocus.hasFocus;

    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: const CustomAppBar(
          text: "Criar postagem",
        ),
        body: ListView(
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
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: isFocul ? size.height * 0.285 : size.height,
                ),
                child: TextFormField(
                  focusNode: _textFocus,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                  maxLines: 100,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(fontSize: 20),
                    hintText: "Adicione o texto da sua postagem",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
            ),
            // FormField(builder: ()=>)
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
