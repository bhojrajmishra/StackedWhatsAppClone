import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigService {
  static Future<void> initialize(FirebaseRemoteConfig remoteConfig) async {
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(hours: 1),
    ));

    await remoteConfig.setDefaults({
      'welcome_message': 'Welcome to WhatsApp Clone!',
      // Add other default values here
    });

    try {
      await remoteConfig.fetchAndActivate();
    } catch (e) {
      print('Error fetching remote config: $e');
    }
  }

  static String getWelcomeMessage(FirebaseRemoteConfig remoteConfig) {
    return remoteConfig.getString('welcome_message');
  }

  // Add other methods to get different config values as needed
}
