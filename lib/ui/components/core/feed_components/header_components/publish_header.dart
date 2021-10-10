import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

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
    return ListTile(
      leading: InkWell(
        onTap: onUserImageClick,
        child: CachedNetworkImage(
          imageUrl: publishUser.photoUrl,
          height: size.width * 0.13,
          width: size.width * 0.13,
          fit: BoxFit.cover,
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor: Theme.of(context).colorScheme.primary,
            highlightColor: Theme.of(context).colorScheme.secondary,
            child: const CircleAvatar(
              minRadius: 32,
            ),
          ),
          imageBuilder: (context, imageProvider) {
            return CircleAvatar(
              backgroundImage: imageProvider,
            );
          },
        ),
      ),
      title: Padding(
        padding: EdgeInsets.only(bottom: size.width * 0.018),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: size.width * 0.5),
          child: Row(
            children: [
              Flexible(
                child: Text(
                  publishUser.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
      ),
      subtitle: Text("${publish.createdAt.day}/${publish.createdAt.month}/${publish.createdAt.year} - ${publish.createdAt.hour}:${publish.createdAt.minute}"),
      trailing: CustomShowModalBottomSheet(
        size: size,
        commentIsUser: currentUser.uid == publish.userId,
        onConfirmDelete: onConfirmDelete,
      ),
    );
  }
}
