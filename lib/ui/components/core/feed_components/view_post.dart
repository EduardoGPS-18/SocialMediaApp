import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../domain/entities/entities.dart';
import '../../../../shared/shared.dart';
import 'feed_components.dart';

class ViewPost extends StatefulWidget {
  final Size size;
  final Stream<UserEntity> publishUser;
  final Stream<UserEntity> currentUser;
  final PublishEntity publish;
  final Function()? onContentClick;
  final Function()? onLikeClick;
  final Function()? onUserImageClick;
  final Function()? onCommentClick;

  const ViewPost({
    Key? key,
    required this.size,
    required this.publishUser,
    required this.currentUser,
    required this.publish,
    this.onContentClick,
    this.onLikeClick,
    this.onUserImageClick,
    this.onCommentClick,
  }) : super(key: key);

  @override
  _ViewPostState createState() => _ViewPostState();
}

class _ViewPostState extends State<ViewPost> {
  bool onPressedFavorite = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: widget.size.height * 0.002,
                horizontal: widget.size.width * 0.004),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StreamBuilder<UserEntity>(
                  stream: widget.publishUser,
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data != null) {
                      return PublishHeader(
                        publish: widget.publish,
                        user: snapshot.data!,
                        onUserImageClick: () {},
                        size: widget.size,
                      );
                    }
                    return const Center();
                  },
                ),
                PublishContent(
                  onContentClick: widget.onContentClick,
                  content: widget.publish.content,
                ),
                StreamBuilder<UserEntity>(
                  stream: widget.currentUser,
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data != null) {
                      return PublishFooter(
                        size: widget.size,
                        onLikeClick: widget.onLikeClick,
                        isLiked: widget.publish.uidOfWhoLikedIt
                            .contains(snapshot.data!.uid),
                        favoriteLength: widget.publish.uidOfWhoLikedIt.length,
                        commentLength: widget.publish.commentsCount,
                        onCommentClick: widget.onCommentClick,
                      );
                    }
                    return const SizedBox();
                  },
                )
              ],
            ),
          ),
        ),
        CustomDivider(
          size: widget.size,
          height: 0.015,
        ),
      ],
    );
  }
}
