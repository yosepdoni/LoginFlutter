import 'dart:convert';

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:login/home.dart';
// ignore: depend_on_referenced_packages
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // ignore: non_constant_identifier_names
  TextEditingController UsernameController = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController PasswordControler = TextEditingController();

  Future<void> _login() async {
    var url = Uri.parse("linkapi");
    var response = await http.post(url, body: {
      "username": UsernameController.text,
      "password": PasswordControler.text
    });

    var datauser = jsonDecode(response.body);

    if (datauser != '') {
      Fluttertoast.showToast(
          msg: "Login Succes",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      // ignore: use_build_context_synchronously
      Navigator.push<void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const HomePage(),
        ),
      );
    } else {
      Fluttertoast.showToast(
          msg: "Login Failed",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(8),
        color: const Color.fromARGB(255, 226, 229, 231),
        child: Column(
          // key: _formKey,
          children: [
            Column(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                      color: Colors.black87, shape: BoxShape.circle),
                  child: const Center(
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Selamat Datang, Silahkan Masuk',
              style: TextStyle(fontSize: 20, color: Colors.black87),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: UsernameController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87)),
                  prefixIcon: Icon(
                    Icons.person,
                    size: 30,
                    color: Colors.black,
                  ),
                  hintText: 'Masukan Email',
                  hintStyle: TextStyle(color: Colors.black87),
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.black87)),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: PasswordControler,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black87)),
                prefixIcon: Icon(
                  Icons.lock,
                  size: 30,
                  color: Colors.black,
                ),
                hintText: 'Masukan Password',
                hintStyle: TextStyle(color: Colors.black87),
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.black87),
                suffixIcon: Icon(
                  Icons.remove_red_eye,
                  size: 25,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Card(
              color: Colors.black87,
              elevation: 5,
              child: SizedBox(
                height: 50,
                child: InkWell(
                  splashColor: Colors.white,
                  onTap: () {
                    // print('tombol login');
                    _login();
                  },
                  child: const Center(
                    child: Text(
                      'Log In',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
