import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_app/features/auth/domain/entites/user_entity.dart';
import 'package:fruits_hub_app/features/auth/domain/repos/auth_repo_decl.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepoDecl) : super(SignupInitial());
  AuthRepoDecl authRepoDecl;

  Future createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    emit(SignupLoading());
    final user = await authRepoDecl.createUserWithEmailAndPassword(
      email,
      password,
      name,
    );
    user.fold(
      (failuer) => emit(SignupFailure(message: failuer.message)),
      (userEntity) => emit(SignupSuccess(userEntity: userEntity)),
    );
  }
}
