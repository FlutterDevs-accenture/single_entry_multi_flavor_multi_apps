// lib/core/di.dart
import 'package:get_it/get_it.dart';
import '../app_config.dart';
import '../behavior/app_behavior.dart';
import '../../utils/api_client.dart';

final getIt = GetIt.instance;

void setupDI(AppConfig config, AppBehavior behavior) {
  if (getIt.isRegistered<AppConfig>()) getIt.unregister<AppConfig>();
  if (getIt.isRegistered<ApiClient>()) getIt.unregister<ApiClient>();
  if (getIt.isRegistered<AppBehavior>()) getIt.unregister<AppBehavior>();

  // Register everything
  getIt.registerSingleton<AppConfig>(config);
  getIt.registerSingleton<ApiClient>(ApiClient(config));
  getIt.registerSingleton<AppBehavior>(behavior);
}