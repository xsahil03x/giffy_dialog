import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import '../example/lib/main.dart';
import 'package:image_test_utils/image_test_utils.dart';

const double PORTRAIT_WIDTH = 1800.0;
const double PORTRAIT_HEIGHT = 2400.0;
const double LANDSCAPE_WIDTH = 2400.0;
const double LANDSCAPE_HEIGHT = 1800.0;

void main() {
  group('Dialog Assertion Test', () {
    testWidgets(
        'AssetGiffyDialog throws if initialized with null image and title',
            (WidgetTester tester) async {
          try {
            await tester.pumpWidget(AssetGiffyDialog(
              onOkButtonPressed: () {},
              image: null,
              title: null,
            ));
          } catch (error) {
            expect(error, isAssertionError);
          }
        });

    testWidgets(
        'FlareGiffyDialog throws if initialized with null flarePath, flareAnimation and title',
            (WidgetTester tester) async {
          try {
            await tester.pumpWidget(FlareGiffyDialog(
              onOkButtonPressed: () {},
              flarePath: null,
              title: null,
              flareAnimation: null,
            ));
          } catch (error) {
            expect(error, isAssertionError);
          }
        });

    testWidgets(
        'NetworkGiffyDialog throws if initialized with null image and title',
            (WidgetTester tester) async {
          try {
            await tester.pumpWidget(NetworkGiffyDialog(
              onOkButtonPressed: () {},
              image: null,
              title: null,
            ));
          } catch (error) {
            expect(error, isAssertionError);
          }
        });
  });

  group('Dialog Smoke and Orientation Test', () {
    testWidgets('Check Portrait Dialog test', (WidgetTester tester) async {
      provideMockedNetworkImages(() async {
        final TestWidgetsFlutterBinding binding =
        TestWidgetsFlutterBinding.ensureInitialized();
        binding.window.physicalSizeTestValue =
        (Size(PORTRAIT_WIDTH, PORTRAIT_HEIGHT));

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
        binding.window.physicalSizeTestValue =
            Size(LANDSCAPE_WIDTH, LANDSCAPE_HEIGHT);

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
  });
}
