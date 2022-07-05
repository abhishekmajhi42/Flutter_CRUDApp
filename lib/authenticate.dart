import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app/query_mutation.dart';
import 'package:flutter_app/GraphQlConfiguration.dart';
import 'package:flutter_app/userInfo.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class AuthenticateUser extends StatefulWidget {
  const AuthenticateUser({Key? key}) : super(key: key);

  @override
  State<AuthenticateUser> createState() => _AuthenticateUserState();
}

class _AuthenticateUserState extends State<AuthenticateUser> {
  TextEditingController phoneController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  String phone = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Authentication"),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'mutation_page',
            child: Text(
              'Next',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              userScreen();
            },
          ),
        ],
      ),
      body: Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        TextField(
          decoration: const InputDecoration(
              labelText: "Enter Email or Phone", hintText: "Enter email/phone"),
          controller: phoneController,
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          decoration: const InputDecoration(
              labelText: "Enter Password", hintText: "Enter Password"),
          controller: passwordController,
        ),
        const SizedBox(
          height: 40,
        ),
        ElevatedButton(
            onPressed: () {
              authenticate();
            },
            child: const Text("Authenticate")),
      ])),
    );
  }

  authenticate() {
    String phone = "";
    String password = "";

    QueryAndMutation utils = QueryAndMutation(phone: phone, password: password);
    utils.authenticateUser(phone: phone, password: password);
    print("Inside authenticate user");
  }

  userScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const UserInfo()),
    );
  }
}
