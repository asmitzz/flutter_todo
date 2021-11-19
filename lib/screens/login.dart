import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool showPassword = false;

  final _formKey = GlobalKey<FormState>();

  void handleSignIn() {
    if (_formKey.currentState!.validate()) {
      print("submitted!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(255, 238, 238, 1.0),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 30.0, 16.0, 0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("🍭",style: TextStyle(fontSize: 60.0,color:Color.fromRGBO(37, 59, 107, 1.0)),),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "Let's sign you in.",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                          color: Color.fromRGBO(37, 59, 107, 1.0)),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Welcome back.",
                      style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.w500, color: Color.fromRGBO(37, 59, 107, 1.0)),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "You've been misssed!",
                      style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.w500, color: Color.fromRGBO(37, 59, 107, 1.0)),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        style: const TextStyle(color: Color.fromRGBO(37, 59, 107, 1.0)),
                        decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                              color: Color.fromRGBO(37, 59, 107, 1.0),
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Color.fromRGBO(37, 59, 107, 1.0)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color.fromRGBO(37, 59, 107, 1.0)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color.fromRGBO(37, 59, 107, 1.0)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color.fromRGBO(37, 59, 107, 1.0)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            hintText: "Enter Username",
                            labelStyle: TextStyle(fontWeight: FontWeight.w500 ,color: Color.fromRGBO(37, 59, 107, 1.0)),
                            labelText: "Username"),
                        validator: (value) {
                          return ((value != null && value.length < 5)
                              ? "Username should be atleast 5 characters long"
                              : null);
                        }),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        style: const TextStyle(color: Color.fromRGBO(37, 59, 107, 1.0)),
                        obscureText: !showPassword,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Color.fromRGBO(37, 59, 107, 1.0),
                            ),
                            suffixIcon: IconButton(
                                icon: Icon(
                                    showPassword
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: const Color.fromRGBO(37, 59, 107, 1.0)),
                                onPressed: () {
                                  setState(() {
                                    showPassword = !showPassword;
                                  });
                                }),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide(color: Color.fromRGBO(37, 59, 107, 1.0)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Color.fromRGBO(37, 59, 107, 1.0)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Color.fromRGBO(37, 59, 107, 1.0)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            hintText: "Enter Password",
                            labelStyle: const TextStyle(fontWeight: FontWeight.w500 ,color: Color.fromRGBO(37, 59, 107, 1.0)),
                            labelText: "Password"),
                        validator: (value) {
                          return ((value != null && value.length < 8)
                              ? "Password should be atleast 8 characters long"
                              : null);
                        }),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(
                              color: Color.fromRGBO(37, 59, 107, 1.0),fontWeight: FontWeight.w500 , fontSize: 16.0),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "/register");
                            },
                            child: const Text("Register",
                                style: TextStyle(
                                    color: Color.fromRGBO(37, 59, 107, 1.0),fontWeight: FontWeight.bold, fontSize: 16.0)))
                      ],
                    ),
                    FractionallySizedBox(
                      widthFactor: 1.0,
                      child: TextButton(
                        onPressed: handleSignIn,
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(const Color.fromRGBO(37, 59, 107, 1.0)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0))),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
