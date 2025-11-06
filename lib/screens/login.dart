import 'package:flutter/material.dart';

class ScreenLogin extends StatefulWidget {
  ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  bool _isDataMAtched = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  hintText: "Username",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: !_isDataMAtched,
                    child: Text(
                      "Invalid username or password",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      checkLogin(context);
                    },
                    icon: const Icon(Icons.check),
                    label: const Text("Login"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void checkLogin(BuildContext context) {
    final _username = _usernameController.text;
    final _password = _passwordController.text;
    if (_username == "admin" && _password == "admin") {
      // Login successful
    } else {
      final _errorMessage = "Invalid username or password";
      //Snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
          margin: EdgeInsets.all(10),
          content: Text(_errorMessage),
          duration: Duration(seconds: 10),
        ),
      );
      //Alert Dialog
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Login Failed"),
            content: Text(_errorMessage),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );

      //Show Text
      setState(() {
        _isDataMAtched = false;
      });
    }
  }
}
