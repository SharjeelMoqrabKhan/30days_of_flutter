import 'package:flutter/material.dart';
import 'package:flutter_30/util/routes/myRoutes.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  String name = '';
  bool changedButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToNextPage(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      setState(() {
        changedButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changedButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Image.asset(
              'assets/images/login.png',
              fit: BoxFit.cover,
            ),
            Text(
              'Welcome $name',
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
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Name can not empty';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter Password',
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Password can not empty';
                      } else if (value.length < 6) {
                        return 'Password should be six characters long atleast';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Material(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(changedButton ? 50 : 8),
                    child: InkWell(
                      onTap: () => moveToNextPage(context),
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        child: Container(
                          width: changedButton ? 50 : 100,
                          height: 40,
                          alignment: Alignment.center,
                          child: changedButton
                              ? Icon(Icons.check)
                              : Text(
                                  'Login',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
