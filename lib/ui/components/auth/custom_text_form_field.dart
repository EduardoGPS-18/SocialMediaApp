import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final Size size;
  final bool segureText;
  final String labelText;
  final IconData prefixIcon;
  final Function(String value)? onChanged;
  final String? errorText;

  const CustomTextFormField({
    Key? key,
    this.segureText = false,
    required this.size,
    required this.labelText,
    required this.prefixIcon,
    this.onChanged,
    this.errorText,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _segureText = true;

  void switchSegureText() => setState(() => _segureText = !_segureText);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size.width * 0.8,
      child: TextFormField(
        onChanged: widget.onChanged,
        obscureText: widget.segureText ? _segureText : false,
        decoration: InputDecoration(
          errorText: widget.errorText,
          labelText: widget.labelText,
          labelStyle: TextStyle(
            color: Theme.of(context).colorScheme.onBackground,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(widget.size.width * 0.015),
          ),
          prefixIcon: Icon(
            widget.prefixIcon,
          ),
          suffixIcon: widget.segureText
              ? IconButton(
                  onPressed: switchSegureText,
                  icon: _segureText
                      ? Icon(
                          Icons.remove_red_eye,
                          color: Theme.of(context).colorScheme.primary,
                        )
                      : Icon(
                          Icons.lock_sharp,
                          color: Theme.of(context).colorScheme.onBackground.withAlpha(90),
                        ),
                )
              : const SizedBox(
                  height: 0,
                  width: 0,
                ),
        ),
      ),
    );
  }
}
