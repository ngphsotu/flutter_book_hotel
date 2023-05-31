import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<LoginEvent>((event, emit) {});
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
  }

  void _emailEvent(EmailEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: event.email));
    if (kDebugMode) {
      print('My email: ${event.email} - (_emailEvent)');
    }
  }

  void _passwordEvent(PasswordEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
    if (kDebugMode) {
      print('My password: ${event.password} - (_passwordEvent)');
    }
  }
}
