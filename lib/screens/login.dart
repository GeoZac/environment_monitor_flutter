import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../models/user/auth_request.dart';
import '../models/user/auth_response.dart';
import '../providers/unconv_api_provider.dart';
import '../utils/token_singleton.dart';
import 'dashboard.dart';

class LoginScreen extends StatefulWidget {
  final http.Client httpClient;

  const LoginScreen({
    super.key,
    required this.httpClient,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool rememberMe = false;
  bool isPassword = true;
  bool isButtonDisabled = true;

  @override
  initState() {
    super.initState();
    loadSavedCredentials();
    usernameController.addListener(_checkFields);
    passwordController.addListener(_checkFields);
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              key: const Key('sensor_svg_icon'),
              "assets/icon/sensor.svg",
              semanticsLabel: 'App Logo',
              height: 300,
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  width: 2,
                  color: Colors.grey,
                ),
              ),
              child: TextFormField(
                textAlignVertical: TextAlignVertical.center,
                style: const TextStyle(
                  color: Colors.black,
                ),
                controller: usernameController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  border: InputBorder.none,
                  hintText: 'Username',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(width: 2, color: Colors.grey),
              ),
              child: TextFormField(
                textAlignVertical: TextAlignVertical.center,
                obscureText: isPassword,
                style: const TextStyle(
                  color: Colors.black,
                ),
                controller: passwordController,
                decoration: InputDecoration(
                  prefixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          isPassword = !isPassword;
                        });
                      },
                      child: const Icon(
                        Icons.key,
                        color: Colors.black,
                      )),
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        isPassword = !isPassword;
                      });
                    },
                    child: isPassword
                        ? const Icon(
                            Icons.lock_outline,
                            color: Colors.black,
                          )
                        : const Icon(
                            Icons.lock_open,
                            color: Colors.black,
                          ),
                  ),
                  border: InputBorder.none,
                  hintText: 'Password',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: rememberMe,
                    onChanged: (bool? value) {
                      setState(() {
                        rememberMe = value!;
                      });
                    },
                  ),
                  const Text('Remember Me'),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(150, 40),
                shape: const StadiumBorder(),
                elevation: 0,
              ),
              onPressed: isButtonDisabled ? null : _handleLogin,
              child: const Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ));
  }

  void _checkFields() {
    setState(() {
      isButtonDisabled = usernameController.text.trim().isEmpty ||
          passwordController.text.isEmpty;
    });
  }

  void loadSavedCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      rememberMe = prefs.getBool('rememberMe') ?? false;
      if (rememberMe) {
        usernameController.text = prefs.getString('username') ?? '';
        passwordController.text = prefs.getString('password') ?? '';
      }
    });
  }

  void saveCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (rememberMe) {
      await prefs.setString('username', usernameController.text);
      await prefs.setString('password', passwordController.text);
    } else {
      await prefs.remove('username');
      await prefs.remove('password');
    }
    await prefs.setBool('rememberMe', rememberMe);
  }

  Future<void> _handleLogin() async {
    try {
      saveCredentials();

      final AuthResponse? authResponse =
          await UnconvApiProvider(widget.httpClient).login(
        AuthRequest(
          usernameController.text,
          passwordController.text,
        ),
      );

      TokenSingleton().bearerToken = authResponse!.token;

      if (!mounted) {
        return;
      }

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Dashboard(
            unconvUser: authResponse.unconvUser,
            httpClient: widget.httpClient,
          ),
        ),
      );
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Invalid User Name or Password!"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
