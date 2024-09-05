import 'package:flutter_test/flutter_test.dart';
import 'package:whats_app_clone/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('RegistrationServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
