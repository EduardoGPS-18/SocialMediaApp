import 'package:flutter/material.dart';

class CustomShowModalBottomSheet extends StatefulWidget {
  Size size;
  bool commentIsUser;
  CustomShowModalBottomSheet({
    Key? key,
    required this.size,
    required this.commentIsUser,
  }) : super(key: key);

  @override
  State<CustomShowModalBottomSheet> createState() =>
      _CustomShowModalBottomSheetState();
}

class _CustomShowModalBottomSheetState
    extends State<CustomShowModalBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        widget.commentIsUser
            ? showModalBottomSheet(
                // isScrollControlled: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16.0),
                  ),
                ),
                context: context,
                builder: (context) => SizedBox(
                  height: 200,
                  child: Column(
                    //mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: widget.size.height * 0.015,
                            bottom: widget.size.height * 0.08),
                        child: Container(
                          height: widget.size.height * 0.018,
                          width: widget.size.height * 0.1,
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .surface
                                .withAlpha(60),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        child: SizedBox(
                          width: widget.size.width * 08,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text("Excluir"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : null;
      },
      icon: widget.commentIsUser
          ? Icon(Icons.more_horiz)
          : SizedBox(
              height: 1,
              width: 1,
            ),
    );
  }
}
