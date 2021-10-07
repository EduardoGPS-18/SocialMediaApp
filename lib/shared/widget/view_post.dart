import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../domain/entities/entities.dart';
import 'widget.dart';

class ViewPost extends StatefulWidget {
  final Size size;
  final UserEntity user;
  final PublishEntity publish;
  final Function() onContentClick;
  final Function() onLikeClick;
  final Function() onUserImageClick;

  const ViewPost({
    Key? key,
    required this.size,
    required this.user,
    required this.publish,
    required this.onContentClick,
    required this.onLikeClick,
    required this.onUserImageClick,
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
              //   color: Colors.red,
              child: testSmimer.isEmpty
                  ? Shimmer.fromColors(
                      baseColor: Theme.of(context).colorScheme.onBackground.withAlpha(60),
                      highlightColor: Colors.grey[100]!,
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
                  : Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: widget.size.width * 0.01),
                            child: ListTile(
                              leading: InkWell(
                                onTap: widget.onUserImageClick,
                                child: Container(
                                  width: widget.size.width * 0.13,
                                  height: widget.size.width * 0.13,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(widget.user.photoUrl),
                                    ),
                                  ),
                                ),
                              ),
                              title: Padding(
                                padding: EdgeInsets.only(bottom: widget.size.width * 0.018),
                                child: Text(
                                  widget.user.name,
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              subtitle: Text(
                                  "${widget.publish.createdAt.year}/${widget.publish.createdAt.month} : ${widget.publish.createdAt.hour}:${widget.publish.createdAt.minute}"),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: InkWell(
                                onTap: widget.onContentClick,
                                child: Text(
                                  widget.publish.content,
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: widget.size.width * 0.015,
                            ),
                            child: Row(
                              children: [
                                IconButton(
                                  iconSize: widget.size.width * 0.07,
                                  onPressed: widget.onLikeClick,
                                  icon: onPressedFavorite
                                      ? Icon(
                                          Icons.favorite_outlined,
                                          color: Theme.of(context).colorScheme.error,
                                        )
                                      : const Icon(
                                          Icons.favorite_border_outlined,
                                        ),
                                ),
                                InkWell(
                                  onTap: widget.onLikeClick,
                                  child: Text.rich(
                                    TextSpan(
                                      text: "${widget.publish.uidOfWhoLikedIt.length}",
                                      style: TextStyle(
                                        color: Theme.of(context).colorScheme.primary,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: " curtidas",
                                          style: TextStyle(
                                            color: Theme.of(context).colorScheme.onBackground,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                //
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: widget.size.width * 0.05,
                                  ),
                                  child: IconButton(iconSize: widget.size.width * 0.07, onPressed: () {}, icon: const Icon(Icons.mode_comment_outlined)),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Text.rich(
                                    TextSpan(
                                      text: "${widget.publish.comments.length}",
                                      style: TextStyle(
                                        color: Theme.of(context).colorScheme.primary,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: " comentários",
                                          style: TextStyle(
                                            color: Theme.of(context).colorScheme.onBackground,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
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
