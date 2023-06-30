import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
                onPressed: isButtonDisabled
                    ? null
                    : () async {
                        return;
                      },
                child: const Text("Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ))),
          ],
        ));
  }
}
