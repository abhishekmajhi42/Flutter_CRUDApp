import 'package:flutter/material.dart';

import 'package:flutter_app/query_mutation.dart';
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
      body: Card(
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
            height: 10,
          ),
          Mutation(
              options: MutationOptions(
                /// Insert mutation here
                documentNode: gql(QueryAndMutation().AddUser),

                /// Tell the GraphQL client to fetch the data from
                /// the network only and don't cache it
                fetchPolicy: FetchPolicy.noCache,

                /// Whenever the [Form] closes, this tells the previous [route]
                /// whether it needs to rebuild itself or not
                onCompleted: (data)  {
                  //Navigator.pop(context, data != null)
                  print(data);
                },
              ),
              builder: (
                RunMutation runMutation,
                QueryResult result,
              ) {
                return Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          runMutation({
                            'name': nameController.text,
                            'phone': phoneController.text,
                            'email': emailController.text,
                            'password': passwordController.text,
                          });
                        },
                        child: const Text("SAVE")),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                );
              })
        ],
      )),
    );
  }
}
