import 'package:flutter/material.dart';
import 'package:screll_sample/model/usermodel.dart';
import 'package:screll_sample/widgets/stackbox.dart';

class UsersDetail extends StatelessWidget {
  final UserModel user;
  const UsersDetail({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              )),
          backgroundColor: Color.fromARGB(255, 255, 4, 130),
          title: Text(
            'Detailed View of Users',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: StackBox(
            firstHeight: screenheight * 1,
            color: Color.fromARGB(255, 255, 4, 130),
            secondTop: 110,
            secondHeight: screenheight * 1,
            secondchild: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(height: screenheight * 0.040),
                  ListTile(
                    title: Text('Name'),
                    subtitle: Text(user.name),
                  ),
                  ListTile(
                    title: Text('Phone Number'),
                    subtitle: Text(user.phone),
                  ),
                  ListTile(
                    title: Text('User Name'),
                    subtitle: Text(user.username),
                  ),
                  ListTile(
                    title: Text('Address'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(user.address.street),
                        Text(user.address.city),
                        Text(user.address.suite),
                        Text(user.address.zipcode),
                        Text(user.address.geo.lat),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton.icon(
                          label: Text(user.website),
                          icon: Icon(Icons.web),
                          onPressed: () {}),
                      TextButton.icon(
                          label: Text(user.email),
                          icon: Icon(Icons.email),
                          onPressed: () {}),
                    ],
                  ),
                  ListTile(
                    title: Text('Company'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(user.company.name),
                        Text(user.company.catchPhrase),
                        Text(user.company.bs),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}
