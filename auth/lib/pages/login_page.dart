import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isAPICallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? username;
  String? password;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor('#283B71'),
        body: ProgressHUD(
          opacity: 0.3,
          key: UniqueKey(),
          inAsyncCall: isAPICallProcess,
          child: Form(child: _loginUI(context)),
        ),
      ),
    );
  }

  Widget _loginUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3.3,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.white, Colors.white]),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100),
                    bottomRight: Radius.circular(100))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset('assets/images/download.png'),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 50,
              bottom: 30,
              left: 20,
            ),
            child: Text(
              'Login',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          FormHelper.inputFieldWidget(
            context,
            'username',
            'UserName',
            (onVAlidateVal) {
              if (onVAlidateVal.isEmpty) {
                return 'username can\'t be empty';
              }
              return null;
            },
            (onSaved) {
              username = onSaved;
            },
            showPrefixIcon: true,
            prefixIcon: const Icon(
              Icons.person,
              color: Colors.white,
            ),
            borderFocusColor: Colors.white,
            prefixIconColor: Colors.white,
            borderColor: Colors.white,
            textColor: Colors.white,
            hintColor: Colors.white.withOpacity(0.7),
            borderRadius: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: FormHelper.inputFieldWidget(
              context,
              'password',
              'Password',
              (onVAlidateVal) {
                if (onVAlidateVal.isEmpty) {
                  return 'password can\'t be empty';
                }
                return null;
              },
              (onSaved) {
                password = onSaved;
              },
              showPrefixIcon: true,
              prefixIcon: const Icon(
                Icons.lock,
                color: Colors.white,
              ),
              borderFocusColor: Colors.white,
              prefixIconColor: Colors.white,
              borderColor: Colors.white,
              textColor: Colors.white,
              hintColor: Colors.white.withOpacity(0.7),
              borderRadius: 10,
              obscureText: hidePassword,
              suffixIcon: IconButton(
                icon: Icon(
                  hidePassword ? Icons.visibility_off : Icons.visibility,
                ),
                color: Colors.white,
                onPressed: () {
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 7, right: 25),
            child: Align(
              alignment: Alignment.bottomRight,
              child: RichText(
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: 'Forget password',
                      style: const TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print('really you forgeted');
                        })
                ]),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: FormHelper.submitButton('Login', () {},
                txtColor: Colors.white,
                borderColor: Colors.white,
                fontWeight: FontWeight.bold,
                borderRadius: 10,
                btnColor: HexColor('#283B71')),
          ),
          const SizedBox(
            height: 20,
          ),
          const Center(
            child: Text(
              'OR',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                  color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: RichText(
              text: TextSpan(children: <TextSpan>[
                const TextSpan(text: 'Don\'t have an account? '),
                TextSpan(
                    text: 'Sign up',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(context, '/register');
                      })
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
