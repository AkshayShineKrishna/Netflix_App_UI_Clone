import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/Application/downloads/downloads_bloc.dart';
import 'package:netflix/Application/hot_and_new/hot_and_new_bloc.dart';
import 'package:netflix/Application/search/search_bloc.dart';
import 'package:netflix/Core/Colors/colors.dart';
import 'package:netflix/Core/di/injectable.dart';
import 'package:netflix/Presentation/Main_page/screen_main_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Application/home/home_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjectable();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<DownloadsBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<SearchBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<HomeBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<HotAndNewBloc>(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Netflix Clone',
          theme: ThemeData(
              fontFamily: GoogleFonts.montserrat().fontFamily,
              scaffoldBackgroundColor: kBackgroundColor,
              textTheme: const TextTheme(
                bodyLarge: TextStyle(color: kWhiteFont),
                bodyMedium: TextStyle(color: kWhiteFont),
                bodySmall: TextStyle(color: kWhiteFont),
              ),
              iconTheme: const IconThemeData(color: kWhiteBackground)),
          home: ScreenMainPage()),
    );
  }
}
