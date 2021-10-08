import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Comment extends StatelessWidget {
  final Size size;
  final Function() onUserImageClick;

  const Comment({
    Key? key,
    required this.size,
    required this.onUserImageClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 200.0,
      ),
      child:
          // Shimmer.fromColors(
          //     baseColor:
          //         Theme.of(context).colorScheme.onBackground.withAlpha(60),
          //     highlightColor: Colors.grey.shade100,
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.start,
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Container(
          //           width: size.width * 0.13,
          //           height: size.width * 0.13,
          //           decoration: const BoxDecoration(
          //               shape: BoxShape.circle, color: Colors.red),
          //         ),
          //         Padding(
          //           padding: EdgeInsets.only(left: size.height * 0.008),
          //           child: SizedBox(
          //             width: size.width * 0.75,
          //             child: Column(
          //               mainAxisAlignment: MainAxisAlignment.start,
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               mainAxisSize: MainAxisSize.min,
          //               children: [
          //                 Padding(
          //                     padding: EdgeInsets.only(
          //                         bottom: size.height * 0.015,
          //                         top: size.height * 0.008),
          //                     child: Container(
          //                       decoration: BoxDecoration(
          //                           color: Colors.red,
          //                           borderRadius: BorderRadius.circular(12)),
          //                       height: size.height * 0.03,
          //                       width: size.width * 0.4,
          //                     )),
          //                 Container(
          //                   decoration: BoxDecoration(
          //                       color: Colors.red,
          //                       borderRadius: BorderRadius.circular(12)),
          //                   height: size.height * 0.08,
          //                   width: size.width * 0.8,
          //                 ),
          //                 Padding(
          //                   padding: EdgeInsets.only(top: size.height * 0.02),
          //                   child: Align(
          //                       alignment: Alignment.bottomRight,
          //                       child: Container(
          //                         decoration: BoxDecoration(
          //                             color: Colors.red,
          //                             borderRadius: BorderRadius.circular(12)),
          //                         height: size.height * 0.03,
          //                         width: size.width * 0.2,
          //                       )),
          //                 )
          //               ],
          //             ),
          //           ),
          //         )
          //       ],
          //     ),
          //   )
          Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: size.width * 0.13,
            height: size.width * 0.13,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("lib/ui/assets/images/test.jpg"),
                )),
          ),
          Padding(
            padding: EdgeInsets.only(left: size.height * 0.008),
            child: SizedBox(
              width: size.width * 0.75,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: size.height * 0.015,
                              top: size.height * 0.008),
                          child: const Text(
                            "Pabricio Freitas",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.more_horiz)),
                      ]),
                  const Text(
                    "Não preciso de muitos, preciso só dos melhores, preciso de você!",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.02),
                    child: const Align(
                        alignment: Alignment.bottomRight,
                        child: Text("Ontem às 13:21")),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      //
    );
  }
}
