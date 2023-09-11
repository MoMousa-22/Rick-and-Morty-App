import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_router.dart';

void main() {
  runApp(RickAndMortyApp(
    appRouter: AppRouter(),
  ));
}

class RickAndMortyApp extends StatelessWidget {
  final AppRouter appRouter;
  const RickAndMortyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: appRouter.generateRoute,
          title: 'Rick And Morty',
        );
      },
    );
  }
}
