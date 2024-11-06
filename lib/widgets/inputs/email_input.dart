import 'package:flutter/material.dart';
import 'package:test_task/constants/constants.dart';
import 'package:test_task/helpers/validators.dart';
import 'package:test_task/theme/app_theme.dart';
import 'package:test_task/widgets/inputs/base/text_input.dart';

class EmailInput extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onFieldSubmitted;
  final FocusNode? focusNode;

  const EmailInput({
    super.key,
    this.controller,
    this.textInputAction,
    this.onFieldSubmitted,
    this.focusNode
  });

  @override
  EmailInputState createState() => EmailInputState();
}

class EmailInputState extends State<EmailInput> {
  bool? _isValid;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
  }

  bool validate() {
    setState(() {
      _isValid = Validators.emailValidator(_controller.text.trim());
    });
    return _isValid!;
  }

  @override
  Widget build(BuildContext context) {
    return TextInput(
      textInputAction: widget.textInputAction,
      isValid: _isValid,
      hintText: kEmail,
      keyboardType: TextInputType.emailAddress,
      controller: widget.controller,
      onFieldSubmitted: widget.onFieldSubmitted,
      focusNode: widget.focusNode,
    );
  }
}
