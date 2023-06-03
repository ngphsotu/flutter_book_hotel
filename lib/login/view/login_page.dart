import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../login.dart';
import '/common/common.dart';

class LoginPage extends StatefulWidget implements PreferredSizeWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();

  @override
  Size get preferredSize => throw UnimplementedError();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.lightgrey,
          appBar: appbarLogin(),
          body: bodyLogin(context),
        );
      },
    );
  }
}
