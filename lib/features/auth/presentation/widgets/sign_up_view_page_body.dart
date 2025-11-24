import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_app/core/helper_func/info_snack_bar.dart';
import 'package:fruits_hub_app/core/widgets/custom_button.dart';
import 'package:fruits_hub_app/core/widgets/custom_form_text_field.dart';
import 'package:fruits_hub_app/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:fruits_hub_app/features/auth/presentation/views/login_view_page.dart';
import 'package:fruits_hub_app/features/auth/presentation/widgets/custom_password_field.dart';
import 'package:fruits_hub_app/features/auth/presentation/widgets/donot_or_have_account.dart';
import 'package:fruits_hub_app/features/auth/presentation/widgets/terms_conditions.dart';

class SignUpViewPageBody extends StatefulWidget {
  const SignUpViewPageBody({super.key});

  @override
  State<SignUpViewPageBody> createState() => _SignUpViewPageBodyState();
}

class _SignUpViewPageBodyState extends State<SignUpViewPageBody> {
  late TextEditingController emailController;
  late TextEditingController nameController;
  late TextEditingController passwordController;
  final GlobalKey<FormState> formGlobalKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool istermsAccepted = false;

  @override
  void initState() {
    emailController = TextEditingController();
    nameController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: formGlobalKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const SizedBox(height: 24),
              CustomFormTextField(
                controller: nameController,
                hintText: 'fullName',
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 16),
              CustomFormTextField(
                controller: emailController,
                hintText: 'email',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              CustomPasswordField(passwordController: passwordController),
              const SizedBox(height: 16),

              TermsAndCondition(
                onChangedTerms: (bool value) {
                  istermsAccepted = value;
                },
              ),
              const SizedBox(height: 30),

              CustomButton(
                text: 'createNewAccount',
                onPressed: () {
                  if (formGlobalKey.currentState!.validate()) {
                    if (istermsAccepted) {
                      context
                          .read<SignupCubit>()
                          .createUserWithEmailAndPassword(
                            emailController.text,
                            passwordController.text,
                            nameController.text,
                          );
                     
                    } else {
                      infoSnackBar(context, 'accepTermsAndConditions'.tr());
                    }
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
              const SizedBox(height: 26),

              const DonotOrHaveAnAccount(
                routeName: LoginViewPage.routeName,
                text1: 'haveAnAccount',
                text2: 'login',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
