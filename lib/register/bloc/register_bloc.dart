import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {
    on<RegisterEvent>((event, emit) {});
    on<UsernameEvent>(_usernameEvent);
    on<PhoneEvent>(_phoneEvent);
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
    on<RePasswordEvent>(_repasswordEvent);
  }

  void _usernameEvent(UsernameEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(username: event.username));
    if (kDebugMode) {
      print('Username: ${event.username} - (_usernameEvent)');
    }
  }

  void _phoneEvent(PhoneEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(phone: event.phone));
    if (kDebugMode) {
      print('Phone: ${event.phone} - (_phoneEvent)');
    }
  }

  void _emailEvent(EmailEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(email: event.email));
    if (kDebugMode) {
      print('Email: ${event.email} - (_emailEvent)');
    }
  }

  void _passwordEvent(PasswordEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(password: event.password));
    if (kDebugMode) {
      print('Password: ${event.password} - (_passwordEvent)');
    }
  }

  void _repasswordEvent(RePasswordEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(repassword: event.repassword));
    if (kDebugMode) {
      print('Repassword: ${event.repassword} - (_repasswordEvent)');
    }
  }
}
