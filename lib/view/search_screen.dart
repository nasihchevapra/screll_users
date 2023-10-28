import 'package:flutter/material.dart';
import 'package:screll_sample/model/usermodel.dart';
import 'package:screll_sample/view/detail_screen.dart';

class SearchScreen extends StatefulWidget {
  final List<UserModel> userslist;
  const SearchScreen({super.key, required this.userslist});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<UserModel> _searchList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new)),
        title: TextField(
          onChanged: (value) {
            _searchList.clear();
            for (var i in widget.userslist) {
              if (i.name.toLowerCase().contains(value.toLowerCase())) {
                _searchList.add(i);
                setState(() {
                  _searchList;
                });
              }
            }
          },
          decoration: InputDecoration(
            labelText: 'Search Profile',
            constraints: BoxConstraints(maxHeight: 40),
            border: OutlineInputBorder(
                borderSide: BorderSide(
              width: 0.1,
              color: Colors.red,
            )),
          ),
        ),
      ),
      body: SafeArea(
        child: _searchList.isEmpty
            ? Center(
                child: Text('No data found'),
              )
            : ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                      height: 20,
                    ),
                itemCount: _searchList.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white,
                    elevation: 0,
                    shadowColor: Colors.grey.shade300,
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  UsersDetail(user: _searchList[index]),
                            ));
                      },
                      title: Text(_searchList[index].name),
                    ),
                  );
                }),
      ), //
    );
  }
}
