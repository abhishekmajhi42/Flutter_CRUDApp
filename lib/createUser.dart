import 'package:flutter/material.dart';
import 'package:flutter_app/authenticate.dart';
import 'package:flutter_app/query_mutation.dart';
import 'package:flutter_app/verifyMobile.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({Key? key}) : super(key: key);

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  String name = "";
  String phone = "";
  String email = "";
  String psssword = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create User"),
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            decoration: const InputDecoration(
                labelText: "Enter Name", hintText: "Enter name"),
            controller: nameController,
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            decoration: const InputDecoration(
                labelText: "Enter Phone", hintText: "Enter phone"),
            controller: phoneController,
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            decoration: const InputDecoration(
                labelText: "Enter Email", hintText: "Enter email"),
            controller: emailController,
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            decoration: const InputDecoration(
                labelText: "Enter Password", hintText: "Enter password"),
            controller: passwordController,
          ),
          const SizedBox(
            height: 40,
          ),
          FloatingActionButton(
              onPressed: () {
                sendData(
                  name: nameController.text,
                  phone: phoneController.text,
                  email: emailController.text,
                  password: passwordController.text,
                );
                /* runMutation({
                            'name': nameController.text,
                            'phone': phoneController.text,
                            'email': emailController.text,
                            'password': passwordController.text,
                          });*/
              },
              child: const Text("SAVE")),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                verifyScreen();
              },
              child: const Text("NEXT")),
        ],
      )),
    );
  }

  sendData({
    String? name,
    String? phone,
    String? email,
    String? password,
  }) {
    QueryAndMutation utils = QueryAndMutation(
        name: name!, phone: phone!, email: email!, password: password!);
    utils.addUser(
        name: name, phone: phone, email: email, password: password);
    print("Inside send data");
    print("========${nameController.text}$phone$email$password");
  }

  verifyScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const VerifyMobile()),
    );
  }
}
