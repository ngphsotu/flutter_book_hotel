part of 'register_bloc.dart';

class RegisterState {
  final String username;
  final String email;
  final String password;
  final String repassword;

  const RegisterState({
    this.username = '',
    this.email = '',
    this.password = '',
    this.repassword = '',
  });

  RegisterState copyWith({
    String? username,
    String? email,
    String? password,
    String? repassword,
  }) {
    return RegisterState(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      repassword: repassword ?? this.repassword,
    );
  }
}

class RegisterInitial extends RegisterState {
  RegisterInitial({
    required super.username,
    required super.email,
    required super.password,
    required super.repassword,
  });
}
