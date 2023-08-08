import 'package:blcharger/core/widgets/blc_logo.dart';
import 'package:blcharger/features/auth/authentication.dart';
import 'package:provider/provider.dart';
import 'package:blcharger/features/auth/app_state.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'
    hide EmailAuthProvider, PhoneAuthProvider;
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:go_router/go_router.dart';
// import 'package:firebase_core/firebase_core.dart';// new
//import 'package:blcharger/features/home/home_view.dart';

//     hide
//         EmailAuthProvider,
//         PhoneAuthProvider; // new

// class SplashView extends StatefulWidget {
//   const SplashView({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _SplashViewState createState() => _SplashViewState();
// }

// class _SplashViewState extends State<SplashView> {
//   @override
//   void initState() {
//     super.initState();
//     _navigateBasedOnAuthState();
//   }

//   _navigateBasedOnAuthState() async {
//     await Firebase.initializeApp();
//     FirebaseAuth.instance.authStateChanges().listen((User? user) {
//       if (user == null) {
//         GoRouter.of(context).go('/sign-in');
//         //context.push('/sign-in');
//       } else {
//         context.push('/home');
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//         child: CircularProgressIndicator(),
//       ),
//     );
//   }
// }

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(50),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const BLCLogo(logoSize: 150),
              const SizedBox(height: 50),
              Consumer<ApplicationState>(
                builder: (context, appState, _) => AuthFunc(
                    loggedIn: appState.loggedIn,
                    signOut: () {
                      FirebaseAuth.instance.signOut();
                    }),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
