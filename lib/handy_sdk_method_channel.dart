import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'handy_sdk_platform_interface.dart';

/// An implementation of [HandySdkPlatform] that uses method channels.
class MethodChannelHandySdk extends HandySdkPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('handy_sdk');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
