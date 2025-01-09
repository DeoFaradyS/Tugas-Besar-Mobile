import 'package:echo/DB/echo_api.dart';
import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  EchoApi echoApi = EchoApi();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tambah email'),
        ),
        body: Container(
          child: Column(
            children: [
              TextField(
                controller: _emailController,
                decoration: InputDecoration(hintText: 'Masukan Email'),
              ),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(hintText: 'Masukan Password'),
              ),
              ElevatedButton(
                  onPressed: () async {
                    bool response = await echoApi.postData(
                        _emailController.text, _passwordController.text);
                    if (response) {
                      Navigator.of(context).popAndPushNamed('/userlist');
                    } else {
                      print('Simpan Data Gagal');
                    }
                  },
                  child: Text('Simpan'))
            ],
          ),
        ));
  }
}
