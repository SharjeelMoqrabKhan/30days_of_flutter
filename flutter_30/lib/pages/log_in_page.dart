import 'package:flutter/material.dart';
import 'package:flutter_30/util/routes/myRoutes.dart';

class LogInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Image.asset(
            'assets/images/login.png',
            fit: BoxFit.cover,
          ),
          Text(
            'Welcome',
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'User Name',
                    hintText: 'Enter User Name',
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter Password',
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, MyRoutes.homeRoute);
                  },
                  child: Text("Login"),
                  style: TextButton.styleFrom(
                    minimumSize: Size(100, 40),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
