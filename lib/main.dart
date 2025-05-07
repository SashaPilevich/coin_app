import 'package:core/core.dart';

import 'main_common.dart';

void main() async {
  await mainCommon(
    Flavor.fromString(
      const String.fromEnvironment('environment', defaultValue: 'dev'),
    ),
  );
}
