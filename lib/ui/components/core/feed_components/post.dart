import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  final String image;
  final String hintTextTextField;
  final Function() functionImage;
  final Function() functionButtonTextField;
  final Function(String)? onTextEditing;
  final bool isValid;
  final Size size;
  final TextEditingController textFieldController;

  const Post({
    Key? key,
    required this.image,
    required this.hintTextTextField,
    required this.functionImage,
    required this.functionButtonTextField,
    this.onTextEditing,
    required this.isValid,
    required this.size,
    required this.textFieldController,
  }) : super(key: key);

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  late double size;
  final FocusNode _textFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.size.width * 0.04),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: widget.functionImage,
            child: Container(
              width: widget.size.width * 0.13,
              height: widget.size.width * 0.13,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(widget.image),
                ),
              ),
            ),
          ),
          SizedBox(
            height: widget.size.height * 0.09,
            width: widget.size.width * 0.75,
            child: TextField(
              controller: widget.textFieldController,
              focusNode: _textFocus,
              onChanged: widget.onTextEditing,
              decoration: InputDecoration(
                suffixIcon: widget.isValid
                    ? IconButton(
                        onPressed: widget.functionButtonTextField,
                        icon: Icon(
                          Icons.send,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      )
                    : const SizedBox(
                        height: 0.01,
                        width: 0.01,
                      ),
                hintText: widget.hintTextTextField,
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                  ),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
