import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:screll_sample/model/usermodel.dart';
import 'package:screll_sample/view/detail_screen.dart';
import 'package:screll_sample/view/search_screen.dart';
import 'package:screll_sample/view_model/users_provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  List<UserModel> users = [];

  @override
  Widget build(BuildContext context) {
    final userpro = Provider.of<UsersProvider>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: Text('Users List'),
          actions: [
            IconButton(
                onPressed: () {
                  userpro.fetchUsers();
                },
                icon: Icon(Icons.get_app)),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchScreen(userslist: users),
                      ));
                },
                icon: Icon(Icons.search))
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
