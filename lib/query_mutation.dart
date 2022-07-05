import 'dart:math';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_app/GraphQlConfiguration.dart';

class QueryAndMutation {
  String queryData = "";
  String name, phone, email, password, otp, token;
  //final String otp = "";
  //final String token = "";
  QueryAndMutation({
    this.name = "",
    this.phone = "",
    this.email = "",
    this.password = "",
    this.otp = "",
    this.token = "",
  });

  String getUser = """
mutation mobile{
  VerifyMobile(input:
    {mobilenumber:"7488397609",
      otp:9980}){
    id}
  
}
""";

  String AddUser = """

mutation CreateUser (\$name:String!,\$phone:String!,\$email:String!,\$password:String!){
  CreateUser(input:
    {name:\$name,
    phone: \$phone,
    email:\$email,
    password:\$password
    })
  {
    token,
    otp
  }
}
""";

  Future<QueryResult> addUser({
    String? name,
    String? phone,
    String? email,
    String? password,
  }) async {
    final variable = {
      'name': name,
      'phone': phone,
      'email': email,
      'password': password
    };

    GraphQLConfiguration configuration = GraphQLConfiguration();
    GraphQLClient client = configuration.clientToQuery();

    QueryResult queryResult = await client.query(
      QueryOptions(document: gql(AddUser), variables: variable),
    );
    print(queryResult.data);
    print(queryResult);
    print("addUser data");
    //print("===========$name$phone$email$password");
    //print(name);

    return queryResult;
  }

  String verifyMobile = """ 
mutation mobile(\$mobilenumber:String!,\$otp:Float!){
  VerifyMobile(input:
    {
      mobilenumber:\$mobilenumber,
      otp:\$otp
      })
      {
        id,
      }
  
}
""";
  Future<QueryResult> verifyUser({String? phone, String? otp}) async {
    final variable = {'mobilenumber': phone, 'otp': double.parse(otp!)};

    GraphQLConfiguration configuration = GraphQLConfiguration();
    GraphQLClient client = configuration.clientToQuery();

    QueryResult queryResult = await client.query(
      QueryOptions(document: gql(verifyMobile), variables: variable),
    );
    print(queryResult.data);
    print(queryResult);
    print("verify mobile data");
    return queryResult;
  }

  showData() {
    return queryData;
  }

  String authenticate = """ 
mutation AuthenticateUser(\$emailOrPhone:String!,\$password:String!){
  Authenticate(input:
    {
      emailOrPhone:\$emailOrPhone,
      password:\$password
    }
  )
  {
    token,
  }
}
""";

  Future<QueryResult> authenticateUser(
      {String? phone, String? password}) async {
    final variable = {'emailOrPhone': phone, 'password': password};
    GraphQLConfiguration configuration = GraphQLConfiguration();
    GraphQLClient client = configuration.clientToQuery();

    QueryResult queryResult = await client.query(
      QueryOptions(document: gql(authenticate), variables: variable),
    );
    print(queryResult.data);
    print(queryResult);
    print("authenticate user data");
    return queryResult;
  }
}
