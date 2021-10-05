import 'package:flutter/material.dart';

import 'widget.dart';

class ViewPost extends StatefulWidget {
  Size size;
  ViewPost({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  _ViewPostState createState() => _ViewPostState();
}

class _ViewPostState extends State<ViewPost> {
  bool onPressedFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: widget.size.height * 0.33,
        //color: Colors.grey,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: widget.size.height * 0.02,
          ),
          child: Container(
            //   color: Colors.red,
            child: Column(
              children: [
                ListTile(
                  leading: InkWell(
                    onTap: () {},
                    child: Container(
                      width: widget.size.width * 0.16,
                      height: widget.size.width * 0.16,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("lib/ui/assets/images/test.jpg"),
                          )),
                    ),
                  ),
                  title: Padding(
                    padding: EdgeInsets.only(bottom: widget.size.width * 0.015),
                    child: Text(
                      "Pabricio Freitas",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  subtitle: Text("Terça-feira ás 08:22"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: widget.size.height * 0.005,
                    horizontal: widget.size.width * 0.045,
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: Text(
                      "Mais um trabalho realizado com sucesso. Obrigado ao aplicativo por proporcionar essa oportunidade. ",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
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
                        onPressed: () {},
                        icon: onPressedFavorite
                            ? Icon(
                                Icons.favorite_outlined,
                                color: Theme.of(context).colorScheme.error,
                              )
                            : Icon(
                                Icons.favorite_border_outlined,
                              ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text.rich(
                          TextSpan(
                            text: "40",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            children: [
                              TextSpan(
                                text: " curtidas",
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
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
                        child: IconButton(
                            iconSize: widget.size.width * 0.07,
                            onPressed: () {},
                            icon: Icon(Icons.mode_comment_outlined)),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text.rich(
                          TextSpan(
                            text: "40",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            children: [
                              TextSpan(
                                text: " comentários",
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
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
      CustomDivider(
        size: widget.size,
        altura: 0.015,
      ),
    ]);
  }
}
