import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/presentation/screens/main/main_screen.dart';
import 'package:news_app/presentation/screens/splash/splash_screen.dart';

import 'core/config/theme_config.dart';
import 'core/oberservers/app_bloc_observer.dart';
import 'injection_container.dart' as di;
import 'presentation/cubit/cubits.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
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
      ),
    );
  }
}
