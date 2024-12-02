import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'handy_sdk_method_channel.dart';

abstract class HandySdkPlatform extends PlatformInterface {
  /// Constructs a HandySdkPlatform.
  HandySdkPlatform() : super(token: _token);

  static final Object _token = Object();

  static HandySdkPlatform _instance = MethodChannelHandySdk();

  /// The default instance of [HandySdkPlatform] to use.
  ///
  /// Defaults to [MethodChannelHandySdk].
  static HandySdkPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [HandySdkPlatform] when
  /// they register themselves.
  static set instance(HandySdkPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
