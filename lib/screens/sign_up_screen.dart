import 'package:flutter/material.dart';
import 'package:test_task/constants/constants.dart';
import 'package:test_task/helpers/popup_dialogs.dart';
import 'package:test_task/widgets/background_widget.dart';
import 'package:test_task/widgets/buttons/button.dart';
import 'package:test_task/widgets/inputs/email_input.dart';
import 'package:test_task/widgets/inputs/password_input.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<EmailInputState> _emailKey = GlobalKey<EmailInputState>();
  final GlobalKey<PasswordInputState> _passwordKey =
      GlobalKey<PasswordInputState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _submitForm() {
    final isValidEmail = _emailKey.currentState!.validate();
    final isValidPassword = _passwordKey.currentState!.validate();
    if (isValidEmail && isValidPassword) {
      FocusScope.of(context).unfocus();
      PopupDialogs.showToast(context, kSignUpSuccess);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: BackgroundWidget(
                child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 125,
                  ),
                  Text(kSignUp,
                      style: Theme.of(context).textTheme.displayLarge),
                  const SizedBox(
                    height: 40,
                  ),
                  EmailInput(
                    key: _emailKey,
                    focusNode: _emailFocusNode,
                    controller: _emailController,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_passwordFocusNode);
                    },
                  ),
                  const SizedBox(height: 20),
                  PasswordInput(
                    focusNode: _passwordFocusNode,
                    key: _passwordKey,
                    controller: _passwordController,
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (_) {
                      _submitForm();
                    },
                  ),
                  const SizedBox(height: 35),
                  Button(
                    onPressed: () => _submitForm(),
                    text: kSignUp,
                  )
                ],
              ),
            ))));
  }
}
