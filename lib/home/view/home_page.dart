import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home.dart';
import '/global.dart';
import '/common/common.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.lightgrey,
          appBar: appbarHome(context, navigator, removeUserData),
          body: bodyHome(),
        );
      },
    );
  }

  void removeUserData() {
    final navigator = Navigator.of(context);
    context.read<HomeBloc>().add(const TriggerHomeEvent(index: 0));
    Global.storageService.remove(AppConstants.STORAGE_USER_TOKEN_KEY);
    Global.storageService.remove(AppConstants.STORAGE_USER_PROFILE_KEY);
    navigator.pushNamedAndRemoveUntil(AppRoutes.LOGIN, (route) => false);
    if (kDebugMode) {
      print('Pressed Confirm Logout Text Button');
    }
  }
}
