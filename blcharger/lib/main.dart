import 'package:blcharger/core/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:blcharger/features/auth/app_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';
import 'package:blcharger/features/auth/pt_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Force portrait mode
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  ).then(
    (_) {
      runApp(ChangeNotifierProvider(
        create: (context) => ApplicationState(),
        builder: ((context, child) => const MyApp()),
      ));
    },
  );
}

// Change MaterialApp to MaterialApp.router and add the routerConfig
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'BlCharger',

      localizationsDelegates: [
        FirebaseUILocalizations.withDefaultOverrides(const PtLocalizations()),
        FirebaseUILocalizations.withDefaultOverrides(const PtLocalizations()),
        //GlobalMaterialLocalizations.delegate,
        //GlobalWidgetsLocalizations.delegate,
        FirebaseUILocalizations.delegate,
      ],

      theme: ThemeData(
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
              highlightColor: Colors.deepPurple,
            ),
        primarySwatch: Colors.deepPurple,
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
      ),
      routerConfig: router, // new
    );
  }
}


// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'MyApp',
//       theme: ThemeData(
//         useMaterial3: true,
//         appBarTheme: const AppBarTheme(
//           iconTheme: IconThemeData(
//             color: Colors.white,
//           ),
//           titleTextStyle: TextStyle(
//             color: Colors.white,
//             fontSize: 20,
//           ),
//           backgroundColor: Colors.deepPurple,
//         ),
//       ),
//       home: const SplashView(),
//     );
//   }
// }
