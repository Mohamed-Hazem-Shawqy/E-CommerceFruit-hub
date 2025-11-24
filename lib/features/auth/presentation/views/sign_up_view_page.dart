import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_app/core/helper_func/info_snack_bar.dart';
import 'package:fruits_hub_app/core/services/get_it_service.dart';
import 'package:fruits_hub_app/core/widgets/custom_appbar.dart';
import 'package:fruits_hub_app/core/widgets/custom_progress_hud.dart';
import 'package:fruits_hub_app/features/auth/domain/repos/auth_repo_decl.dart';
import 'package:fruits_hub_app/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:fruits_hub_app/features/auth/presentation/views/login_view_page.dart';
import 'package:fruits_hub_app/features/auth/presentation/widgets/sign_up_view_page_body.dart';

class SignUpViewPage extends StatelessWidget {
  const SignUpViewPage({super.key});
  static const String routeName = 'signup';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getit<AuthRepoDecl>()),
      child: Scaffold(
        appBar: appBar(context, key: 'newAccount'),
        body: BlocConsumer<SignupCubit, SignupState>(
          listener: (context, state) {
            if (state is SignupSuccess) {
              infoSnackBar(context, 'signUpSeccess'.tr());
               Navigator.pushReplacementNamed(
                        context,
                        LoginViewPage.routeName,
                      );
            } else if (state is SignupFailure) {
              infoSnackBar(context, state.message);
            }
          },
          builder: (context, state) {
            return CustomModalProgressHud(
              inAsyncCall: state is SignupLoading ? true : false,

              child: const SignUpViewPageBody(),
            );
          },
        ),
      ),
    );
  }
}
