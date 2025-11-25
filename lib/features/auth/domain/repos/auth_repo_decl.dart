import 'package:dartz/dartz.dart';
import 'package:fruits_hub_app/core/errors/failuer.dart';
import 'package:fruits_hub_app/features/auth/domain/entites/user_entity.dart';

abstract class AuthRepoDecl {
  Future<Either<Failuer, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  );
  Future<Either<Failuer, UserEntity>> sigInWithEmailAndPassword(
    String email,
    String password,
  );
  Future<Either<Failuer, UserEntity>> sigInWithGoogle();
  Future<Either<Failuer, UserEntity>> signInWithFacebook();
  Future addUser(UserEntity user);
  Future saveUserData(UserEntity user);
  Future<UserEntity> getUser(String uid);
}
