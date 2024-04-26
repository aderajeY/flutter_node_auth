import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isAPICallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? username;
  String? password;
  String? email;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor('#283B71'),
        body: ProgressHUD(
          opacity: 0.3,
          key: UniqueKey(),
          inAsyncCall: isAPICallProcess,
          child: Form(child: _registerUI(context)),
        ),
      ),
    );
  }

  Widget _registerUI(BuildContext context) {
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
              'Create An Account',
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
          const SizedBox(
            height: 20,
          ),
          FormHelper.inputFieldWidget(
            context,
            'email',
            'Email',
            (onVAlidateVal) {
              if (onVAlidateVal.isEmpty) {
                return 'email can\'t be empty';
              }
              return null;
            },
            (onSaved) {
              email = onSaved;
            },
            showPrefixIcon: true,
            prefixIcon: const Icon(
              Icons.mail,
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
          const SizedBox(
            height: 20,
          ),
          Center(
            child: FormHelper.submitButton('Register', () {},
                txtColor: Colors.white,
                borderColor: Colors.white,
                fontWeight: FontWeight.bold,
                borderRadius: 10,
                btnColor: HexColor('#283B71')),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: RichText(
              text: TextSpan(children: <TextSpan>[
                const TextSpan(text: 'Already have an account? '),
                TextSpan(
                    text: 'Login',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(context, '/');
                      })
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
