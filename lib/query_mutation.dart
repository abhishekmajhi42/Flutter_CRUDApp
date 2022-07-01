class QueryAndMutation {
  String getUser = """...""";

  String AddUser = """"

mutation CreateUser (\$name:String!,\$phone:String!,\$email:String!,\$password:String!,){
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
}

String verifyMobile = """ 
mutation mobile(\$mobilenumber:String!,\$otp:Float!){
  VerifyMobile(input:
    {
      mobilenumber:\$mobile,
      otp:9980
      })
      {
        id,
      }
  
}
""";

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