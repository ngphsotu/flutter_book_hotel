import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../register.dart';
import '/common/common.dart';

class RegisterController {
  final BuildContext context;
  final _firebaseAuth = FirebaseAuth.instance;
  RegisterController({required this.context});

  // * Handle Email SignUp in SignUp Controller
  Future<void> handleEmailSignUp() async {
    final navigator = Navigator.of(context);
    final state = context.read<RegisterBloc>().state;

    String username = state.username;
    String email = state.email;
    String pass = state.password;
    String repass = state.repassword;

    if (username.isEmpty) {
      if (kDebugMode) {
        print('Username can\'t be empty - (handleEmailSignUp)');
      }
      toastInfo(msg: 'Username can not be empty');
      return;
    }

    if (email.isEmpty) {
      if (kDebugMode) {
        print('Email can\'t be empty - (handleEmailSignUp)');
      }
      toastInfo(msg: 'Email can not be empty');
      return;
    }

    if (pass.isEmpty) {
      if (kDebugMode) {
        print('Password can\'t be empty - (handleEmailSignUp)');
      }
      toastInfo(msg: 'Password can\'t be empty');
      return;
    } else if (pass.isNotEmpty && pass.length < 6) {
      if (kDebugMode) {
        print('Your password isn\'t strong enough');
      }
      toastInfo(msg: 'Your password isn\'t strong enough');
      return;
    }

    if (repass.isEmpty) {
      if (kDebugMode) {
        print('Your password confirmation is wrong - (handleEmailSignUp)');
      }
      toastInfo(msg: 'Your password confirmation is wrong');
      return;
    } else if (repass != pass) {
      if (kDebugMode) {
        print('Repassword don\'t match password');
      }
      toastInfo(msg: 'Repassword don\'t match password');
      return;
    }

    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: pass);

      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(username);
        toastInfo(
            msg:
                'An email has been sent to your registered email. To active it, please check your email box and click on the link');
        navigator.pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        if (kDebugMode) {
          print('The password provided is too weak - (handleEmailSignUp)');
        }
        toastInfo(msg: 'The password provided is too weak');
      } else if (e.code == 'email-already-in-use') {
        if (kDebugMode) {
          print('The email is already in use - (handleEmailSignUp)');
        }
        toastInfo(msg: 'The email is already in use');
      } else if (e.code == 'invalid-email') {
        if (kDebugMode) {
          print('Your email id is invalid - (handleEmailSignUp)');
        }
        toastInfo(msg: 'Your email id is invalid');
      }
    }
  }
}
