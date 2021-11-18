import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import 'authentification-services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<AuthentificationService>(
              create:(_) => AuthentificationService(FirebaseAuth.instance)
          ),
          StreamProvider(
            create: (context) => context.read<AuthentificationService>().authStateChange
          )
        ],
        child: MaterialApp(
          title: 'Dubuche_Lecouffe',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: AuthentificationWrapper(),
          ),
        );
  }
}

class AuthentificationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      final FirebaseUser = context.watch<User>();

      if (FirebaseUser != null){
        return Text('sign in');
      }
      return Text('not sign in ');
  }
}