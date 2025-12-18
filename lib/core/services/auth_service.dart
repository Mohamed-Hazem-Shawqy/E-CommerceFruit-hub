import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruits_hub_app/core/errors/custom_exception.dart';
import 'package:fruits_hub_app/core/utils/app_logger.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthService {
  Future<User> createUserWithEmailAndPassword({
    required String emailAddress,
    required String password,
  });
  Future<User> signinWithEmailAndPassword({
    required String emailAddress,
    required String password,
  });
  Future<User> signInWithGoogle();
  Future<User> signInWithFacebook();
  Future<void> deleteUser();
}

class FirebaseAuthService extends AuthService {
  @override
  Future<User> createUserWithEmailAndPassword({
    required String emailAddress,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      AppLogger.logger(
        'Exception in FirebaseSigupService.createUserWithEmailAndPassword ${e.toString()} code is:${e.code} ',
      );
      if (e.code == 'weak-password') {
        throw CustomException(message: 'error_weak_password'.tr());
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(message: 'error_email_in_use'.tr());
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'errorInNetwork'.tr());
      } else {
        throw CustomException(message: 'error_general'.tr());
      }
    } catch (e) {
      AppLogger.logger(
        'Exception in FirebaseSignupService.createUserWithEmailAndPassword ${e.toString()} ',
      );

      throw CustomException(message: 'error_general'.tr());
    }
  }

  @override
  Future<User> signinWithEmailAndPassword({
    required String emailAddress,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      AppLogger.logger(
        'Exception in FirebaseSiginService.signInWithEmailAndPassword ${e.toString()} code is:${e.code} ',
      );
      if (e.code == 'user-not-found') {
        throw CustomException(message: 'wrong_email_or_password'.tr());
      } else if (e.code == 'wrong-password') {
        throw CustomException(message: 'wrong_email_or_password'.tr());
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'errorInNetwork'.tr());
      } else {
        throw CustomException(message: 'error_general'.tr());
      }
    } catch (e) {
      AppLogger.logger(
        'Exception in FirebaseSiginService.signInWithEmailAndPassword ${e.toString()} ',
      );

      throw CustomException(message: 'error_general'.tr());
    }
  }

  @override
  Future<User> signInWithGoogle() async {
    await GoogleSignIn().signOut();
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    final signInCredential = await FirebaseAuth.instance.signInWithCredential(
      credential,
    );
    return signInCredential.user!;
  }

  @override
  Future<User> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    // Once signed in, return the UserCredential
    final faceCredential = await FirebaseAuth.instance.signInWithCredential(
      facebookAuthCredential,
    );
    return faceCredential.user!;
  }

  @override
  Future<void> deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }
}
