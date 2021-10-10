import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final Size size;
  final bool segureText;
  final String labelText;
  final IconData prefixIcon;
  final Function(String value)? onChanged;
  final String? errorText;
  final TextInputType? keyboardType;

  const CustomTextFormField({
    Key? key,
    required this.size,
    this.segureText = false,
    required this.labelText,
    required this.prefixIcon,
    this.onChanged,
    this.errorText,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _secureText = true;

  void switchSegureText() => setState(() => _secureText = !_secureText);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size.width * 0.8,
      child: TextFormField(
        keyboardType: widget.keyboardType,
        onChanged: widget.onChanged,
        obscureText: widget.segureText ? _secureText : false,
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
                  icon: _secureText
                      ? Icon(
                          Icons.visibility_outlined,
                          color: Theme.of(context).colorScheme.primary,
                        )
                      : Icon(
                          Icons.visibility_off_outlined,
                          color: Theme.of(context).colorScheme.primary,
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
