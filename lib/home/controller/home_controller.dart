import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home.dart';
import '/global.dart';
import '/common/common.dart';

class HomeController {
  final BuildContext context;
  final _firebaseAuth = FirebaseAuth.instance;

  HomeController({required this.context});

  // * Remove User Data in Home Controller
  Future<void> removeUserData(BuildContext context) async {
    final navigator = Navigator.of(context);
    context.read<HomeBloc>().add(const TriggerHomeEvent(index: 0));
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('uid', '');
    Global.storageService.remove(AppConstants.STORAGE_USER_TOKEN_KEY);
    Global.storageService.remove(AppConstants.STORAGE_USER_PROFILE_KEY);
    navigator.pushNamedAndRemoveUntil(AppRoutes.INITIAL, (route) => false);
    if (kDebugMode) {
      print('Pressed Confirm Logout Text Button');
    }
    return _firebaseAuth.signOut();
  }
}

Future<void> pickDateCheckIn(BuildContext context) async {
  DateTime? dateCheckIn = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2101),
  );
  if (dateCheckIn != null) {
    String formattedDate = DateFormat('dd-MM-yyyy').format(dateCheckIn);
    if (kDebugMode) {
      print(formattedDate);
    }
  } else {
    if (kDebugMode) {
      print("Date is not selected");
    }
  }
}


/*
    setState(() {
      controllerTimeCheckIn.text = formattedDate;
    });
 */