import 'package:flutter/material.dart';
import 'package:trackapp/constants.dart';
import 'package:trackapp/utils/authentication.dart';
import 'package:trackapp/widgets/googleSignInButton.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(AppColors.mainColorBlack),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // section 1
            Center(
              child: Column(
                children: [
                  // brand section
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/background1.jpg"),
                    radius: 60,
                  ),
                  Text(app_name, style: WhiteTexts.texth4,),
                  // page title
                  SizedBox(height:15),
                  Text("_Login Screen_", style: WhiteTexts.texth2,),
                ],
              ),
            ),
            // section 2 | Login btn
            FutureBuilder(
                future: Authentication.initializeFirebase(context: context),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error initializing Firebase');
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    return GoogleSignInButton();
                  }
                  return CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.orange,
                    ),
                  );
                },
              ),

           

          ],
        )),
    );
  }
}