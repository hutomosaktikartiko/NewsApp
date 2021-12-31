import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/config/custom_http_overide.dart';
import 'core/config/theme_config.dart';
import 'core/oberservers/app_bloc_observer.dart';
import 'core/oberservers/firebase_analytics_observer_info.dart';
import 'injection_container.dart' as di;
import 'presentation/cubit/cubits.dart';
import 'presentation/screens/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  HttpOverrides.global = CustomHttpOverrides();
  Firebase.initializeApp();
  await di.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<InternetConnectionCubit>(),
        ),
        BlocProvider(
          create: (context) => di.sl<NewsCubit>(),
        ),
        BlocProvider(
          create: (context) => di.sl<NewsSearchCubit>(),
        ),
        BlocProvider(
          create: (context) => di.sl<NewsFavoriteCubit>(),
        ),
        BlocProvider(
          create: (context) => di.sl<TabCategoryCubit>(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeConfig.defaultTheme,
        home: SplashScreen(),
        navigatorObservers: [
          di.sl<FirebaseAnalyticsObserverInfo>().analyticsObserver,
        ],
      ),
    );
  }
}
