import 'package:flutter_test/flutter_test.dart';
import 'package:handy_sdk/handy_sdk.dart';
import 'package:handy_sdk/handy_sdk_platform_interface.dart';
import 'package:handy_sdk/handy_sdk_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockHandySdkPlatform
    with MockPlatformInterfaceMixin
    implements HandySdkPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final HandySdkPlatform initialPlatform = HandySdkPlatform.instance;

  test('$MethodChannelHandySdk is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelHandySdk>());
  });

  test('getPlatformVersion', () async {
    HandySdk handySdkPlugin = HandySdk();
    MockHandySdkPlatform fakePlatform = MockHandySdkPlatform();
    HandySdkPlatform.instance = fakePlatform;

    expect(await handySdkPlugin.getPlatformVersion(), '42');
  });
}
