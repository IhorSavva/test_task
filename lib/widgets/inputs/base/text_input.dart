import 'package:flutter/material.dart';
import 'package:test_task/theme/app_theme.dart';

class TextInput extends StatefulWidget {
  final TextEditingController? controller;
  final String hintText;
  final bool? isValid;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final ValueChanged<String>? onFieldSubmitted;
  final FocusNode? focusNode;


  const TextInput({
    required this.controller,
    required this.hintText,
    this.isValid,
    this.keyboardType,
    this.textInputAction,
    this.obscureText = false,
    this.onFieldSubmitted,
    this.focusNode
  });

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  late FocusNode _focusNode;
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.obscureText;
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    if(widget.focusNode == null){
      _focusNode.dispose();
    }
    super.dispose();
  }

  void _handleFocusChange() {
    setState(() {}); // Trigger rebuild to update styles based on focus
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        TextFormField(
            obscureText: _isObscured,
            keyboardType: widget.keyboardType,
            textInputAction: widget.textInputAction,
            cursorColor: AppTheme.textColor,
            controller: widget.controller,
            focusNode: _focusNode,
            decoration: _buildInputDecoration(context),
            style: _getTextStyle(context),
            onFieldSubmitted: widget.onFieldSubmitted),
        if (widget.obscureText)
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: Image.asset(
                _isObscured
                    ? 'assets/images/eye_closed.png'
                    : 'assets/images/eye_open.png',
                height: 24,
                width: 24,
              ),
              onPressed: _togglePasswordVisibility,
            ),
          ),
      ],
    );
  }

  InputDecoration _buildInputDecoration(BuildContext context) {
    return InputDecoration(
      hintText: widget.hintText,
      hintStyle: widget.isValid == false
          ? Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: Theme.of(context).errorColor)
          : _getHintStyle(context),
      filled: true,
      fillColor: widget.isValid == false
          ? Theme.of(context).errorInputBackgroundColor
          : Colors.white,
      border: _getBorder(context),
      enabledBorder: _getBorder(context),
      focusedBorder: _getFocusedBorder(context),
      contentPadding: widget.obscureText
          ? const EdgeInsets.only(right: 55.0, left: 20, top: 10, bottom: 10)
          : Theme.of(context).inputDecorationTheme.contentPadding,
    );
  }

  TextStyle? _getTextStyle(BuildContext context) {
    if (widget.isValid == false) {
      return Theme.of(context)
          .textTheme
          .bodyLarge
          ?.copyWith(color: Theme.of(context).errorColor);
    } else if (widget.isValid == true) {
      return Theme.of(context)
          .textTheme
          .bodyLarge
          ?.copyWith(color: Theme.of(context).successColor);
    }
    return Theme.of(context).textTheme.bodyLarge;
  }

  TextStyle _getHintStyle(BuildContext context) {
    if (_focusNode.hasFocus) {
      return AppTheme.focusedHintTextStyle;
    } else if (widget.isValid == false) {
      return AppTheme.errorHintTextStyle;
    }
    return AppTheme.unfocusedHintTextStyle;
  }

  InputBorder _getBorder(BuildContext context) {
    final theme = Theme.of(context).inputDecorationTheme;

    if (widget.isValid == true) {
      return theme.border!.copyWith(
        borderSide: BorderSide(color: Theme.of(context).successColor),
      );
    } else if (widget.isValid == false) {
      return theme.errorBorder!;
    } else {
      return theme.border!;
    }
  }

  InputBorder _getFocusedBorder(BuildContext context) {
    final theme = Theme.of(context).inputDecorationTheme;

    if (widget.isValid == true) {
      return theme.focusedBorder!.copyWith(
        borderSide: BorderSide(color: Theme.of(context).successColor),
      );
    } else if (widget.isValid == false) {
      return theme.errorBorder!;
    } else {
      return theme.focusedBorder!;
    }
  }
}
