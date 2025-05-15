import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../models/http/custom_exception.dart';
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

  bool rememberCredentials = false;
  bool isPasswordObscured = true;
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
      backgroundColor: const Color(0xFFFAF8F1),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            SvgPicture.asset(
              key: const Key('sensor_svg_icon'),
              "assets/icon/sensor.svg",
              semanticsLabel: 'App Logo',
              height: 300,
            ),
            const SizedBox(height: 25),
            const Text(
              "Environment Monitor",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            TextFormField(
              controller: usernameController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person),
                hintText: 'Username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              obscureText: isPasswordObscured,
              controller: passwordController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      isPasswordObscured = !isPasswordObscured;
                    });
                  },
                  child: Icon(
                    isPasswordObscured
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Colors.black,
                  ),
                ),
                hintText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: rememberCredentials,
                      onChanged: (bool? value) {
                        setState(() {
                          rememberCredentials = value!;
                        });
                      },
                    ),
                    const Text('Remember me'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 18),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFC4F12E),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 50),
              ),
              onPressed: isButtonDisabled ? null : _handleLogin,
              child: const Text(
                "Login Now",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
            const Spacer(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
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
      rememberCredentials = prefs.getBool('rememberMe') ?? false;
      if (rememberCredentials) {
        usernameController.text = prefs.getString('username') ?? '';
        passwordController.text = prefs.getString('password') ?? '';
      }
    });
  }

  void saveCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (rememberCredentials) {
      await prefs.setString('username', usernameController.text);
      await prefs.setString('password', passwordController.text);
    } else {
      await prefs.remove('username');
      await prefs.remove('password');
    }
    await prefs.setBool('rememberMe', rememberCredentials);
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
      String message;
      if (error.runtimeType == FetchDataException) {
        message = error.toString();
      } else {
        message = "Invalid User Name or Password!";
      }

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
