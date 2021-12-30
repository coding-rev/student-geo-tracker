import 'package:flutter/material.dart';
import 'package:trackapp/constants.dart';

class EachStudentRowWidget extends StatelessWidget {
  const EachStudentRowWidget({ 
    Key? key,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
    required this.page, 
    }) : super(key: key);

  final String firstName;
  final String lastName;
  final String email;
  final String gender;
  final Widget page; 

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.red,
        shape: new RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          
        ),
        padding: EdgeInsets.symmetric(
            horizontal: deviceSize.width * 0.005,
            vertical: deviceSize.height * 0.03),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            Icon(Icons.person, size: 15),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("$firstName $lastName",
                    style: WhiteTexts.texth4),
                Text("$email", style: WhiteTexts.textp,)
              ],
            )
          ]),
          Icon(
            gender=="Male"
            ?Icons.male : Icons.female, 
            size: 15, color: Colors.white)
        ],
      ),
    );
  }
}