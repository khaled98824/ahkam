import '../page-auth/auth_page.dart';
import '../widgets/background_painter.dart';
import '../widgets/google_signup_button_widget.dart';
import 'package:flutter/material.dart';

class SignUpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Stack(
        fit: StackFit.expand,
        children: [
          CustomPaint(painter: BackgroundPainter()),
          buildSignUp(context),
        ],
      );

  Widget buildSignUp(BuildContext context) => Column(
        children: [
          Spacer(),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: 190,
              child: Text(
                'أهلاً وسهلاً بك مجدداً',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ),
          Spacer(),
          Text('قم بتسجيل الدخول',style: Theme.of(context).textTheme.headline5,),
          SizedBox(height: 12),
          OutlineButton(
            child: Text('دخول',style: Theme.of(context).textTheme.headline3,),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            highlightedBorderColor: Colors.black,
            borderSide: BorderSide(color: Colors.black),
            textColor: Colors.black,
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AuthPage()),
            ),
          ),
          SizedBox(height: 12),
          //GoogleSignupButtonWidget(),
          Spacer()
        ],
      );
}
