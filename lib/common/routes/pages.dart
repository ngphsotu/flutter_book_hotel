import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/global.dart';
import '../common.dart';
import '/home/home.dart';
import '/login/login.dart';
import '/welcome/welcome.dart';
import '/register/register.dart';

//  Unify BlocProvider and routes and pages
class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, required this.bloc});
}

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: AppRoutes.INITIAL,
        page: const WelcomePage(),
        bloc: BlocProvider(create: (_) => WelcomeBloc()),
      ),
      PageEntity(
        route: AppRoutes.LOGIN,
        page: const LoginPage(),
        bloc: BlocProvider(create: (_) => LoginBloc()),
      ),
      PageEntity(
        route: AppRoutes.REGISTER,
        page: const RegisterPage(),
        bloc: BlocProvider(create: (_) => RegisterBloc()),
      ),
      PageEntity(
        route: AppRoutes.HOME,
        page: const HomePage(),
        bloc: BlocProvider(create: (_) => HomeBloc()),
      ),
    ];
  }

  // Return all the bloc providers
  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  // A modal that covers entire screen as we click on navigator object
  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      // Check for route name matching when navigator get triggered.
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        if (kDebugMode) {
          print('Valid route name ${settings.name}');
        }
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        if (result.first.route == AppRoutes.INITIAL && deviceFirstOpen) {
          bool isLoggedIn = Global.storageService.getIsLoggedIn();
          if (isLoggedIn) {
            return MaterialPageRoute(
                builder: (_) => const HomePage(), settings: settings);
          }
          return MaterialPageRoute(
              builder: (_) => const LoginPage(), settings: settings);
        }
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }
    if (kDebugMode) {
      print('Invalid route name ${settings.name}');
    }
    return MaterialPageRoute(
        builder: (_) => const LoginPage(), settings: settings);
  }
}
