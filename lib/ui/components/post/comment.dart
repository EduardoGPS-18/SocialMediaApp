import 'package:flutter/material.dart';

import '../../../domain/entities/entities.dart';

class Comment extends StatelessWidget {
  final Size size;
  final Stream<UserEntity> user;
  final String commentContent;
  final DateTime commentDate;
  final Function() onUserImageClick;
  final Widget configButton;

  const Comment({
    Key? key,
    required this.size,
    required this.user,
    required this.commentContent,
    required this.commentDate,
    required this.onUserImageClick,
    required this.configButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.04, vertical: size.width * 0.02),
      child: StreamBuilder<UserEntity>(
        stream: user,
        builder: (ctx, userSnapshot) {
          if (userSnapshot.hasData && userSnapshot.data != null) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: size.width * 0.13,
                      height: size.width * 0.13,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(userSnapshot.data!.photoUrl),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: size.height * 0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ConstrainedBox(
                            constraints:
                                BoxConstraints(maxWidth: size.width * 0.6),
                            child: Text(
                              userSnapshot.data!.name,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Expanded(child: Center()),
                    configButton
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Flexible(
                      child: Text(commentContent,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 10,
                          textAlign: TextAlign.start),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.02),
                  child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                          "${commentDate.day}/${commentDate.month}/${commentDate.year} - ${commentDate.hour}:${commentDate.minute}")),
                ),
              ],
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
