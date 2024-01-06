import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/constants/colors.dart';
import 'package:untitled/features/auth/model/login_model.dart';
import 'package:untitled/features/auth/repository/auth_repository.dart';
import 'package:untitled/features/auth/view_model/auth_view_model.dart';
import '../../../common/common_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final authViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SingleChildScrollView(
          child: Form(
            key: loginKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/signup.png'),
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    authViewModel.emailController.text = value;
                  },
                  obscureText: false,
                  hintText: 'Enter Email',
                  icon: Icons.alternate_email,
                  controller: authViewModel.emailController,
                ),
                CustomTextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    authViewModel.passwordController.text = value;
                  },
                  controller: authViewModel.passwordController,
                  obscureText: true,
                  hintText: 'Enter Password',
                  icon: Icons.lock,
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    if (loginKey.currentState!.validate()) {
                      authViewModel.login(
                        context,
                        Login(
                            email: authViewModel.emailController.text,
                            password: authViewModel.passwordController.text),
                      );
                    } else {}
                  },
                  child: Container(
                    width: size.width,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    child: Center(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: const [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text('OR'),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: size.width,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primaryColor),
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 30,
                        child: Image.asset('assets/images/google.png'),
                      ),
                      Text(
                        'Sign Up with Google',
                        style: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    // if (loginKey.currentState!.validate()) {
                    //   AuthRepository().login(
                    //       login: Login(
                    //           email: authViewModel.emailController.text,
                    //           password: authViewModel.passwordController.text));
                    //   print("success");

                    // Navigator.pushReplacement(
                    //     context,
                    //     PageTransition(
                    //         child: const SignIn(),
                    //         type: PageTransitionType.bottomToTop));
                  },
                  child: Center(
                    child: Text.rich(
                      TextSpan(children: [
                        TextSpan(
                          text: 'Have an Account? ',
                          style: TextStyle(
                            color: AppColors.blackColor,
                          ),
                        ),
                        TextSpan(
                          text: 'Login',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
