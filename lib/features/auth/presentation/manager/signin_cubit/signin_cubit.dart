import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_app/features/auth/domain/entites/user_entity.dart';
import 'package:fruits_hub_app/features/auth/domain/repos/auth_repo_decl.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authRepoDecl) : super(SigninInitial());
  final AuthRepoDecl authRepoDecl;
  Future signINWithEmailAndPassword(String email, String password) async {
    emit(SigninLoading());
    final user = await authRepoDecl.sigInWithEmailAndPassword(email, password);
    user.fold(
      (failure) => emit(SigninFailure(message: failure.message)),
      (userEntity) => emit(SigninSuccess(userEntity: userEntity)),
    );
  }

  Future signInWithGoogle() async {
    emit(SigninLoading());
    final user = await authRepoDecl.sigInWithGoogle();
    user.fold(
      (failure) => emit(SigninFailure(message: failure.message)),
      (userEntity) => emit(SigninSuccess(userEntity: userEntity)),
    );
  }

  Future signInWithFacebook() async {
    emit(SigninLoading());
    final user = await authRepoDecl.signInWithFacebook();
    user.fold(
      (failure) => emit(SigninFailure(message: failure.message)),
      (userEntity) => emit(SigninSuccess(userEntity: userEntity)),
    );
  }
}
