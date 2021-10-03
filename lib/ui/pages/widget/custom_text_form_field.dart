import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  Size size;
  bool segureText;
  String labelText;
  IconData prefixIcon;

  CustomTextFormField({
    Key? key,
    required this.size,
    required this.segureText,
    required this.labelText,
    required this.prefixIcon,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _segureText = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size.width * 0.8,
      child: TextFormField(
        // validator: ,

        obscureText: widget.segureText ? _segureText : false,

        decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle:
              TextStyle(color: Theme.of(context).colorScheme.onBackground),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(widget.size.width * 0.015),
          ),
          prefixIcon: Icon(
            widget.prefixIcon,
          ),
          suffixIcon: widget.segureText
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _segureText = !_segureText;
                    });
                  },
                  icon: _segureText
                      ? Icon(
                          Icons.remove_red_eye,
                          color: Theme.of(context).colorScheme.primary,
                        )
                      : Icon(
                          Icons.lock_sharp,
                          color: Theme.of(context)
                              .colorScheme
                              .onBackground
                              .withAlpha(90),
                        ),
                )
              : SizedBox(
                  height: 0,
                  width: 0,
                ),
        ),
      ),
    );
  }
}
