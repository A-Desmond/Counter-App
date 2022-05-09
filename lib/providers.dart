import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'logic.dart';

final counter = StateProvider(((ref) => 0));

final firebaseAuthProvider = Provider<FirebaseAuth>(
  (ref) => FirebaseAuth.instance,
);

final authStateProivder = StreamProvider<User?>(
    ((ref) => ref.watch(firebaseAuthProvider).authStateChanges()));

final getUserDataProivder = FutureProvider(((ref) {
  return FirebaseBackEnd.getValue();
}));

final sendDataToFirebase = StateProvider(((ref) {
  int data = ref.watch(counter);
  return FirebaseBackEnd.sendData(data);
}));
