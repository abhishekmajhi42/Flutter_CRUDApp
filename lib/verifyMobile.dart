import 'package:flutter/material.dart';

import 'package:flutter_app/query_mutation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({Key? key}) : super(key: key);

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  
  TextEditingController phoneController = new TextEditingController();
  TextEditingController otpController = new TextEditingController();
  
  String phone = "";
  String otp = "";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verify Mobile"),
      ),
      body: Card(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
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
                labelText: "Enter OTP", hintText: "Enter OTP"),
            controller: otpController,
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
                            
                            'phone': phoneController.text,
                            'otp': otpController.text,
                            
                          });
                        },
                        child: const Text("Verify")),
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
