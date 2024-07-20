import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../../core/network/error/failures.dart';
import '../../../../../shared/exceptions/http_exception.dart';
import 'abstract_auth_api.dart';

class AuthImplApi extends AbstractSignInApi {
  @override
  Future<Either<AppException, dynamic>> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      if (googleAuth == null) {
        return Left(AppException(
          message: 'Unknown error occurred',
          statusCode: 1,
          identifier: 'LoginUserRemoteDataSource.loginUser',
        ));
      }
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return Right(await FirebaseAuth.instance.signInWithCredential(credential));
    } on Exception catch (e) {
      return Left(AppException(
        message: 'Unknown error occurred',
        statusCode: 1,
        identifier: 'LoginUserRemoteDataSource.loginUser',
      ));
    }
  }

  @override
  Future<bool> signOutFromGoogle() async {
    try {
      await FirebaseAuth.instance.signOut();
      return true;
    } on Exception catch (_) {
      return false;
    }
  }
}
