part of 'register_bloc.dart';

abstract class RegisterEvent {
  const RegisterEvent();
}

class UsernameEvent extends RegisterEvent {
  final String username;

  const UsernameEvent({required this.username});
}

class EmailEvent extends RegisterEvent {
  final String email;

  const EmailEvent({required this.email});
}

class PasswordEvent extends RegisterEvent {
  final String password;

  const PasswordEvent({required this.password});
}

class RePasswordEvent extends RegisterEvent {
  final String repassword;

  const RePasswordEvent({required this.repassword});
}
