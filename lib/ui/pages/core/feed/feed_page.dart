import 'package:flutter/material.dart';

import '../../../../../../domain/entities/entities.dart';
import '../../../../shared/shared.dart';
import '../../../components/components.dart';
import 'feed_presenter.dart';

class FeedPage extends StatefulWidget {
  final Size size;
  final FeedPresenter presenter;

  const FeedPage({
    Key? key,
    required this.size,
    required this.presenter,
  }) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  void initState() {
    super.initState();
    widget.presenter.updateUserId();
    widget.presenter.userCommunicateStream.listen((event) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(event),
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 3),
        ),
      );
    });
    widget.presenter.errorStream.listen((event) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(event),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 5),
        ),
      );
    });
  }

  void navigateToPostPage({required String publishId}) {
    Navigator.of(context).pushNamed('/post-detail', arguments: publishId);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      primary: true,
      child: Column(
        children: [
          SizedBox(
            height: widget.size.height * 0.15,
            child: StreamBuilder<UserEntity>(
              stream: widget.presenter.user,
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  return StreamBuilder<bool>(
                    stream: widget.presenter.isValidPublish,
                    builder: (context, isValidSnapshot) {
                      return Post(
                        image: snapshot.data != null ? snapshot.data!.photoUrl : '',
                        hintTextTextField: "Adicione uma postagem",
                        functionButtonTextField: widget.presenter.addPublish,
                        functionImage: () {},
                        size: widget.size,
                        onTextEditing: widget.presenter.validPublishContent,
                        isValid: isValidSnapshot.data ?? false,
                        textFieldController: widget.presenter.publishTextFieldController,
                      );
                    },
                  );
                }
                return const CircleAvatar();
              },
            ),
          ),
          CustomDivider(
            size: widget.size,
            height: 0.015,
          ),
          StreamBuilder<List<PublishEntity>>(
            stream: widget.presenter.publishStream,
            builder: (context, snapshot) {
              if (snapshot.data != null && snapshot.hasData) {
                snapshot.data?.sort(
                  (a, b) {
                    return a.createdAt.isBefore(b.createdAt)
                        ? 1
                        : a.createdAt.isAtSameMomentAs(b.createdAt)
                            ? 0
                            : -1;
                  },
                );
                return ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return ViewPost(
                      onConfirmDelete: () => widget.presenter.removePublish(publishId: snapshot.data![index].uid),
                      size: widget.size,
                      publishUser: widget.presenter.loadUserEntityById(uid: snapshot.data![index].userId),
                      publish: snapshot.data![index],
                      onLikeClick: () => widget.presenter.likeClick(publishId: snapshot.data![index].uid),
                      onUserImageClick: () {},
                      onContentClick: () => navigateToPostPage(publishId: snapshot.data![index].uid),
                      onCommentClick: () => navigateToPostPage(publishId: snapshot.data![index].uid),
                      currentUser: widget.presenter.user,
                    );
                  },
                );
              }
              return const Center();
            },
          ),
        ],
      ),
    );
  }
}
