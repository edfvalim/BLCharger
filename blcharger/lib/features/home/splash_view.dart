import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:blcharger/core/widgets/blc_logo.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:blcharger/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart'
    hide EmailAuthProvider, PhoneAuthProvider;

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    firebaseInit();
  }

  Future<void> firebaseInit() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    await Future.delayed(
      const Duration(seconds: 1),
      () {
        FirebaseUIAuth.configureProviders([EmailAuthProvider()]);

        FirebaseAuth.instance.userChanges().listen(
          (user) {
            if (user != null) {
              GoRouter.of(context).go('/home');
            } else {
              GoRouter.of(context).go('/sign-in');
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(40),
        child: const SingleChildScrollView(
          child: Column(
            children: [
              BLCLogo(logoSize: 160),
              SizedBox(height: 40),
              CircularProgressIndicator(color: Colors.deepPurple),
            ],
          ),
        ),
      ),
    );
  }
}
