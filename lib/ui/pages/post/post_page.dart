import 'package:flutter/material.dart';

import '../../../domain/entities/entities.dart';
import '../../../shared/shared.dart';
import '../../components/components.dart';
import 'post_presenter.dart';

class PostPage extends StatefulWidget {
  final PostPresenter presenter;
  const PostPage({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String publishId = ModalRoute.of(context)?.settings.arguments as String;
    if (publishId.isEmpty) {
      Navigator.pop(context);
    }
    return StreamBuilder<PublishEntity>(
      stream: widget.presenter.getPublishById(id: publishId),
      builder: (context, publishSnapshot) {
        if (publishSnapshot.hasData) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Scaffold(
              appBar: const CustomAppBar(text: "Postagem"),
              body: SafeArea(
                child: SizedBox.expand(
                  child: Column(
                    children: [
                      ViewPost(
                        size: size,
                        currentUser: widget.presenter.currentUser,
                        publish: publishSnapshot.data!,
                        publishUser: widget.presenter.loadUserById(id: publishSnapshot.data!.userId),
                      ),
                      CustomDivider(height: 0.002, size: size),
                      StreamBuilder<List<CommentEntity>>(
                        stream: widget.presenter.comments(publishId: publishId),
                        builder: (context, commentsSnapshot) {
                          if (commentsSnapshot.hasData) {
                            return Expanded(
                              child: ListView.separated(
                                primary: false,
                                shrinkWrap: true,
                                itemCount: commentsSnapshot.data?.length ?? 0,
                                separatorBuilder: (BuildContext context, int index) => CustomDivider(
                                  height: 0.005,
                                  size: size,
                                ),
                                itemBuilder: (context, index) {
                                  return StreamBuilder<UserEntity>(
                                    stream: widget.presenter.currentUser,
                                    builder: (context, currentUserSnapshot) {
                                      if (currentUserSnapshot.hasData && currentUserSnapshot.data != null) {
                                        return Comment(
                                          configButton: CustomShowModalBottomSheet(
                                            size: size,
                                            onConfirmDelete: () => widget.presenter.deleteComment(
                                              commentId: commentsSnapshot.data![index].uid,
                                              publishId: publishSnapshot.data!.uid,
                                            ),
                                            commentIsUser: commentsSnapshot.data![index].userId == currentUserSnapshot.data!.uid,
                                          ),
                                          size: size,
                                          onUserImageClick: () {},
                                          user: widget.presenter.loadUserById(id: commentsSnapshot.data?[index].userId ?? ""),
                                          commentContent: commentsSnapshot.data?[index].content ?? "Sem conteudo!",
                                          commentDate: commentsSnapshot.data?[index].createdAt ?? DateTime.now(),
                                        );
                                      } else {
                                        return const Center();
                                      }
                                    },
                                  );
                                },
                              ),
                            );
                          } else {
                            return const SizedBox();
                          }
                        },
                      ),
                      CustomDivider(height: 0.002, size: size),
                      StreamBuilder<UserEntity>(
                        stream: widget.presenter.currentUser,
                        builder: (context, userSnapshot) {
                          return StreamBuilder<bool>(
                            stream: widget.presenter.isValidComment,
                            builder: (context, isValidSnapshot) {
                              return Post(
                                image: userSnapshot.data?.photoUrl ?? "",
                                hintTextTextField: "Adicione uma comentário",
                                functionBottonTextField: () {},
                                functionImage: () {},
                                onTextEditing: widget.presenter.validateComment,
                                onEditingComplete: isValidSnapshot.hasData && isValidSnapshot.data == true
                                    ? () async => await widget.presenter.addComment(
                                          publishId: publishSnapshot.data?.uid ?? "",
                                        )
                                    : null,
                                size: size,
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
