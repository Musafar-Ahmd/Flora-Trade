import 'package:flutter/cupertino.dart';

class AuthViewModel extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey loginKey = GlobalKey<FormState>();
}