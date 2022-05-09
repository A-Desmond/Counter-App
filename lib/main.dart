import 'package:counter_app/authpage.dart';
import 'package:counter_app/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
}

FirebaseAuth firebaseAuth = FirebaseAuth.instance;
DatabaseReference usersRef = FirebaseDatabase.instance.ref().child('UsersInfo');

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Counter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Wrapper(),
    );
  }
}

class Wrapper extends ConsumerWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProivder);
    return authState.when(
        data: (userData) {
          if (userData != null) {
            return const HomePage();
          }
          return const Register();
        },
        error: (Object error, _) => const Scaffold(
              body: Text('Error', style: TextStyle(color: Colors.red)),
            ),
        loading: () => const Scaffold(
              body: Text(
                'Please wait..',
                style: TextStyle(color: Colors.red),
              ),
            ));
  }
}
