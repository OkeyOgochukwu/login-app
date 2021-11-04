import 'package:assigned_task/constant/customised_button.dart';
import 'package:assigned_task/constant/customised_text_form_field.dart';
import 'package:assigned_task/model/login_model.dart';
import 'package:assigned_task/pages/dashboard_page.dart';
import 'package:assigned_task/pages/sign_up_page.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);
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
                  child: LoginFormTwo(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginFormTwo extends StatefulWidget {
  const LoginFormTwo({Key? key}) : super(key: key);

  @override
  _LoginFormTwoState createState() => _LoginFormTwoState();
}

class _LoginFormTwoState extends State<LoginFormTwo> {
  TextEditingController emailEditing = TextEditingController();
  TextEditingController passwordEditing = TextEditingController();

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

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
              'Sign In',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23,
                color: const Color.fromARGB(240, 14, 40, 50),
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
                validator: (input) => input.length < 3
                    ? 'password should be more than 3 character'
                    : null,
                hintText: 'Password',
                controller: passwordEditing),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 150),
              child: GestureDetector(
                child: Container(
                  margin: EdgeInsets.only(left: 19),
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(100, 10, 34, 50),
                    ),
                  ),
                ),
                onTap: () {},
              ),
            ),
            SizedBox(
              height: 10,
            ),
            CustomisedButton(
              title: 'Sign In',
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
                Text('Don\'t have an account?'),
                GestureDetector(
                  child: Container(
                    margin: EdgeInsets.only(right: 15),
                    child: Text(
                      'Sign Up',
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
                          return WelcomePage();
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
