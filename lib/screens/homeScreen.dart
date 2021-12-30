import 'package:flutter/material.dart';
import 'package:trackapp/constants.dart';
import 'package:trackapp/controllers/loadData.dart';
import 'package:trackapp/screens/login.dart';
import 'package:trackapp/screens/mapScreen.dart';
import 'package:trackapp/widgets/eachStudentRowWidget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _items = [];

  getInitData() async {
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
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: _items.isEmpty
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            )
          : ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    EachStudentRowWidget(
                      firstName: _items[index]["first_name"],
                      lastName: _items[index]["last_name"],
                      email: _items[index]["email"],
                      gender: _items[index]["gender"],
                      page: MapScreen(
                        lat: _items[index]["lat"],
                        long: _items[index]["long"],
                        studentName: _items[index]["first_name"] +
                            ' ' +
                            _items[index]["last_name"],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    )
                  ],
                );
              }),
    );
  }
}
