import 'package:flutter/material.dart';

import '../../../../../../../domain/entities/entities.dart';

class PublishHeader extends StatelessWidget {
  final UserEntity user;
  final Size size;
  final PublishEntity publish;
  final Function() onUserImageClick;
  const PublishHeader({
    Key? key,
    required this.user,
    required this.size,
    required this.publish,
    required this.onUserImageClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: size.width * 0.01),
      child: ListTile(
        leading: InkWell(
          onTap: onUserImageClick,
          child: Container(
            width: size.width * 0.13,
            height: size.width * 0.13,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(user.photoUrl),
              ),
            ),
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(bottom: size.width * 0.018),
          child: Text(
            user.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        subtitle: Text("${publish.createdAt.year}/${publish.createdAt.month} : ${publish.createdAt.hour}:${publish.createdAt.minute}"),
      ),
    );
  }
}
