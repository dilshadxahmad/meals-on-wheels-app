import 'package:flutter/material.dart';
import 'package:meals_on_wheels/screens/home_screen.dart';
import 'package:meals_on_wheels/services/input_validation_service.dart';
import 'package:meals_on_wheels/utils/english_text.dart';
import 'package:meals_on_wheels/utils/my_colors.dart';
import 'package:meals_on_wheels/utils/my_images.dart';
import 'package:meals_on_wheels/widgets/buttons/primary_button.dart';
import 'package:meals_on_wheels/widgets/fields/custom_text_field.dart';
import 'package:meals_on_wheels/widgets/text/display_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailTextController = TextEditingController();
  final _passTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  var _someText = EnglishText.dontHaveAccount;
  var _loginSignup = EnglishText.signup;
  var _buttonText = EnglishText.login;
  var _showEye = false;
  var _obscureText = true;

  @override
  void dispose() {
    _emailTextController.dispose();
    _passTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: 240,
              width: double.maxFinite,
              padding: const EdgeInsets.only(
                left: 80,
                right: 80,
                top: 40,
                bottom: 20,
              ),
              decoration: const BoxDecoration(
                color: MyColors.orange,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Image.asset(
                MyImages.appLogoWhite,
              ),
            ),
            const SizedBox(height: 32),
            DisplayText(_buttonText, fontSize: 28),
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 210,
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(EnglishText.email),
                    CustomTextField(
                      labelText: "abx@xyz.com",
                      controller: _emailTextController,
                      customValidator:
                          InputValidationService.getEmailValidator(),
                    ),
                    const Text(EnglishText.password),
                    CustomTextField(
                      controller: _passTextController,
                      labelText: EnglishText.password,
                      customValidator:
                          InputValidationService.getRequiredValidator(),
                      onChanged: (value) {
                        setState(() {
                          if (value.isEmpty) {
                            _showEye = false;
                          } else {
                            _showEye = true;
                          }
                        });
                      },
                      obscureText: _obscureText,
                      suffixIcon: !_showEye
                          ? null
                          : IconButton(
                              color: MyColors.orange,
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                              icon: _obscureText
                                  ? const Icon(Icons.visibility_rounded)
                                  : const Icon(Icons.visibility_off_rounded),
                            ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(_someText),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        if (_loginSignup.contains("Sign Up")) {
                          _loginSignup = EnglishText.login;
                          _buttonText = EnglishText.signup;
                          _someText = EnglishText.alreadyHaveAccount;
                        } else {
                          _loginSignup = EnglishText.signup;
                          _buttonText = EnglishText.login;
                          _someText = EnglishText.dontHaveAccount;
                        }
                      });
                    },
                    child: Text(_loginSignup),
                  )
                ],
              ),
            ),
            const SizedBox(height: 52),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: PrimaryButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    if (_buttonText.contains("Sign Up")) {
                      ScaffoldMessenger.of(context).removeCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(EnglishText.signupSuccessful),
                          duration: Duration(seconds: 1),
                        ),
                      );
                      setState(() {
                        _loginSignup = EnglishText.signup;
                        _buttonText = EnglishText.login;
                        _someText = EnglishText.dontHaveAccount;
                        _emailTextController.clear();
                        _passTextController.clear();
                      });
                    } else {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return const HomeScreen();
                          },
                        ),
                      );
                    }
                  }
                },
                child: Text(
                  _buttonText,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
