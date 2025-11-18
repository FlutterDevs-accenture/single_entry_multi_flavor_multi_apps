// lib/core/behavior/app_behavior.dart
import '../../utils/api_client.dart';
import '../di/di.dart';

abstract class AppBehavior {
  Future<void> login(String email, String password);
  Future<void> signup(String email, String password);
}

class JciBehavior implements AppBehavior {
  ApiClient get _api => getIt<ApiClient>();

  @override
  Future<void> login(String email, String password) async {
    final res = await _api.login(email, password);
    print('Travel login: ${res.data}');
  }

  @override
  Future<void> signup(String email, String password) async {
    final res = await _api.signup(email, password);
    print('Travel signup: ${res.data}');
  }
}

class AccentureBehavior implements AppBehavior {

  ApiClient get _api => getIt<ApiClient>();

  @override
  Future<void> login(String email, String password) async {
    final res = await _api.login(email, password);
    print('Foodie login: ${res.data}');
  }

  @override
  Future<void> signup(String email, String password) async {
    final res = await _api.signup(email, password);
    print('Foodie signup: ${res.data}');
  }
}




