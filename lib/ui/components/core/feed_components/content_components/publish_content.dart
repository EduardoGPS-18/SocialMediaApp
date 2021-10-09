import 'package:flutter/material.dart';

class PublishContent extends StatelessWidget {
  const PublishContent({
    Key? key,
    required this.onContentClick,
    required this.content,
  }) : super(key: key);

  final Function()? onContentClick;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        onTap: onContentClick,
        child: Row(
          children: [
            Flexible(
              child: Text(
                content,
                style: const TextStyle(
                  fontSize: 18,
                ),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                maxLines: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
