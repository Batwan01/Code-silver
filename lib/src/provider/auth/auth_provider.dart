

import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = StateNotifierProvider<AuthProvider, bool>((ref) {
  final AuthProvider authProvider = AuthProvider();
  return authProvider;
});

class AuthProvider extends StateNotifier<bool> {
  AuthProvider() : super(false);

  void doLogin(){
    state = true;
  }
}
