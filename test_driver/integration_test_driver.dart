
import 'dart:io';

import 'package:integration_test/integration_test_driver_extended.dart';

Future<void> main() async {
  try {
    await integrationDriver(
      //driver: driver,
      onScreenshot:
          (String screenshotName, List<int> screenshotBytes) async {
        print('Screenshot requested: $screenshotName');
        final File image =
        await File('screenshots/$screenshotName.png').create(recursive: true);
        if (image.existsSync()) {
          image.writeAsBytesSync(screenshotBytes);
        }

        return true;
      },
    );
  } catch (e) {
    print('Error occurred from Integration test Driver');
    rethrow;
  }

}

