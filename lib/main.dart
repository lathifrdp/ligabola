import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liga_bola/src/bloc/leagues/leagues_bloc.dart';
import 'package:liga_bola/src/bloc/standings/standings_bloc.dart';
import 'package:liga_bola/src/helper/theme_colors.dart';
import 'package:liga_bola/src/ui/klasemen_page.dart';
import 'package:liga_bola/src/ui/main_page.dart';

void main() {
  runApp(const InitApp());
}

class InitApp extends StatefulWidget {
  const InitApp({Key? key}) : super(key: key);

  @override
  State<InitApp> createState() => _InitAppState();
}

class _InitAppState extends State<InitApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LeaguesBloc>(
          create: (BuildContext context) => LeaguesBloc(),
        ),
        BlocProvider<StandingsBloc>(
          create: (BuildContext context) => StandingsBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          appBarTheme: Theme.of(context)
              .appBarTheme
              .copyWith(systemOverlayStyle: SystemUiOverlayStyle.light),
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: hijauTua,
            selectionColor: hijauTua,
            selectionHandleColor: hijauTua,
          ),
        ),
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!,
          );
        },
        routes: {
          '/': (context) => const MainPage(),
          '/klasemen': (context) => const KlasemenPage(),
        },
      ),
    );
  }
}
