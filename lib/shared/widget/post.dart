import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Post extends StatefulWidget {
  final String image;
  final String hintTextTextField;
  final Function() functionImage;
  final Function() functionBottonTextField;
  final Size size;

  const Post({
    Key? key,
    required this.image,
    required this.hintTextTextField,
    required this.functionImage,
    required this.functionBottonTextField,
    required this.size,
  }) : super(key: key);

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  late double size;
  final bool _isEmpyt = false;
  final bool _focado = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: widget.size.height * 0.12,
        width: widget.size.width * 0.9,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /*
                        CircleAvatar(
                          radius: 40,
                          child: DecorationImage(),
                          backgroundImage:
                              AssetImage("lib/ui/assets/icons/login_icon.png"),
                        ),*/
            widget.image.isEmpty
                ? Shimmer.fromColors(
                    child: CircleAvatar(
                      radius: widget.size.width * 0.09,
                    ),
                    baseColor: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withAlpha(60),
                    highlightColor: Colors.grey[100]!,
                  )
                : InkWell(
                    onTap: widget.functionImage,
                    child: Container(
                      width: widget.size.width * 0.13,
                      height: widget.size.width * 0.13,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(widget.image),
                          )),
                    ),
                  ),
            widget.image.isEmpty
                ? Shimmer.fromColors(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red,
                        ),
                        height: widget.size.height * 0.07,
                        width: widget.size.height * 0.4,
                      ),
                    ),
                    baseColor: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withAlpha(60),
                    highlightColor: Colors.grey[100]!,
                  )
                : Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: SizedBox(
                      height: widget.size.height * 0.09,
                      width: widget.size.height * 0.4,
                      child: TextField(
                        decoration: InputDecoration(
                          suffixIcon: _focado
                              ? _isEmpyt
                                  ? Icon(
                                      Icons.send,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground
                                          .withAlpha(95),
                                    )
                                  : IconButton(
                                      onPressed: widget.functionBottonTextField,
                                      icon: Icon(
                                        Icons.send,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                    )
                              : const SizedBox(
                                  height: 0.01,
                                  width: 0.01,
                                ),
                          hintText: widget.hintTextTextField,
                          //label: Text("Adicione uma postagem"),
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
                  ),
          ],
        ),
      ),
    );
  }
}
