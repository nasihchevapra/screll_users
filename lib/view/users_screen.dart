import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:screll_sample/model/usermodel.dart';
import 'package:screll_sample/view/detail_screen.dart';
import 'package:screll_sample/view/search_screen.dart';
import 'package:screll_sample/view_model/users_provider.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  List<UserModel> users = [];

  @override
  Widget build(BuildContext context) {
    final userpro = Provider.of<UsersProvider>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: Text('Users List'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchScreen(userslist: users),
                      ));
                },
                icon: Icon(
                  Icons.search,
                  color: Color.fromARGB(255, 255, 4, 130),
                  size: 40,
                ))
          ],
        ),
        body: SafeArea(
            child: FutureBuilder(
                future: userpro.fetchUsers(),
                builder: (context, snap) {
                  if (snap.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snap.data == null && snap.data!.isEmpty) {
                    return Center(
                      child: Text('Problem Occured'),
                    );
                  }

                  return ListView.builder(
                    itemCount: snap.data!.length,
                    itemBuilder: (context, index) {
                      users = snap.data!;
                      return Card(
                        color: Color.fromARGB(255, 255, 4, 130),
                        child: ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        UsersDetail(user: snap.data![index]),
                                  ));
                            },
                            title: Text(snap.data![index].name)),
                      );
                    },
                  );
                })));
  }
}
