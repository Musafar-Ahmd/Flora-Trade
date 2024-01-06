import 'package:flutter/cupertino.dart';
import 'package:untitled/features/auth/repository/auth_repository.dart';

import '../model/login_model.dart';

class AuthViewModel extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final loginKey = GlobalKey<FormState>();
  AuthRepository _authRepository = AuthRepository();

  Future login(BuildContext context, Login login) async {
    await _authRepository.login(login, context).then((value) {});
  }
}
