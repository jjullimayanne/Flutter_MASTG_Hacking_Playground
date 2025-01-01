import 'package:flutter_uncrackable/core/routes/routes_constants.dart';

class GetRouteByIdUsecase {
  String? call(String challengeId) {
    const routeMapping = {
      'challenge1': RouteNames.challenge1,
      'challenge2': RouteNames.challenge2,
    };

    return routeMapping[challengeId];
  }
}
