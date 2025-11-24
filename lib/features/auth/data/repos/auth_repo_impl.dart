import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub_app/core/errors/custom_exception.dart';
import 'package:fruits_hub_app/core/errors/failuer.dart';
import 'package:fruits_hub_app/core/services/data_base_service.dart';
import 'package:fruits_hub_app/core/services/auth_service.dart';
import 'package:fruits_hub_app/core/utils/app_logger.dart';
import 'package:fruits_hub_app/core/utils/end_points.dart';
import 'package:fruits_hub_app/features/auth/data/models/user_model.dart';
import 'package:fruits_hub_app/features/auth/domain/entites/user_entity.dart';
import 'package:fruits_hub_app/features/auth/domain/repos/auth_repo_decl.dart';

class AuthRepoImpl implements AuthRepoDecl {
  final FirebaseAuthService firebaseAuthService;
  final DataBaseService dataBaseService;

  AuthRepoImpl({
    required this.firebaseAuthService,
    required this.dataBaseService,
  });

  @override
  Future<Either<Failuer, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
        emailAddress: email,
        password: password,
      );
      final userEntity = UserModel.fromFirebaseUser(user);
      await addUser(UserEntity(email: email, name: name, uId: user.uid));
      return right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailuer(e.toString()));
    } catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteUser();
      }
      AppLogger.logger(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword ${e.toString()} ',
      );

      return left(ServerFailuer('error_general'.tr()));
    }
  }

  @override
  Future<Either<Failuer, UserEntity>> sigInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      var user = await firebaseAuthService.signinWithEmailAndPassword(
        emailAddress: email,
        password: password,
      );
      final userEntity = await getUser(user.uid);
      return right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailuer(e.toString()));
    } catch (e) {
      AppLogger.logger(
        'Exception in AuthRepoImpl.SigINWithEmailAndPassword ${e.toString()} ',
      );

      return left(ServerFailuer('error_general'.tr()));
    }
  }

  @override
  Future<Either<Failuer, UserEntity>> sigInWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithGoogle();
      final userEntity = UserModel.fromFirebaseUser(user);
      final isDataExsist = await dataBaseService.isUserRecord(
        path: EndPoints.userEndPoint,
        id: user.uid,
      );
      if (isDataExsist) {
        await getUser(user.uid);
      } else {
        await addUser(userEntity);
      }

      return right(userEntity);
    } catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteUser();
      }
      AppLogger.logger(
        'Exception in AuthRepoImpl.sigInWithGoogle ${e.toString()} ',
      );
      return left(ServerFailuer('error_general'.tr()));
    }
  }

  @override
  Future<Either<Failuer, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithFacebook();
      final userEntity = UserModel.fromFirebaseUser(user);
      await addUser(userEntity);

      return right(userEntity);
    } catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteUser();
      }
      AppLogger.logger(
        'Exception in AuthRepoImpl.signInWithFacebook ${e.toString()} ',
      );
      return left(ServerFailuer('error_general'.tr()));
    }
  }

  @override
  Future<dynamic> addUser(UserEntity user) async {
    await dataBaseService.addData(
      path: EndPoints.userEndPoint,
      data: user.toJson(),
      id: user.uId,
    );
  }

  @override
  Future<UserEntity> getUser(String uid) async {
    var data = await dataBaseService.getData(
      path: EndPoints.userEndPoint,
      id: uid,
    );
    return UserModel.fromJson(data);
  }
}
