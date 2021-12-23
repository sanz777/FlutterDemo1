import 'package:demo2/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool isAnimated = false;

  final _formData = GlobalKey<FormState>();

  moveToNextPage(BuildContext context) async {
    setState(() {
      isAnimated = true;
    });
    await Future.delayed(
      const Duration(seconds: 1),
    );
    await Navigator.pushNamed(context, MyRoutes.homeRoute);
    setState(() {
      isAnimated = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formData,
            child: Column(
              children: <Widget>[
                Image.asset(
                  "assets/images/welcome.png",
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Enter UserName",
                          labelText: "UserName",
                        ),
                        validator: (value) {
                          if (value != null) {
                            value.isEmpty ? "Username can not be blank" : null;
                          }
                        },
                        onChanged: (value) {
                          setState(() {
                            name = value;
                          });
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: "Enter Password",
                          labelText: "Password",
                        ),
                        validator: (value) {
                          if (value != null) {
                            value.isEmpty
                                ? "Password can not be blank"
                                : value.length < 6
                                    ? "Password should be greater then 6 letters"
                                    : null;
                          }
                        },
                      ),
                      const SizedBox(height: 30.0),
                      // ElevatedButton(
                      //   onPressed: () {
                      //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                      //   },
                      //   child: const Text(
                      //     "Login",
                      //     style:
                      //         TextStyle(fontSize: 22, fontWeight: FontWeight.w200),
                      //   ),
                      //   style: TextButton.styleFrom(
                      //     minimumSize: Size(250, 50),
                      //   ),
                      // )
                      Material(
                        color: Colors.green,
                        borderRadius:
                            BorderRadius.circular(isAnimated ? 50 : 8),
                        child: InkWell(
                          onTap: () => moveToNextPage(context),
                          child: AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            child: Container(
                              height: 50,
                              width: isAnimated ? 50 : 150,
                              alignment: Alignment.center,
                              child: isAnimated
                                  ? const Icon(Icons.done, color: Colors.white)
                                  : const Text(
                                      "Login",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                      ),
                                    ),
                              // decoration: BoxDecoration(
                              //   color: Colors.lightGreen,
                              //   // shape: isAnimated
                              //   //     ? BoxShape.circle
                              //   //     : BoxShape.rectangle,

                              // ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
