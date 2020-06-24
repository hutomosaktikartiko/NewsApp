import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/bloc.dart';
import 'package:news_app/bloc/page_bloc.dart';
import 'package:news_app/ui/pages/pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PageBloc()),
        BlocProvider(
          create: (_) => NewsBloc()..add(FetchNews()),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}

// const MaterialColor white = const MaterialColor(
//   0xFFFFFFFF,
//   const <int, Color>{
//     50: const Color(0xFFFFFFFF),
//     100: const Color(0xFFFFFFFF),
//     200: const Color(0xFFFFFFFF),
//     300: const Color(0xFFFFFFFF),
//     400: const Color(0xFFFFFFFF),
//     500: const Color(0xFFFFFFFF),
//     600: const Color(0xFFFFFFFF),
//     700: const Color(0xFFFFFFFF),
//     800: const Color(0xFFFFFFFF),
//     900: const Color(0xFFFFFFFF),
//   },
// );
