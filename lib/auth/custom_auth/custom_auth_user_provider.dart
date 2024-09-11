import 'package:rxdart/rxdart.dart';

import '/backend/schema/structs/index.dart';
import 'custom_auth_manager.dart';

class InfyVcardAuthUser {
  InfyVcardAuthUser({
    required this.loggedIn,
    this.uid,
    this.userData,
  });

  bool loggedIn;
  String? uid;
  UserStruct? userData;
}

BehaviorSubject<InfyVcardAuthUser> infyVcardAuthUserSubject =
    BehaviorSubject.seeded(InfyVcardAuthUser(loggedIn: false));
Stream<InfyVcardAuthUser> infyVcardAuthUserStream() => infyVcardAuthUserSubject
    .asBroadcastStream()
    .map((user) => currentUser = user);
