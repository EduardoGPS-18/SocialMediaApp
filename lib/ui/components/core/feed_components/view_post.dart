import 'package:flutter/material.dart';

import '../../../../../../domain/entities/entities.dart';
import '../../../../shared/shared.dart';
import 'feed_components.dart';

class ViewPost extends StatefulWidget {
  final Size size;
  final UserEntity publishUser;
  final UserEntity currentUser;
  final PublishEntity publish;
  final Function()? onContentClick;
  final Function()? onLikeClick;
  final Function()? onUserImageClick;
  final Function()? onCommentClick;
  final Function()? onConfirmDelete;
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
    this.onConfirmDelete,
  }) : super(key: key);

  @override
  _ViewPostState createState() => _ViewPostState();
}

class _ViewPostState extends State<ViewPost> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: widget.size.height * 0.002, horizontal: widget.size.width * 0.004),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PublishHeader(
                  currentUser: widget.currentUser,
                  publish: widget.publish,
                  publishUser: widget.publishUser,
                  onUserImageClick: () {},
                  size: widget.size,
                  onConfirmDelete: widget.onConfirmDelete,
                ),
                PublishContent(
                  onContentClick: widget.onContentClick,
                  content: widget.publish.content,
                ),
                PublishFooter(
                  size: widget.size,
                  onLikeClick: widget.onLikeClick,
                  isLiked: widget.publish.uidOfWhoLikedIt.contains(widget.currentUser.uid),
                  favoriteLength: widget.publish.uidOfWhoLikedIt.length,
                  commentLength: widget.publish.commentsCount,
                  onCommentClick: widget.onCommentClick,
                ),
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
