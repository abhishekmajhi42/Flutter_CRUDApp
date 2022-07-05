import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:flutter/material.dart';

import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLConfiguration {
//static HttpLink httpLink = HttpLink("https://examplegraphql.herokuapp.com/graphql");
  static HttpLink httpLink = HttpLink(
      "http://humapp-env.eba-5psj3xci.ap-south-1.elasticbeanstalk.com/graphql");

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: httpLink,

//cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
      cache: GraphQLCache(store: InMemoryStore()),
    ),
  );

  GraphQLClient clientToQuery() {
    return GraphQLClient(
      cache: GraphQLCache(store: InMemoryStore()),
      link: httpLink,
    );
  }
}
