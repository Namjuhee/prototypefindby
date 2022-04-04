import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class Findbytest1FirebaseUser {
  Findbytest1FirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

Findbytest1FirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<Findbytest1FirebaseUser> findbytest1FirebaseUserStream() => FirebaseAuth
    .instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<Findbytest1FirebaseUser>(
        (user) => currentUser = Findbytest1FirebaseUser(user));
