import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_app/core/helper_func/info_snack_bar.dart';
import 'package:fruits_hub_app/core/services/get_it_service.dart';
import 'package:fruits_hub_app/core/widgets/custom_appbar.dart';
import 'package:fruits_hub_app/core/widgets/custom_progress_hud.dart';
import 'package:fruits_hub_app/features/auth/domain/repos/auth_repo_decl.dart';
import 'package:fruits_hub_app/features/auth/presentation/manager/signin_cubit/signin_cubit.dart';
import 'package:fruits_hub_app/features/auth/presentation/widgets/login_view_page_body.dart';
import 'package:fruits_hub_app/features/home/presentation/views/home_page_view.dart';

class LoginViewPage extends StatelessWidget {
  const LoginViewPage({super.key});
  static const String routeName = 'login';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(getit<AuthRepoDecl>()),
      child: Scaffold(
        appBar: appBar(context, key: 'login'),

        body: BlocConsumer<SigninCubit, SigninState>(
          listener: (context, state) {
            if (state is SigninSuccess) {
              infoSnackBar(context, 'signInSuccess'.tr());
              Navigator.pushNamedAndRemoveUntil(
                context,
                HomePageView.routeName,
                (route) => false,
              );
            } else if (state is SigninFailure) {
              infoSnackBar(context, state.message);
            }
          },
          builder: (context, state) {
            return CustomModalProgressHud(
              inAsyncCall: state is SigninLoading ? true : false,
              child: const LoginViewPageBody(),
            );
          },
        ),
      ),
    );
  }
}
