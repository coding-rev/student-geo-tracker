import 'package:flutter/material.dart';
import 'package:trackapp/constants.dart';
import 'package:trackapp/controllers/loadData.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _items = [];

  getInitData()async{
    var data = await readData();
    setState(() {
      _items = data;
    });
  }

  @override
  void initState() {
    super.initState();
    getInitData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(AppColors.mainColorBlack),
      appBar: AppBar(
        title: Text(app_name, style: WhiteTexts.texth2),
        backgroundColor: Color(AppColors.mainColorBlack),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.logout))],
      ),
      body: 
       _items.isEmpty
        ? Center(child: CircularProgressIndicator(
          color: Colors.red,
          ),)
        :ListView.builder(
          itemCount: _items.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                EachStudentRowWidget(
                  firstName: _items[index]["first_name"],
                  lastName: _items[index]["last_name"],
                  email: _items[index]["email"],
                  gender: _items[index]["gender"],
                ),
                SizedBox(height: 5),
              ],
            );
          }),
    );
  }
}


// creating a dynamic widget for each student row
class EachStudentRowWidget extends StatelessWidget {
  const EachStudentRowWidget({ 
    Key? key,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender 
    }) : super(key: key);

  final String firstName;
  final String lastName;
  final String email;
  final String gender;

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        primary: Colors.red,
        shape: new RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          
        ),
        padding: EdgeInsets.symmetric(
            horizontal: deviceSize.width * 0.02,
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