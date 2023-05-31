import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../register.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: appbarRegister(),
          body: bodyRegister(context),
        );
      },
    );
  }
}
