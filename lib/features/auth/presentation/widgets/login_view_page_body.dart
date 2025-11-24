import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_app/core/utils/app_images.dart';
import 'package:fruits_hub_app/core/widgets/custom_button.dart';
import 'package:fruits_hub_app/core/widgets/custom_form_text_field.dart';
import 'package:fruits_hub_app/features/auth/presentation/manager/signin_cubit/signin_cubit.dart';
import 'package:fruits_hub_app/features/auth/presentation/views/sign_up_view_page.dart';
import 'package:fruits_hub_app/features/auth/presentation/widgets/custom_password_field.dart';
import 'package:fruits_hub_app/features/auth/presentation/widgets/custom_social_auth_button.dart';
import 'package:fruits_hub_app/features/auth/presentation/widgets/donot_or_have_account.dart';
import 'package:fruits_hub_app/features/auth/presentation/widgets/forget_password.dart';
import 'package:fruits_hub_app/features/auth/presentation/widgets/or_divider.dart';

class LoginViewPageBody extends StatefulWidget {
  const LoginViewPageBody({super.key});

  @override
  State<LoginViewPageBody> createState() => _LoginViewPageBodyState();
}

class _LoginViewPageBodyState extends State<LoginViewPageBody> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final GlobalKey<FormState> formGlobalKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formGlobalKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const SizedBox(height: 24),
              CustomFormTextField(
                controller: emailController,
                obscureText: false,
                hintText: tr('email'),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              CustomPasswordField(passwordController: passwordController),
              const SizedBox(height: 16),

              const ForgetPassword(),
              const SizedBox(height: 33),
              CustomButton(
                text: 'login'.tr(),
                onPressed: () {
                  if (formGlobalKey.currentState!.validate()) {
                    context.read<SigninCubit>().signINWithEmailAndPassword(
                      emailController.text,
                      passwordController.text,
                    );
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              ),
              const SizedBox(height: 33),

              const DonotOrHaveAnAccount(
                routeName: SignUpViewPage.routeName,
                text1: 'donothaveanaccount',
                text2: 'createanaccount',
              ),
              const SizedBox(height: 33),

              const OrDivider(),
              const SizedBox(height: 31),
              CustomSocialAuthButton(
                onPressed: () {
                  context.read<SigninCubit>().signInWithGoogle();
                },
                text: 'googlelogin'.tr(),
                image: Assets.imagesGoogleIcon,
              ),
              const SizedBox(height: 16),

              CustomSocialAuthButton(
                text: 'applelogin'.tr(),
                image: Assets.imagesAppleIcon,
              ),
              const SizedBox(height: 16),

              CustomSocialAuthButton(
                onPressed: () {
                  context.read<SigninCubit>().signInWithFacebook();
                },
                text: 'facelogin'.tr(),
                image: Assets.imagesFaceIcon,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
