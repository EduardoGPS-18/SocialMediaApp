import 'package:flutter/material.dart';

import '../../../../domain/entities/entities.dart';
import '../../../../shared/shared.dart';
import 'create_post.dart';

class CreatePostPage extends StatefulWidget {
  final CreatePostPresenter presenter;

  const CreatePostPage({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  final FocusNode _textFocus = FocusNode();

  void addPublishAndReturn() {
    widget.presenter.addPublish();

    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();

    widget.presenter.updateUserId();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool isFocus = _textFocus.hasFocus;

    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: const CustomAppBar(
          text: "Criar postagem",
        ),
        body: SafeArea(
          child: StreamBuilder<UserEntity>(
            stream: widget.presenter.user,
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(size.width * 0.02),
                      child: ListTile(
                        title: Text(
                          snapshot.data!.name,
                        ),
                        leading: Container(
                          width: size.width * 0.13,
                          height: size.width * 0.13,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(snapshot.data!.photoUrl),
                            ),
                          ),
                        ),
                      ),
                    ),
                    CustomDivider(height: 0.002, size: size),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.06),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: isFocus
                              ? size.height * 0.285
                              : size.height * 0.69,
                        ),
                        child: TextFormField(
                          focusNode: _textFocus,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                          minLines: 2,
                          onChanged: widget.presenter.validPublishContent,
                          maxLines: 10,
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
                  ],
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
        bottomSheet: SizedBox(
          height: 60,
          width: double.infinity,
          child: StreamBuilder<bool>(
            initialData: false,
            stream: widget.presenter.isValidPublish,
            builder: (context, snapshot) {
              return ElevatedButton(
                onPressed: snapshot.hasData &&
                        snapshot.data != null &&
                        snapshot.data == true
                    ? addPublishAndReturn
                    : null,
                child: Text(
                  "Publicar",
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
