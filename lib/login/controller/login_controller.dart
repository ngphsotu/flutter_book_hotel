import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '/global.dart';
import '../login.dart';
import '/common/common.dart';

class LoginController {
  final BuildContext context;

  const LoginController({required this.context});

  // * Handle Email SignIn in SignIn Controller
  Future<void> handleEmailSignIn(String type) async {
    final navigator = Navigator.of(context);
    try {
      if (type == 'email') {
        // BlocProvider.of<SigninBloc>(context).state
        final state = context.read<LoginBloc>().state;
        String email = state.email;
        String pass = state.password;

        if (email.isEmpty) {
          if (kDebugMode) {
            print('You need to fill email address - (handleEmailSignIn)');
          }
          toastInfo(msg: 'You need to fill email address');
          return;
        }
        if (pass.isEmpty) {
          if (kDebugMode) {
            print('You need to fill password - (handleEmailSignIn)');
          }
          toastInfo(msg: 'You need to fill password');
          return;
        }
        try {
          final credential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email,
            password: pass,
          );
          if (credential.user == null) {
            if (kDebugMode) {
              print('User does not exist - (handleEmailSignIn)');
            }
            toastInfo(msg: 'You don\'t exist');
            return;
          }
          if (!credential.user!.emailVerified) {
            if (kDebugMode) {
              print(
                  'You need to verify your email account - (handleEmailSignIn)');
            }
            toastInfo(msg: 'You need to verify your email account');
            return;
          }

          var user = credential.user;
          if (user != null) {
            if (kDebugMode) {
              print('User exist - move to home page - (handleEmailSignIn)');
            }
            Global.storageService
                .setString(AppConstants.STORAGE_USER_TOKEN_KEY, '12345678');
            navigator.pushNamedAndRemoveUntil(AppRoutes.HOME, (route) => false);
            // Verified user from firebase
          } else {
            toastInfo(msg: 'Currently you\'re not a user of this app');
            if (kDebugMode) {
              print(
                  'Currently you\'re not a user of this app - (handleEmailSignIn)');
            }
            return;
            // Error gettting user from firebase
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            toastInfo(msg: 'No user found for that email');
            if (kDebugMode) {
              print('No user found for that email');
            }
          } else if (e.code == 'wrong-password') {
            toastInfo(msg: 'Wrong password provided for that user');
            if (kDebugMode) {
              print('Wrong password provided for that user');
            }
          } else if (e.code == 'invalid-email') {
            toastInfo(msg: 'Your email format is wrong');
            if (kDebugMode) {
              print('Your email format is wrong');
            }
          }
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
