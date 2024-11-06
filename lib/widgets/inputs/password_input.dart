import 'package:flutter/material.dart';
import 'package:test_task/constants/constants.dart';
import 'package:test_task/helpers/validators.dart';
import 'package:test_task/theme/app_theme.dart';
import 'package:test_task/widgets/inputs/base/text_input.dart';

class PasswordInput extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onFieldSubmitted;
  final FocusNode? focusNode;

  const PasswordInput({
    super.key,
    this.controller,
    this.textInputAction,
    this.onFieldSubmitted,
    this.focusNode,
  });

  @override
  PasswordInputState createState() => PasswordInputState();
}

class PasswordInputState extends State<PasswordInput> {
  bool? _hasMinLength;
  bool? _hasUpperLowerCase;
  bool? _hasDigit;
  bool? _isValid;

  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
  }

  bool validate() {
    setState(() {
      _hasMinLength = Validators.hasMinLength(_controller.text.trim());
      _hasUpperLowerCase =
          Validators.hasUpperLowerCase(_controller.text.trim());
      _hasDigit = Validators.hasDigit(_controller.text.trim());
      _isValid = _hasMinLength! && _hasUpperLowerCase! && _hasDigit!;
    });

    return _isValid!;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextInput(
          focusNode: widget.focusNode,
          textInputAction: widget.textInputAction,
          isValid: _isValid,
          obscureText: true,
          controller: _controller,
          hintText: kPasswordHintText,
          onFieldSubmitted: widget.onFieldSubmitted,
        ),
        const SizedBox(height: 20),
        _buildCondition(
          context,
          kConditionMinLength,
          _hasMinLength,
        ),
        _buildCondition(
          context,
          kConditionUpperLowerCase,
          _hasUpperLowerCase,
        ),
        _buildCondition(
          context,
          kConditionDigit,
          _hasDigit,
        ),
      ],
    );
  }

  Widget _buildCondition(BuildContext context, String text, bool? isValid) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, bottom: 5),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: isValid == null
                  ? null
                  : isValid
                      ? Theme.of(context).successColor
                      : Theme.of(context).errorColor,
            ),
      ),
    );
  }
}
