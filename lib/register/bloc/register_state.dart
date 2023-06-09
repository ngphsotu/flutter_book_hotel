part of 'register_bloc.dart';

class RegisterState {
  final String username;
  final String phone;
  final String email;
  final String password;
  final String repassword;

  const RegisterState({
    this.username = '',
    this.phone = '',
    this.email = '',
    this.password = '',
    this.repassword = '',
  });

  RegisterState copyWith({
    String? username,
    String? phone,
    String? email,
    String? password,
    String? repassword,
  }) {
    return RegisterState(
      username: username ?? this.username,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      password: password ?? this.password,
      repassword: repassword ?? this.repassword,
    );
  }
}

class RegisterInitial extends RegisterState {
  RegisterInitial({
    required super.username,
    required super.phone,
    required super.email,
    required super.password,
    required super.repassword,
  });
}
