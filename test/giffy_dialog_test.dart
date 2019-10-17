import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import '../example/lib/main.dart';
import 'package:image_test_utils/image_test_utils.dart';

const double PORTRAIT_WIDTH = 600.0;
const double PORTRAIT_HEIGHT = 800.0;
const double LANDSCAPE_WIDTH = 800.0;
const double LANDSCAPE_HEIGHT = 600.0;

void main() {
  testWidgets('Check Portrait Dialog test', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();
      await binding.setSurfaceSize(Size(PORTRAIT_WIDTH, PORTRAIT_HEIGHT));

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
      final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();
      await binding.setSurfaceSize(Size(LANDSCAPE_WIDTH, LANDSCAPE_HEIGHT));

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
}
