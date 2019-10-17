import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import '../example/lib/main.dart';
import 'package:image_test_utils/image_test_utils.dart';

void main() {
  testWidgets('Check Portrait Dialog test', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(new MyApp());

      expect(find.byKey(keys[0]), findsOneWidget);

      await tester.tap(find.byKey(keys[0]));
      await tester.pump();

      expect(find.byKey(keys[1]), findsOneWidget);

      await tester.tap(find.text('Cancel'));
      await tester.pump();

      expect(find.byKey(keys[2]), findsOneWidget);

      await tester.tap(find.byKey(keys[2]));
      await tester.pump();

      expect(find.byKey(keys[3]), findsOneWidget);

      await tester.tap(find.text('Cancel'));
      await tester.pump();

      expect(find.byKey(keys[4]), findsOneWidget);

      await tester.tap(find.byKey(keys[4]));
      await tester.pump();

      expect(find.byKey(keys[5]), findsOneWidget);
    });
  });

  testWidgets('Check Landscape Dialog test', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(new MyApp());

      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ]);

      expect(find.byKey(keys[0]), findsOneWidget);

      await tester.tap(find.byKey(keys[0]));
      await tester.pump();

      expect(find.byKey(keys[1]), findsOneWidget);

      await tester.tap(find.text('Cancel'));
      await tester.pump();

      expect(find.byKey(keys[2]), findsOneWidget);

      await tester.tap(find.byKey(keys[2]));
      await tester.pump();

      expect(find.byKey(keys[3]), findsOneWidget);

      await tester.tap(find.text('Cancel'));
      await tester.pump();

      expect(find.byKey(keys[4]), findsOneWidget);

      await tester.tap(find.byKey(keys[4]));
      await tester.pump();

      expect(find.byKey(keys[5]), findsOneWidget);
    });
  });
}
