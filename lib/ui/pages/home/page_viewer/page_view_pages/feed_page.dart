import 'package:flutter/material.dart';

import '../../../../../domain/entities/entities.dart';
import '../../../../../shared/widget/widget.dart';
import '../../../../components/home/page_viewer/page_view_page/feed_components/feed_components.dart';

class FeedPage extends StatelessWidget {
  final Size size;
  const FeedPage({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      primary: true,
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.15,
            child: Post(
              image: "lib/ui/assets/images/test.jpg",
              hintTextTextField: "Adicione uma postagem",
              functionBottonTextField: () {},
              functionImage: () {},
              size: size,
            ),
          ),
          CustomDivider(
            size: size,
            height: 0.015,
          ),
          ListView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (context, index) {
              return ViewPost(
                size: size,
                user: const UserEntity(
                  email: "eduardo@gmail.com",
                  name: "Eduardo",
                  photoUrl:
                      "https://thumbs.dreamstime.com/b/no-image-available-icon-flat-vector-no-image-available-icon-flat-vector-illustration-132482953.jpg",
                  uid: "asdhizxcjkn",
                ),
                publish: PublishEntity(
                  uid: "asdiaajsd",
                  content: "Bom dia",
                  createdAt: DateTime.now(),
                  uidOfWhoLikedIt: const ["asdasdj ", "asdmkasd"],
                  userId: "asdlamsd",
                  comments: [
                    CommentEntity(
                      userId: "asdajsnd",
                      publishId: "afskasmf",
                      uid: "",
                      content: "content",
                      createdAt: DateTime.now(),
                    ),
                  ],
                ),
                onLikeClick: () {},
                onUserImageClick: () {},
                onContentClick: () {},
                onCommentClick: () {},
              );
            },
          ),
        ],
      ),
    );
  }
}
