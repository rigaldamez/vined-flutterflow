import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class VinedFirebaseUser {
  VinedFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

VinedFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<VinedFirebaseUser> vinedFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<VinedFirebaseUser>((user) => currentUser = VinedFirebaseUser(user));
