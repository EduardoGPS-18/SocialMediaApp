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
  bool onPressedFavorite = true;
  String testSmimer = "a";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widget.size.height / 3,
          //color: Colors.grey,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: widget.size.height * 0.002,
            ),
            child: Container(
              child: testSmimer.isEmpty
                  ? Shimmer.fromColors(
                      baseColor: Theme.of(context).colorScheme.onBackground.withAlpha(60),
                      highlightColor: Colors.grey.shade100,
                      child: Column(children: [
                        ListTile(
                          leading: Container(
                            width: widget.size.width * 0.13,
                            height: widget.size.width * 0.13,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                          title: Container(
                            color: Colors.red,
                            height: widget.size.width * 0.04,
                            width: widget.size.width * 0.04,
                          ),
                          subtitle: Container(
                            color: Colors.red,
                            height: widget.size.width * 0.04,
                            width: widget.size.width * 0.04,
                          ),
                        ),
                        Container(
                          color: Colors.red,
                          height: widget.size.height * 0.13,
                          width: widget.size.width * 0.91,
                        ),
                        Container(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: widget.size.width * 0.048),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                color: Colors.red,
                                height: widget.size.height * 0.03,
                                width: widget.size.width * 0.3,
                              ),
                              SizedBox(
                                width: widget.size.width * 0.1,
                              ),
                              Container(
                                color: Colors.red,
                                height: widget.size.height * 0.03,
                                width: widget.size.width * 0.4,
                              ),
                            ],
                          ),
                        )
                      ]),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StreamBuilder<UserEntity>(
                          stream: widget.publishUser,
                          builder: (context, snapshot) {
                            if (snapshot.hasData && snapshot.data != null) {
                              return StreamBuilder<UserEntity>(
                                stream: widget.currentUser,
                                builder: (context, currentUserSnapshot) {
                                  if (currentUserSnapshot.hasData && currentUserSnapshot.data != null) {
                                    return PublishHeader(
                                      onOptionClick: () {},
                                      onConfirmDelete: widget.onConfirmDelete,
                                      publish: widget.publish,
                                      publishUser: snapshot.data!,
                                      onUserImageClick: () {},
                                      size: widget.size,
                                      currentUser: currentUserSnapshot.data!,
                                    );
                                  } else {
                                    return const Center();
                                  }
                                },
                              );
                            }
                            return const Center();
                          },
                        ),
                        Expanded(
                          child: PublishContent(
                            onContentClick: widget.onContentClick,
                            content: widget.publish.content,
                          ),
                        ),
                        StreamBuilder<UserEntity>(
                          stream: widget.currentUser,
                          builder: (context, snapshot) {
                            if (snapshot.hasData && snapshot.data != null) {
                              return PublishFooter(
                                size: widget.size,
                                onLikeClick: widget.onLikeClick,
                                isLiked: widget.publish.uidOfWhoLikedIt.contains(snapshot.data!.uid),
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
        ),
        CustomDivider(
          size: widget.size,
          height: 0.015,
        ),
      ],
    );
  }
}
