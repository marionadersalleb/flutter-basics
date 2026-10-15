import 'package:flutter/material.dart';

import '../common/app_colors.dart';
import '../common/app_validators.dart';
import '../widgets/app_elevated_button.dart';
import '../widgets/app_outlined_button.dart';
import '../widgets/app_text_form_field.dart';
import '../widgets/facebook_logo.dart';
import '../widgets/meta_logo.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // the key lets us ask the whole form to validate itself at once
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // state lives outside build so it survives the rebuild
  bool isPasswordHidden = true;

  void onLoginPressed() {
    // validate() runs every validator and returns true only if all pass
    if (!formKey.currentState!.validate()) return;
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  void togglePasswordVisibility() {
    setState(() {
      isPasswordHidden = !isPasswordHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          // the brief asks for 16 on the horizontal axis
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 60),
                  const FacebookLogo(size: 90),
                  const SizedBox(height: 50),
                  AppTextFormField(
                    hintText: 'Mobile Number or Email address',
                    keyboardType: TextInputType.emailAddress,
                    validator: AppValidators.email,
                  ),
                  const SizedBox(height: 16),
                  AppTextFormField(
                    hintText: 'Password',
                    obscureText: isPasswordHidden,
                    validator: AppValidators.password,
                    suffixIcon: IconButton(
                      onPressed: togglePasswordVisibility,
                      icon: Icon(
                        isPasswordHidden
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: AppColors.gray,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  AppElevatedButton(text: 'Login', onPressed: onLoginPressed),
                  const SizedBox(height: 16),
                  // a plain text button, the brief says it has no function
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.blue,
                      overlayColor: Colors.transparent,
                    ),
                    child: const Text(
                      'Forgotten Password ?',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 60),
                  AppOutlinedButton(text: 'Create Account', onPressed: () {}),
                  const SizedBox(height: 24),
                  const MetaLogo(),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
