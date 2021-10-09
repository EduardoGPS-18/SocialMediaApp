import 'package:flutter/material.dart';

import '../../../../../../../domain/entities/entities.dart';
import '../../../../../shared/shared.dart';

class PublishHeader extends StatelessWidget {
  final UserEntity publishUser;
  final Size size;
  final UserEntity currentUser;
  final PublishEntity publish;
  final Function() onUserImageClick;
  final Function()? onOptionClick;
  final Function()? onConfirmDelete;

  const PublishHeader({
    Key? key,
    required this.publishUser,
    required this.size,
    required this.currentUser,
    required this.publish,
    required this.onUserImageClick,
    this.onOptionClick,
    this.onConfirmDelete,
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
                image: NetworkImage(publishUser.photoUrl),
              ),
            ),
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(bottom: size.width * 0.018),
          child: Text(
            publishUser.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        subtitle: Text(
          "${publish.createdAt.year}/${publish.createdAt.month} : ${publish.createdAt.hour}:${publish.createdAt.minute}",
        ),
        trailing: CustomShowModalBottomSheet(
          size: size,
          commentIsUser: currentUser.uid == publish.userId,
          onConfirmDelete: onConfirmDelete,
        ),
      ),
    );
  }
}
