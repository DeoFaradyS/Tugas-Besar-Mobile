import 'package:echo/DB/echo_api.dart';
import 'package:echo/Model/echo_api_model.dart';
import 'package:echo/source/components.dart';
import 'package:flutter/material.dart';

class MyUserList extends StatefulWidget {
  const MyUserList({super.key});

  @override
  State<MyUserList> createState() => _MyUserListState();
}

class _MyUserListState extends State<MyUserList> {
  List<Users> listUsers = [];
  EchoApi echoApi = EchoApi();

  getData() async {
    listUsers = await echoApi.getData();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HTTP FLUTTER'),
      ),
      body: ListView.separated(
          itemBuilder: (context, i) {
            return ListTile(
              title: Text(listUsers[i].email),
            );
          },
          separatorBuilder: (context, i) {
            return const Divider();
          },
          itemCount: listUsers.length),
    );
  }

  Widget back() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      PrimaryButton(
        text: "Kembali",
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/register');
        },
      ),
    ]);
  }
}
