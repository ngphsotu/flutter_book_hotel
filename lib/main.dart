import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'global.dart';
import '/common/common.dart';

Future<void> main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.allBlocProviders(context)],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppPages.generateRouteSettings,
          title: 'Book Hotel',
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            colorScheme:
                ThemeData().colorScheme.copyWith(primary: AppColors.primary),
          ),
        ),
      ),
    );
  }
}
