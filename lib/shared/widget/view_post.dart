import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'widget.dart';

class ViewPost extends StatefulWidget {
  final Size size;

  const ViewPost({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  _ViewPostState createState() => _ViewPostState();
}

class _ViewPostState extends State<ViewPost> {
  bool onPressedFavorite = false;
  String testSmimer = "a";
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
            child: testSmimer.isEmpty
                ? Shimmer.fromColors(
                    baseColor: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withAlpha(60),
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
                        padding:
                            EdgeInsets.only(left: widget.size.width * 0.048),
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
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: widget.size.width * 0.01),
                        child: ListTile(
                          leading: InkWell(
                            onTap: () {},
                            child: Container(
                              width: widget.size.width * 0.13,
                              height: widget.size.width * 0.13,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        "lib/ui/assets/images/test.jpg"),
                                  )),
                            ),
                          ),
                          title: Padding(
                            padding: EdgeInsets.only(
                                bottom: widget.size.width * 0.018),
                            child: const Text(
                              "Pabricio Freitas",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          subtitle: const Text("Terça-feira ás 08:22"),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: widget.size.height * 0.005,
                          horizontal: widget.size.width * 0.05,
                        ),
                        child: InkWell(
                          onTap: () {},
                          child: const Text(
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
                                      color:
                                          Theme.of(context).colorScheme.error,
                                    )
                                  : const Icon(
                                      Icons.favorite_border_outlined,
                                    ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Text.rich(
                                TextSpan(
                                  text: "40",
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
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
                                  icon:
                                      const Icon(Icons.mode_comment_outlined)),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Text.rich(
                                TextSpan(
                                  text: "40",
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
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
        height: 0.015,
      ),
    ]);
  }
}
