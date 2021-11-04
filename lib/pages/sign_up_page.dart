import 'package:assigned_task/constant/customised_button.dart';
import 'package:assigned_task/constant/customised_text_form_field.dart';
import 'package:assigned_task/pages/dashboard_page.dart';
import 'package:assigned_task/pages/sign_in_page.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(0.86), BlendMode.dst),
          image: NetworkImage(
              'https://pixlok.com/wp-content/uploads/2021/03/Bokeh-PNG-background.jpg'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.25),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 100, 180, 100),
              child: Text(
                'Welcome!!',
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(25, 50, 25, 0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60.0),
                    topRight: Radius.circular(60.0),
                  ),
                ),
                child: Form(
                  child: LoginForm(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form!.save();
      return true;
    }
    return false;
  }

  TextEditingController emailEditing = TextEditingController();
  TextEditingController passwordEditing = TextEditingController();
  TextEditingController confirmPasswordEditing = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sign Up',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            CustomisedTextFormField(
              onSaved: (input) {
                emailEditing = input;
              },
              validator: (input) =>
                  !input.contains('@') ? 'email should contain @' : null,
              hintText: 'Email',
              controller: emailEditing,
            ),
            SizedBox(
              height: 10,
            ),
            CustomisedTextFormField(
                onSaved: (input) {
                  passwordEditing = input;
                },
                validator: (input) {
                  if (input.isEmpty) {
                    return 'please insert your password';
                  }
                  if (input != passwordEditing.text) {
                    return 'Password does not match';
                  }
                  return null;
                },
                hintText: 'Password',
                controller: passwordEditing),
            SizedBox(
              height: 10,
            ),
            CustomisedTextFormField(
                onSaved: (input) {
                  confirmPasswordEditing = input;
                },
                validator: (input) {
                  if (input.isEmpty) {
                    return 'please insert your password';
                  }
                  if (input != confirmPasswordEditing.text) {
                    return 'Password does not match';
                  }
                  return null;
                },
                hintText: 'Re-enter Password',
                controller: confirmPasswordEditing),
            SizedBox(
              height: 10,
            ),
            CustomisedButton(
              title: 'Sign Up',
              onPressed: () {
                if (validateAndSave()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) {
                        return DashBoard();
                      },
                    ),
                  );
                }
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Divider(
                    color: const Color.fromARGB(180, 165, 142, 113),
                  ),
                ),
                Text(
                  " or Sign Up with ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Divider(
                    height: 36,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  'https://www.freepnglogos.com/uploads/google-logo-png/google-logo-icon-png-transparent-background-osteopathy-16.png',
                  height: 50,
                  //cacheWidth: 60,
                ),
                SizedBox(
                  width: 10,
                ),
                Image.network(
                  'https://www.freeiconspng.com/thumbs/facebook-icon-png/facebook-png-icon-follow-us-facebook-1.png',
                  height: 50,
                  cacheWidth: 60,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Have an Account ?'),
                GestureDetector(
                  child: Container(
                    margin: EdgeInsets.only(right: 15),
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                          color: Colors.orangeAccent[400],
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) {
                          return SignInPage();
                        },
                      ),
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
