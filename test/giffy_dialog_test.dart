import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:giffy_dialog/giffy_dialog.dart';

MaterialApp _buildAppWithDialog(
  Widget dialog, {
  ThemeData? theme,
  double textScaleFactor = 1.0,
}) {
  return MaterialApp(
    theme: theme,
    home: Material(
      child: Builder(
        builder: (BuildContext context) {
          return Center(
            child: ElevatedButton(
              child: const Text('X'),
              onPressed: () {
                showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return MediaQuery.withClampedTextScaling(
                      minScaleFactor: textScaleFactor,
                      maxScaleFactor: textScaleFactor,
                      child: dialog,
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    ),
  );
}

Material _getMaterialFromDialog(WidgetTester tester) {
  return tester.widget<Material>(find.descendant(
      of: find.byType(Dialog), matching: find.byType(Material)));
}

RenderParagraph _getTextRenderObjectFromDialog(
    WidgetTester tester, String text) {
  return tester
      .element<StatelessElement>(
          find.descendant(of: find.byType(Dialog), matching: find.text(text)))
      .renderObject! as RenderParagraph;
}

// GiffyDialog's ButtonBar a Padding widget with an OverflowBar child.
Finder _findButtonBar() {
  return find
      .ancestor(of: find.byType(OverflowBar), matching: find.byType(Padding))
      .first;
}

const ShapeBorder _defaultM2DialogShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(4.0)));
final ShapeBorder _defaultM3DialogShape =
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(28.0));

void main() {
  final ThemeData material3Theme =
      ThemeData(useMaterial3: true, brightness: Brightness.dark);
  final ThemeData material2Theme =
      ThemeData(useMaterial3: false, brightness: Brightness.dark);

  testWidgets('GiffyDialog is scrollable', (WidgetTester tester) async {
    bool didPressOk = false;
    final GiffyDialog dialog = GiffyDialog(
      giffy: const SizedBox(),
      content: Container(
        height: 5000.0,
        width: 300.0,
        color: Colors.green[500],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            didPressOk = true;
          },
          child: const Text('OK'),
        ),
      ],
    );
    await tester.pumpWidget(_buildAppWithDialog(dialog));

    await tester.tap(find.text('X'));
    await tester.pumpAndSettle();

    expect(didPressOk, false);
    await tester.tap(find.text('OK'));
    expect(didPressOk, true);
  });

  testWidgets('GiffyDialog background color', (WidgetTester tester) async {
    const Color customColor = Colors.pink;
    const GiffyDialog dialog = GiffyDialog(
      giffy: Icon(Icons.ac_unit),
      backgroundColor: customColor,
      actions: <Widget>[],
    );
    await tester.pumpWidget(_buildAppWithDialog(dialog,
        theme: ThemeData(brightness: Brightness.dark)));

    await tester.tap(find.text('X'));
    await tester.pumpAndSettle();

    final Material materialWidget = _getMaterialFromDialog(tester);
    expect(materialWidget.color, customColor);
  });

  testWidgets('GiffyDialog Defaults', (WidgetTester tester) async {
    const GiffyDialog dialog = GiffyDialog(
      giffy: Icon(Icons.ac_unit),
      title: Text('Title'),
      content: Text('Y'),
      actions: <Widget>[],
    );
    await tester.pumpWidget(_buildAppWithDialog(dialog, theme: material2Theme));

    await tester.tap(find.text('X'));
    await tester.pumpAndSettle();

    final Material materialWidget = _getMaterialFromDialog(tester);
    expect(materialWidget.color, Colors.grey[800]);
    expect(materialWidget.shape, _defaultM2DialogShape);
    expect(materialWidget.elevation, 24.0);

    final Offset bottomLeft = tester.getBottomLeft(
      find.descendant(of: find.byType(Dialog), matching: find.byType(Material)),
    );
    expect(bottomLeft.dy, 380.0);

    await tester.tapAt(const Offset(10.0, 10.0));
    await tester.pumpAndSettle();

    await tester.pumpWidget(_buildAppWithDialog(dialog, theme: material3Theme));

    await tester.tap(find.text('X'));
    await tester.pumpAndSettle();

    final Material material3Widget = _getMaterialFromDialog(tester);
    expect(material3Widget.color, material3Theme.colorScheme.surface);
    expect(material3Widget.shape, _defaultM3DialogShape);
    expect(material3Widget.elevation, 6.0);
  });

  testWidgets('Custom giffyDialog elevation', (WidgetTester tester) async {
    const double customElevation = 12.0;
    const Color shadowColor = Color(0xFF000001);
    const Color surfaceTintColor = Color(0xFF000002);
    const GiffyDialog dialog = GiffyDialog(
      giffy: Icon(Icons.ac_unit),
      actions: <Widget>[],
      elevation: customElevation,
      shadowColor: shadowColor,
      surfaceTintColor: surfaceTintColor,
    );
    await tester.pumpWidget(_buildAppWithDialog(dialog));

    await tester.tap(find.text('X'));
    await tester.pumpAndSettle();

    final Material materialWidget = _getMaterialFromDialog(tester);
    expect(materialWidget.elevation, customElevation);
    expect(materialWidget.shadowColor, shadowColor);
    expect(materialWidget.surfaceTintColor, surfaceTintColor);
  });

  testWidgets('Custom Title Text Style', (WidgetTester tester) async {
    const String titleText = 'Title';
    const TextStyle titleTextStyle = TextStyle(color: Colors.pink);
    const GiffyDialog dialog = GiffyDialog(
      giffy: Icon(Icons.ac_unit),
      title: Text(titleText),
      titleTextStyle: titleTextStyle,
      actions: <Widget>[],
    );
    await tester.pumpWidget(_buildAppWithDialog(dialog));

    await tester.tap(find.text('X'));
    await tester.pumpAndSettle();

    final RenderParagraph title =
        _getTextRenderObjectFromDialog(tester, titleText);
    expect(title.text.style, titleTextStyle);
  });

  testWidgets('Custom Content Text Style', (WidgetTester tester) async {
    const String contentText = 'Content';
    const TextStyle contentTextStyle = TextStyle(color: Colors.pink);
    const GiffyDialog dialog = GiffyDialog(
      giffy: Icon(Icons.ac_unit),
      content: Text(contentText),
      contentTextStyle: contentTextStyle,
      actions: <Widget>[],
    );
    await tester.pumpWidget(_buildAppWithDialog(dialog));

    await tester.tap(find.text('X'));
    await tester.pumpAndSettle();

    final RenderParagraph content =
        _getTextRenderObjectFromDialog(tester, contentText);
    expect(content.text.style, contentTextStyle);
  });

  testWidgets('GiffyDialog custom clipBehavior', (WidgetTester tester) async {
    const GiffyDialog dialog = GiffyDialog(
      giffy: Icon(Icons.ac_unit),
      actions: <Widget>[],
      clipBehavior: Clip.antiAlias,
    );
    await tester.pumpWidget(_buildAppWithDialog(dialog));

    await tester.tap(find.text('X'));
    await tester.pumpAndSettle();

    final Material materialWidget = _getMaterialFromDialog(tester);
    expect(materialWidget.clipBehavior, Clip.antiAlias);
  });

  testWidgets('Custom giffyDialog shape', (WidgetTester tester) async {
    const RoundedRectangleBorder customBorder = RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.0)));
    const GiffyDialog dialog = GiffyDialog(
      giffy: Icon(Icons.ac_unit),
      actions: <Widget>[],
      shape: customBorder,
    );
    await tester.pumpWidget(_buildAppWithDialog(dialog));

    await tester.tap(find.text('X'));
    await tester.pumpAndSettle();

    final Material materialWidget = _getMaterialFromDialog(tester);
    expect(materialWidget.shape, customBorder);
  });

  testWidgets('Null giffyDialog shape', (WidgetTester tester) async {
    final ThemeData theme = ThemeData();
    const GiffyDialog dialog = GiffyDialog(
      giffy: Icon(Icons.ac_unit),
      actions: <Widget>[],
    );
    await tester.pumpWidget(_buildAppWithDialog(dialog, theme: theme));

    await tester.tap(find.text('X'));
    await tester.pumpAndSettle();

    final Material materialWidget = _getMaterialFromDialog(tester);
    expect(
      materialWidget.shape,
      theme.useMaterial3 ? _defaultM3DialogShape : _defaultM2DialogShape,
    );
  });

  testWidgets('Rectangular giffyDialog shape', (WidgetTester tester) async {
    const ShapeBorder customBorder = Border();
    const GiffyDialog dialog = GiffyDialog(
      giffy: Icon(Icons.ac_unit),
      actions: <Widget>[],
      shape: customBorder,
    );
    await tester.pumpWidget(_buildAppWithDialog(dialog));

    await tester.tap(find.text('X'));
    await tester.pumpAndSettle();

    final Material materialWidget = _getMaterialFromDialog(tester);
    expect(materialWidget.shape, customBorder);
  });

  testWidgets('Custom giffyDialog alignment', (WidgetTester tester) async {
    const GiffyDialog dialog = GiffyDialog(
      giffy: Icon(Icons.ac_unit),
      actions: <Widget>[],
      alignment: Alignment.bottomLeft,
    );
    await tester.pumpWidget(_buildAppWithDialog(dialog));

    await tester.tap(find.text('X'));
    await tester.pumpAndSettle();

    final Offset bottomLeft = tester.getBottomLeft(
      find.descendant(of: find.byType(Dialog), matching: find.byType(Material)),
    );
    expect(bottomLeft.dx, 40.0);
    expect(bottomLeft.dy, 576.0);
  });

  testWidgets('GiffyDialog.actionsPadding defaults',
      (WidgetTester tester) async {
    final GiffyDialog dialog = GiffyDialog(
      giffy: const SizedBox(),
      title: const Text('title'),
      content: const Text('content'),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {},
          child: const Text('button'),
        ),
      ],
    );

    await tester.pumpWidget(
      _buildAppWithDialog(dialog),
    );

    await tester.tap(find.text('X'));
    await tester.pumpAndSettle();

    // The [GiffyDialog] is the entire screen, since it also contains the scrim.
    // The first [Material] child of [GiffyDialog] is the actual dialog
    // itself.
    final Size dialogSize = tester.getSize(
      find
          .descendant(
            of: find.byType(GiffyDialog),
            matching: find.byType(Material),
          )
          .first,
    );
    final Size actionsSize = tester.getSize(_findButtonBar());

    expect(actionsSize.width, dialogSize.width);
  });

  testWidgets('GiffyDialog.actionsPadding surrounds actions with padding',
      (WidgetTester tester) async {
    final GiffyDialog dialog = GiffyDialog(
      giffy: const SizedBox(),
      title: const Text('title'),
      content: const Text('content'),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {},
          child: const Text('button'),
        ),
      ],
      // The OverflowBar is inset by the buttonPadding/2 + actionsPadding
      buttonPadding: EdgeInsets.zero,
      actionsPadding: const EdgeInsets.all(30.0), // custom padding value
    );

    await tester.pumpWidget(
      _buildAppWithDialog(dialog),
    );

    await tester.tap(find.text('X'));
    await tester.pumpAndSettle();

    // The [GiffyDialog] is the entire screen, since it also contains the scrim.
    // The first [Material] child of [GiffyDialog] is the actual dialog
    // itself.
    final Size dialogSize = tester.getSize(
      find
          .descendant(
            of: find.byType(GiffyDialog),
            matching: find.byType(Material),
          )
          .first,
    );
    final Size actionsSize = tester.getSize(find.byType(OverflowBar));

    expect(actionsSize.width, dialogSize.width - (30.0 * 2));
  });

  testWidgets('GiffyDialog.buttonPadding defaults',
      (WidgetTester tester) async {
    final GlobalKey key1 = GlobalKey();
    final GlobalKey key2 = GlobalKey();

    final GiffyDialog dialog = GiffyDialog(
      giffy: const SizedBox(),
      title: const Text('title'),
      content: const Text('content'),
      actions: <Widget>[
        ElevatedButton(
          key: key1,
          onPressed: () {},
          child: const Text('button 1'),
        ),
        ElevatedButton(
          key: key2,
          onPressed: () {},
          child: const Text('button 2'),
        ),
      ],
    );

    await tester.pumpWidget(_buildAppWithDialog(dialog, theme: material2Theme));

    await tester.tap(find.text('X'));
    await tester.pumpAndSettle();

    // Padding between both buttons
    expect(
      tester.getBottomLeft(find.byKey(key2)).dx,
      tester.getBottomRight(find.byKey(key1)).dx + 8.0,
    );

    // Padding between button and edges of the button bar
    // First button
    expect(
      tester.getTopRight(find.byKey(key1)).dy,
      tester.getTopRight(_findButtonBar()).dy + 8.0,
    ); // top
    expect(
      tester.getBottomRight(find.byKey(key1)).dy,
      tester.getBottomRight(_findButtonBar()).dy - 8.0,
    ); // bottom

    // Second button
    expect(
      tester.getTopRight(find.byKey(key2)).dy,
      tester.getTopRight(_findButtonBar()).dy + 8.0,
    ); // top
    expect(
      tester.getBottomRight(find.byKey(key2)).dy,
      tester.getBottomRight(_findButtonBar()).dy - 8.0,
    ); // bottom
    expect(
      tester.getBottomRight(find.byKey(key2)).dx,
      tester.getBottomRight(_findButtonBar()).dx - 8.0,
    ); // right

    // Dismiss it and test material 3 dialog
    await tester.tapAt(const Offset(10.0, 10.0));
    await tester.pumpAndSettle();

    await tester.pumpWidget(_buildAppWithDialog(dialog, theme: material3Theme));

    await tester.tap(find.text('X'));
    await tester.pumpAndSettle();

    // Padding between both buttons
    expect(
      tester.getBottomLeft(find.byKey(key2)).dx,
      tester.getBottomRight(find.byKey(key1)).dx + 8.0,
    );

    // Padding between button and edges of the button bar
    // First button
    expect(
      tester.getTopRight(find.byKey(key1)).dy,
      tester.getTopRight(_findButtonBar()).dy,
    ); // top
    expect(
      tester.getBottomRight(find.byKey(key1)).dy,
      tester.getBottomRight(_findButtonBar()).dy - 24.0,
    ); // bottom

    // // Second button
    expect(
      tester.getTopRight(find.byKey(key2)).dy,
      tester.getTopRight(_findButtonBar()).dy,
    ); // top
    expect(
      tester.getBottomRight(find.byKey(key2)).dy,
      tester.getBottomRight(_findButtonBar()).dy - 24.0,
    ); // bottom
    expect(
      tester.getBottomRight(find.byKey(key2)).dx,
      tester.getBottomRight(_findButtonBar()).dx - 24.0,
    ); // right
  });

  testWidgets('GiffyDialog.buttonPadding custom values',
      (WidgetTester tester) async {
    final GlobalKey key1 = GlobalKey();
    final GlobalKey key2 = GlobalKey();

    final GiffyDialog dialog = GiffyDialog(
      giffy: const SizedBox(),
      title: const Text('title'),
      content: const Text('content'),
      actions: <Widget>[
        ElevatedButton(
          key: key1,
          onPressed: () {},
          child: const Text('button 1'),
        ),
        ElevatedButton(
          key: key2,
          onPressed: () {},
          child: const Text('button 2'),
        ),
      ],
      buttonPadding: const EdgeInsets.only(
        left: 10.0,
        right: 20.0,
      ),
    );

    await tester.pumpWidget(
      _buildAppWithDialog(dialog, theme: ThemeData(useMaterial3: false)),
    );

    await tester.tap(find.text('X'));
    await tester.pumpAndSettle();

    // Padding between both buttons
    expect(
      tester.getBottomLeft(find.byKey(key2)).dx,
      tester.getBottomRight(find.byKey(key1)).dx + ((10.0 + 20.0) / 2),
    );

    // Padding between button and edges of the button bar
    // First button
    expect(
      tester.getTopRight(find.byKey(key1)).dy,
      tester.getTopRight(_findButtonBar()).dy + ((10.0 + 20.0) / 2),
    ); // top
    expect(
      tester.getBottomRight(find.byKey(key1)).dy,
      tester.getBottomRight(_findButtonBar()).dy - ((10.0 + 20.0) / 2),
    ); // bottom

    // Second button
    expect(
      tester.getTopRight(find.byKey(key2)).dy,
      tester.getTopRight(_findButtonBar()).dy + ((10.0 + 20.0) / 2),
    ); // top
    expect(
      tester.getBottomRight(find.byKey(key2)).dy,
      tester.getBottomRight(_findButtonBar()).dy - ((10.0 + 20.0) / 2),
    ); // bottom
    expect(
      tester.getBottomRight(find.byKey(key2)).dx,
      tester.getBottomRight(_findButtonBar()).dx - ((10.0 + 20.0) / 2),
    ); // right
  });

  group(
    'Dialog children padding is correct',
    () {
      final List<double> textScaleFactors = <double>[0.5, 1.0, 1.5, 2.0, 3.0];
      final Map<double, double> paddingScaleFactors = <double, double>{
        0.5: 1.0,
        1.0: 1.0,
        1.5: 2.0 / 3.0,
        2.0: 1.0 / 3.0,
        3.0: 1.0 / 3.0,
      };

      final GlobalKey giffyKey = GlobalKey();
      final GlobalKey titleKey = GlobalKey();
      final GlobalKey contentKey = GlobalKey();

      final Finder dialogFinder = find
          .descendant(of: find.byType(Dialog), matching: find.byType(Material))
          .first;
      final Finder giffyFinder = find.byKey(giffyKey);
      final Finder titleFinder = find.byKey(titleKey);
      final Finder contentFinder = find.byKey(contentKey);
      final Finder actionsFinder = _findButtonBar();

      Future<void> openDialog(
          WidgetTester tester, Widget dialog, double textScaleFactor,
          {bool isM3 = false}) async {
        await tester.pumpWidget(
          _buildAppWithDialog(dialog,
              textScaleFactor: textScaleFactor,
              theme: ThemeData(useMaterial3: isM3)),
        );

        await tester.tap(find.text('X'));
        await tester.pumpAndSettle();
      }

      void expectLeftEdgePadding(
        WidgetTester tester, {
        required Finder finder,
        required double textScaleFactor,
        required double unscaledValue,
      }) {
        expect(
          tester.getTopLeft(dialogFinder).dx,
          moreOrLessEquals(tester.getTopLeft(finder).dx -
              unscaledValue * paddingScaleFactors[textScaleFactor]!),
        );
        expect(
          tester.getBottomLeft(dialogFinder).dx,
          moreOrLessEquals(tester.getBottomLeft(finder).dx -
              unscaledValue * paddingScaleFactors[textScaleFactor]!),
        );
      }

      void expectRightEdgePadding(
        WidgetTester tester, {
        required Finder finder,
        required double textScaleFactor,
        required double unscaledValue,
      }) {
        expect(
          tester.getTopRight(dialogFinder).dx,
          moreOrLessEquals(tester.getTopRight(finder).dx +
              unscaledValue * paddingScaleFactors[textScaleFactor]!),
        );
        expect(
          tester.getBottomRight(dialogFinder).dx,
          moreOrLessEquals(tester.getBottomRight(finder).dx +
              unscaledValue * paddingScaleFactors[textScaleFactor]!),
        );
      }

      void expectTopEdgePadding(
        WidgetTester tester, {
        required Finder finder,
        double textScaleFactor = 1.0,
        required double unscaledValue,
      }) {
        expect(
          tester.getTopLeft(dialogFinder).dy,
          moreOrLessEquals(tester.getTopLeft(finder).dy -
              unscaledValue * paddingScaleFactors[textScaleFactor]!),
        );
        expect(
          tester.getTopRight(dialogFinder).dy,
          moreOrLessEquals(tester.getTopRight(finder).dy -
              unscaledValue * paddingScaleFactors[textScaleFactor]!),
        );
      }

      void expectBottomEdgePadding(
        WidgetTester tester, {
        required Finder finder,
        double textScaleFactor = 1.0,
        required double unscaledValue,
      }) {
        expect(
          tester.getBottomLeft(dialogFinder).dy,
          moreOrLessEquals(tester.getBottomRight(finder).dy +
              unscaledValue * paddingScaleFactors[textScaleFactor]!),
        );
        expect(
          tester.getBottomRight(dialogFinder).dy,
          moreOrLessEquals(tester.getBottomRight(finder).dy +
              unscaledValue * paddingScaleFactors[textScaleFactor]!),
        );
      }

      void expectVerticalInnerPadding(
        WidgetTester tester, {
        required Finder top,
        required Finder bottom,
        required double value,
      }) {
        expect(
          tester.getBottomLeft(top).dy,
          tester.getTopLeft(bottom).dy - value,
        );
        expect(
          tester.getBottomRight(top).dy,
          tester.getTopRight(bottom).dy - value,
        );
      }

      final Widget giffy = Icon(
        Icons.ac_unit,
        key: giffyKey,
      );
      final Widget title = Text(
        'title',
        key: titleKey,
      );
      final Widget content = Text(
        'content',
        key: contentKey,
      );
      final List<Widget> actions = <Widget>[
        ElevatedButton(
          onPressed: () {},
          child: const Text('button'),
        ),
      ];

      for (final double textScaleFactor in textScaleFactors) {
        for (final bool isM3 in <bool>[false, true]) {
          testWidgets(
              'GiffyDialog padding is correct when only giffy and title are specified [textScaleFactor]=$textScaleFactor [isM3]=$isM3',
              (WidgetTester tester) async {
            final GiffyDialog dialog = GiffyDialog(
              giffy: giffy,
              title: title,
            );

            await openDialog(tester, dialog, textScaleFactor, isM3: isM3);

            expectTopEdgePadding(
              tester,
              finder: giffyFinder,
              textScaleFactor: textScaleFactor,
              unscaledValue: 24.0,
            );
            expectLeftEdgePadding(
              tester,
              finder: giffyFinder,
              textScaleFactor: textScaleFactor,
              unscaledValue: 24.0,
            );
            expectRightEdgePadding(
              tester,
              finder: giffyFinder,
              textScaleFactor: textScaleFactor,
              unscaledValue: 24.0,
            );
            expectVerticalInnerPadding(
              tester,
              top: giffyFinder,
              bottom: titleFinder,
              value: 16.0,
            );
            expectLeftEdgePadding(
              tester,
              finder: titleFinder,
              textScaleFactor: textScaleFactor,
              unscaledValue: 24.0,
            );
            expectRightEdgePadding(
              tester,
              finder: titleFinder,
              textScaleFactor: textScaleFactor,
              unscaledValue: 24.0,
            );

            expectBottomEdgePadding(
              tester,
              finder: titleFinder,
              unscaledValue: 20.0,
            );
          });

          testWidgets(
              'GiffyDialog padding is correct when only giffy and content are specified [textScaleFactor]=$textScaleFactor [isM3]=$isM3',
              (WidgetTester tester) async {
            final GiffyDialog dialog = GiffyDialog(
              giffy: giffy,
              content: content,
            );

            await openDialog(tester, dialog, textScaleFactor, isM3: isM3);

            expectTopEdgePadding(
              tester,
              finder: giffyFinder,
              textScaleFactor: textScaleFactor,
              unscaledValue: 24.0,
            );
            expectLeftEdgePadding(
              tester,
              finder: giffyFinder,
              textScaleFactor: textScaleFactor,
              unscaledValue: 24.0,
            );
            expectRightEdgePadding(
              tester,
              finder: giffyFinder,
              textScaleFactor: textScaleFactor,
              unscaledValue: 24.0,
            );
            expectVerticalInnerPadding(
              tester,
              top: giffyFinder,
              bottom: contentFinder,
              value: isM3 ? 16.0 : 20.0,
            );
            expectLeftEdgePadding(
              tester,
              finder: contentFinder,
              textScaleFactor: textScaleFactor,
              unscaledValue: 24.0,
            );
            expectRightEdgePadding(
              tester,
              finder: contentFinder,
              textScaleFactor: textScaleFactor,
              unscaledValue: 24.0,
            );
            expectBottomEdgePadding(
              tester,
              finder: contentFinder,
              unscaledValue: 24.0,
            );
          });

          testWidgets(
              'GiffyDialog padding is correct when only giffy and actions are specified [textScaleFactor]=$textScaleFactor [isM3]=$isM3',
              (WidgetTester tester) async {
            final GiffyDialog dialog = GiffyDialog(
              giffy: giffy,
              actions: actions,
            );

            await openDialog(tester, dialog, textScaleFactor, isM3: isM3);

            expectTopEdgePadding(
              tester,
              finder: giffyFinder,
              textScaleFactor: textScaleFactor,
              unscaledValue: 24.0,
            );
            expectLeftEdgePadding(
              tester,
              finder: giffyFinder,
              textScaleFactor: textScaleFactor,
              unscaledValue: 24.0,
            );
            expectRightEdgePadding(
              tester,
              finder: giffyFinder,
              textScaleFactor: textScaleFactor,
              unscaledValue: 24.0,
            );
            expectVerticalInnerPadding(
              tester,
              top: giffyFinder,
              bottom: actionsFinder,
              value: 24.0,
            );
            expectLeftEdgePadding(
              tester,
              finder: actionsFinder,
              textScaleFactor: textScaleFactor,
              unscaledValue: 0.0,
            );
            expectRightEdgePadding(
              tester,
              finder: actionsFinder,
              textScaleFactor: textScaleFactor,
              unscaledValue: 0.0,
            );
            expectBottomEdgePadding(
              tester,
              finder: actionsFinder,
              textScaleFactor: textScaleFactor,
              unscaledValue: 0.0,
            );
          });

          testWidgets(
              'GiffyDialog padding is correct when only giffy, title and content are specified [textScaleFactor]=$textScaleFactor [isM3]=$isM3',
              (WidgetTester tester) async {
            final GiffyDialog dialog = GiffyDialog(
              giffy: giffy,
              title: title,
              content: content,
            );

            await openDialog(tester, dialog, textScaleFactor, isM3: isM3);

            expectTopEdgePadding(
              tester,
              finder: giffyFinder,
              textScaleFactor: textScaleFactor,
              unscaledValue: 24.0,
            );
            expectLeftEdgePadding(
              tester,
              finder: giffyFinder,
              textScaleFactor: textScaleFactor,
              unscaledValue: 24.0,
            );
            expectRightEdgePadding(
              tester,
              finder: giffyFinder,
              textScaleFactor: textScaleFactor,
              unscaledValue: 24.0,
            );
            expectVerticalInnerPadding(
              tester,
              top: giffyFinder,
              bottom: titleFinder,
              value: 16.0,
            );
            expectLeftEdgePadding(
              tester,
              finder: titleFinder,
              textScaleFactor: textScaleFactor,
              unscaledValue: 24.0,
            );
            expectRightEdgePadding(
              tester,
              finder: titleFinder,
              textScaleFactor: textScaleFactor,
              unscaledValue: 24.0,
            );
            expectVerticalInnerPadding(
              tester,
              top: titleFinder,
              bottom: contentFinder,
              value: isM3 ? 16.0 : 20.0,
            );
            expectLeftEdgePadding(
              tester,
              finder: contentFinder,
              textScaleFactor: textScaleFactor,
              unscaledValue: 24.0,
            );
            expectRightEdgePadding(
              tester,
              finder: contentFinder,
              textScaleFactor: textScaleFactor,
              unscaledValue: 24.0,
            );
            expectBottomEdgePadding(
              tester,
              finder: contentFinder,
              unscaledValue: 24.0,
            );
          });

          testWidgets(
              'GiffyDialog padding is correct when only giffy, title and actions are specified [textScaleFactor]=$textScaleFactor [isM3]=$isM3',
              (WidgetTester tester) async {
            final GiffyDialog dialog = GiffyDialog(
              giffy: giffy,
              title: title,
              actions: actions,
            );

            await openDialog(tester, dialog, textScaleFactor, isM3: isM3);

            expectTopEdgePadding(
              tester,
              finder: giffyFinder,
              textScaleFactor: textScaleFactor,
              unscaledValue: 24.0,
            );
            expectLeftEdgePadding(
              tester,
              finder: giffyFinder,
              textScaleFactor: textScaleFactor,
              unscaledValue: 24.0,
            );
            expectRightEdgePadding(
              tester,
              finder: giffyFinder,
              textScaleFactor: textScaleFactor,
              unscaledValue: 24.0,
            );
            expectVerticalInnerPadding(
              tester,
              top: giffyFinder,
              bottom: titleFinder,
              value: 16.0,
            );
            expectLeftEdgePadding(
              tester,
              finder: titleFinder,
              textScaleFactor: textScaleFactor,
              unscaledValue: 24.0,
            );
            expectRightEdgePadding(
              tester,
              finder: titleFinder,
              textScaleFactor: textScaleFactor,
              unscaledValue: 24.0,
            );
            expectVerticalInnerPadding(
              tester,
              top: titleFinder,
              bottom: actionsFinder,
              value: 20.0,
            );
            expectLeftEdgePadding(
              tester,
              finder: actionsFinder,
              textScaleFactor: textScaleFactor,
              unscaledValue: 0.0,
            );
            expectRightEdgePadding(
              tester,
              finder: actionsFinder,
              textScaleFactor: textScaleFactor,
              unscaledValue: 0.0,
            );
            expectBottomEdgePadding(
              tester,
              finder: actionsFinder,
              textScaleFactor: textScaleFactor,
              unscaledValue: 0.0,
            );
          });

          testWidgets(
              'GiffyDialog padding is correct when only giffy, content and actions are specified [textScaleFactor]=$textScaleFactor [isM3]=$isM3',
              (WidgetTester tester) async {
            final GiffyDialog dialog = GiffyDialog(
              giffy: giffy,
              content: content,
              actions: actions,
            );

            await openDialog(tester, dialog, textScaleFactor, isM3: isM3);

            expectTopEdgePadding(
              tester,
              finder: giffyFinder,
              textScaleFactor: textScaleFactor,
              unscaledValue: 24.0,
            );
            expectLeftEdgePadding(
              tester,
              finder: giffyFinder,
              textScaleFactor: textScaleFactor,
              unscaledValue: 24.0,
            );
            expectRightEdgePadding(
              tester,
              finder: giffyFinder,
              textScaleFactor: textScaleFactor,
              unscaledValue: 24.0,
            );
            expectVerticalInnerPadding(
              tester,
              top: giffyFinder,
              bottom: contentFinder,
              value: isM3 ? 16.0 : 20.0,
            );
            expectLeftEdgePadding(
              tester,
              finder: contentFinder,
              textScaleFactor: textScaleFactor,
              unscaledValue: 24.0,
            );
            expectRightEdgePadding(
              tester,
              finder: contentFinder,
              textScaleFactor: textScaleFactor,
              unscaledValue: 24.0,
            );
            expectVerticalInnerPadding(
              tester,
              top: contentFinder,
              bottom: actionsFinder,
              value: 24.0,
            );
            expectLeftEdgePadding(
              tester,
              finder: actionsFinder,
              textScaleFactor: textScaleFactor,
              unscaledValue: 0.0,
            );
            expectRightEdgePadding(
              tester,
              finder: actionsFinder,
              textScaleFactor: textScaleFactor,
              unscaledValue: 0.0,
            );
            expectBottomEdgePadding(
              tester,
              finder: actionsFinder,
              textScaleFactor: textScaleFactor,
              unscaledValue: 0.0,
            );
          });

          testWidgets(
              'GiffyDialog padding is correct when all giffy, title, content and actions are specified [textScaleFactor]=$textScaleFactor [isM3]=$isM3',
              (WidgetTester tester) async {
            final GiffyDialog dialog = GiffyDialog(
              giffy: giffy,
              title: title,
              content: content,
              actions: actions,
            );

            await openDialog(tester, dialog, textScaleFactor, isM3: isM3);

            expectTopEdgePadding(
              tester,
              finder: giffyFinder,
              textScaleFactor: textScaleFactor,
              unscaledValue: 24.0,
            );
            expectLeftEdgePadding(
              tester,
              finder: giffyFinder,
              textScaleFactor: textScaleFactor,
              unscaledValue: 24.0,
            );
            expectRightEdgePadding(
              tester,
              finder: giffyFinder,
              textScaleFactor: textScaleFactor,
              unscaledValue: 24.0,
            );
            expectVerticalInnerPadding(
              tester,
              top: giffyFinder,
              bottom: titleFinder,
              value: 16.0,
            );
            expectLeftEdgePadding(
              tester,
              finder: titleFinder,
              textScaleFactor: textScaleFactor,
              unscaledValue: 24.0,
            );
            expectRightEdgePadding(
              tester,
              finder: titleFinder,
              textScaleFactor: textScaleFactor,
              unscaledValue: 24.0,
            );
            expectVerticalInnerPadding(
              tester,
              top: titleFinder,
              bottom: contentFinder,
              value: isM3 ? 16.0 : 20.0,
            );
            expectLeftEdgePadding(
              tester,
              finder: contentFinder,
              textScaleFactor: textScaleFactor,
              unscaledValue: 24.0,
            );
            expectRightEdgePadding(
              tester,
              finder: contentFinder,
              textScaleFactor: textScaleFactor,
              unscaledValue: 24.0,
            );
            expectVerticalInnerPadding(
              tester,
              top: contentFinder,
              bottom: actionsFinder,
              value: 24.0,
            );
            expectLeftEdgePadding(
              tester,
              finder: actionsFinder,
              textScaleFactor: textScaleFactor,
              unscaledValue: 0.0,
            );
            expectRightEdgePadding(
              tester,
              finder: actionsFinder,
              textScaleFactor: textScaleFactor,
              unscaledValue: 0.0,
            );
            expectBottomEdgePadding(
              tester,
              finder: actionsFinder,
              textScaleFactor: textScaleFactor,
              unscaledValue: 0.0,
            );
          });
        }

        for (final bool isM3 in <bool>[true, false]) {
          testWidgets(
              'GiffyDialog padding is correct when only giffy, content and actions are specified [textScaleFactor]=$textScaleFactor [isM3]=$isM3',
              (WidgetTester tester) async {
            final GiffyDialog dialog = GiffyDialog(
              giffy: giffy,
              content: content,
              actions: actions,
            );

            await openDialog(tester, dialog, textScaleFactor, isM3: isM3);

            expectTopEdgePadding(
              tester,
              finder: giffyFinder,
              textScaleFactor: textScaleFactor,
              unscaledValue: 24.0,
            );
            expectLeftEdgePadding(
              tester,
              finder: giffyFinder,
              textScaleFactor: textScaleFactor,
              unscaledValue: 24.0,
            );
            expectRightEdgePadding(
              tester,
              finder: giffyFinder,
              textScaleFactor: textScaleFactor,
              unscaledValue: 24.0,
            );
            expectVerticalInnerPadding(
              tester,
              top: giffyFinder,
              bottom: contentFinder,
              value: isM3 ? 16.0 : 20.0,
            );
            expectLeftEdgePadding(
              tester,
              finder: contentFinder,
              textScaleFactor: textScaleFactor,
              unscaledValue: 24.0,
            );
            expectRightEdgePadding(
              tester,
              finder: contentFinder,
              textScaleFactor: textScaleFactor,
              unscaledValue: 24.0,
            );
            expectVerticalInnerPadding(
              tester,
              top: contentFinder,
              bottom: actionsFinder,
              value: 24.0,
            );
            expectLeftEdgePadding(
              tester,
              finder: actionsFinder,
              textScaleFactor: textScaleFactor,
              unscaledValue: 0.0,
            );
            expectRightEdgePadding(
              tester,
              finder: actionsFinder,
              textScaleFactor: textScaleFactor,
              unscaledValue: 0.0,
            );
            expectBottomEdgePadding(
              tester,
              finder: actionsFinder,
              textScaleFactor: textScaleFactor,
              unscaledValue: 0.0,
            );
          });
        }
      }
    },
  );

  testWidgets('Dialogs can set the vertical direction of overflowing actions',
      (WidgetTester tester) async {
    final GlobalKey key1 = GlobalKey();
    final GlobalKey key2 = GlobalKey();

    final GiffyDialog dialog = GiffyDialog(
      giffy: const SizedBox(),
      title: const Text('title'),
      content: const Text('content'),
      actions: <Widget>[
        ElevatedButton(
          key: key1,
          onPressed: () {},
          child: const Text('Looooooooooooooong button 1'),
        ),
        ElevatedButton(
          key: key2,
          onPressed: () {},
          child: const Text('Looooooooooooooong button 2'),
        ),
      ],
      actionsOverflowDirection: VerticalDirection.up,
    );

    await tester.pumpWidget(
      _buildAppWithDialog(dialog),
    );

    await tester.tap(find.text('X'));
    await tester.pumpAndSettle();

    final Rect buttonOneRect = tester.getRect(find.byKey(key1));
    final Rect buttonTwoRect = tester.getRect(find.byKey(key2));
    // Second [ElevatedButton] should appear above the first.
    expect(buttonTwoRect.bottom, lessThanOrEqualTo(buttonOneRect.top));
  });

  testWidgets('Dialogs have no spacing by default for overflowing actions',
      (WidgetTester tester) async {
    final GlobalKey key1 = GlobalKey();
    final GlobalKey key2 = GlobalKey();

    final GiffyDialog dialog = GiffyDialog(
      giffy: const SizedBox(),
      title: const Text('title'),
      content: const Text('content'),
      actions: <Widget>[
        ElevatedButton(
          key: key1,
          onPressed: () {},
          child: const Text('Looooooooooooooong button 1'),
        ),
        ElevatedButton(
          key: key2,
          onPressed: () {},
          child: const Text('Looooooooooooooong button 2'),
        ),
      ],
    );

    await tester.pumpWidget(
      _buildAppWithDialog(dialog),
    );

    await tester.tap(find.text('X'));
    await tester.pumpAndSettle();

    final Rect buttonOneRect = tester.getRect(find.byKey(key1));
    final Rect buttonTwoRect = tester.getRect(find.byKey(key2));
    expect(buttonOneRect.bottom, buttonTwoRect.top);
  });

  testWidgets('Dialogs can set the button spacing of overflowing actions',
      (WidgetTester tester) async {
    final GlobalKey key1 = GlobalKey();
    final GlobalKey key2 = GlobalKey();

    final GiffyDialog dialog = GiffyDialog(
      giffy: const SizedBox(),
      title: const Text('title'),
      content: const Text('content'),
      actions: <Widget>[
        ElevatedButton(
          key: key1,
          onPressed: () {},
          child: const Text('Looooooooooooooong button 1'),
        ),
        ElevatedButton(
          key: key2,
          onPressed: () {},
          child: const Text('Looooooooooooooong button 2'),
        ),
      ],
      actionsOverflowButtonSpacing: 10.0,
    );

    await tester.pumpWidget(
      _buildAppWithDialog(dialog),
    );

    await tester.tap(find.text('X'));
    await tester.pumpAndSettle();

    final Rect buttonOneRect = tester.getRect(find.byKey(key1));
    final Rect buttonTwoRect = tester.getRect(find.byKey(key2));
    expect(buttonOneRect.bottom, buttonTwoRect.top - 10.0);
  });

  testWidgets('Dialogs can set the alignment of the OverflowBar',
      (WidgetTester tester) async {
    final GlobalKey key1 = GlobalKey();
    final GlobalKey key2 = GlobalKey();

    final GiffyDialog dialog = GiffyDialog(
      giffy: const SizedBox(),
      title: const Text('title'),
      content: const Text('content'),
      actions: <Widget>[
        ElevatedButton(
          key: key1,
          onPressed: () {},
          child: const Text('Loooooooooong button 1'),
        ),
        ElevatedButton(
          key: key2,
          onPressed: () {},
          child: const Text('Loooooooooooooonger button 2'),
        ),
      ],
      actionsOverflowAlignment: OverflowBarAlignment.center,
    );

    await tester.pumpWidget(
      _buildAppWithDialog(dialog),
    );

    await tester.tap(find.text('X'));
    await tester.pumpAndSettle();

    final Rect buttonOneRect = tester.getRect(find.byKey(key1));
    final Rect buttonTwoRect = tester.getRect(find.byKey(key2));
    expect(buttonOneRect.center.dx, buttonTwoRect.center.dx);
  });

  testWidgets('Dismissible.confirmDismiss defers to an GiffyDialog',
      (WidgetTester tester) async {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    final List<int> dismissedItems = <int>[];

    // Dismiss is confirmed IFF confirmDismiss() returns true.
    Future<bool?> confirmDismiss(DismissDirection dismissDirection) async {
      return showDialog<bool>(
        context: scaffoldKey.currentContext!,
        builder: (BuildContext context) {
          return GiffyDialog(
            giffy: const SizedBox(),
            actions: <Widget>[
              TextButton(
                child: const Text('TRUE'),
                onPressed: () {
                  Navigator.pop(context, true); // showDialog() returns true
                },
              ),
              TextButton(
                child: const Text('FALSE'),
                onPressed: () {
                  Navigator.pop(context, false); // showDialog() returns false
                },
              ),
            ],
          );
        },
      );
    }

    Widget buildDismissibleItem(int item, StateSetter setState) {
      return Dismissible(
        key: ValueKey<int>(item),
        confirmDismiss: confirmDismiss,
        onDismissed: (DismissDirection direction) {
          setState(() {
            expect(dismissedItems.contains(item), isFalse);
            dismissedItems.add(item);
          });
        },
        child: SizedBox(
          height: 100.0,
          child: Text(item.toString()),
        ),
      );
    }

    Widget buildFrame() {
      return MaterialApp(
        home: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Scaffold(
              key: scaffoldKey,
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  itemExtent: 100.0,
                  children: <int>[0, 1, 2, 3, 4]
                      .where((int i) => !dismissedItems.contains(i))
                      .map<Widget>(
                          (int item) => buildDismissibleItem(item, setState))
                      .toList(),
                ),
              ),
            );
          },
        ),
      );
    }

    Future<void> dismissItem(WidgetTester tester, int item) async {
      await tester.fling(find.text(item.toString()), const Offset(300.0, 0.0),
          1000.0); // fling to the right
      await tester.pump(); // start the slide
      await tester.pump(const Duration(
          seconds: 1)); // finish the slide and start shrinking...
      await tester.pump(); // first frame of shrinking animation
      await tester.pump(const Duration(
          seconds: 1)); // finish the shrinking and call the callback...
      await tester.pump(); // rebuild after the callback removes the entry
    }

    // Dismiss item 0 is confirmed via the GiffyDialog
    await tester.pumpWidget(buildFrame());
    expect(dismissedItems, isEmpty);
    await dismissItem(
        tester, 0); // Causes the GiffyDialog to appear per confirmDismiss
    await tester.pumpAndSettle();
    await tester.tap(find.text('TRUE')); // GiffyDialog action
    await tester.pumpAndSettle();
    expect(find.text('TRUE'), findsNothing); // Dialog was dismissed
    expect(find.text('FALSE'), findsNothing);
    expect(dismissedItems, <int>[0]);
    expect(find.text('0'), findsNothing);

    // Dismiss item 1 is not confirmed via the GiffyDialog
    await tester.pumpWidget(buildFrame());
    expect(dismissedItems, <int>[0]);
    await dismissItem(
        tester, 1); // Causes the GiffyDialog to appear per confirmDismiss
    await tester.pumpAndSettle();
    await tester.tap(find.text('FALSE')); // GiffyDialog action
    await tester.pumpAndSettle();
    expect(find.text('TRUE'), findsNothing); // Dialog was dismissed
    expect(find.text('FALSE'), findsNothing);
    expect(dismissedItems, <int>[0]);
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);

    // Dismiss item 1 is not confirmed via the GiffyDialog
    await tester.pumpWidget(buildFrame());
    expect(dismissedItems, <int>[0]);
    await dismissItem(
        tester, 1); // Causes the GiffyDialog to appear per confirmDismiss
    await tester.pumpAndSettle();
    expect(find.text('FALSE'), findsOneWidget);
    expect(find.text('TRUE'), findsOneWidget);
    await tester.tapAt(Offset.zero); // Tap outside of the GiffyDialog
    await tester.pumpAndSettle();
    expect(dismissedItems, <int>[0]);
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
    expect(find.text('TRUE'), findsNothing); // Dialog was dismissed
    expect(find.text('FALSE'), findsNothing);

    // Dismiss item 1 is confirmed via the GiffyDialog
    await tester.pumpWidget(buildFrame());
    expect(dismissedItems, <int>[0]);
    await dismissItem(
        tester, 1); // Causes the GiffyDialog to appear per confirmDismiss
    await tester.pumpAndSettle();
    await tester.tap(find.text('TRUE')); // GiffyDialog action
    await tester.pumpAndSettle();
    expect(find.text('TRUE'), findsNothing); // Dialog was dismissed
    expect(find.text('FALSE'), findsNothing);
    expect(dismissedItems, <int>[0, 1]);
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsNothing);
  });

  group('GiffyDialog.scrollable: ', () {
    testWidgets('Title is scrollable', (WidgetTester tester) async {
      final Key titleKey = UniqueKey();
      final GiffyDialog dialog = GiffyDialog(
        giffy: const SizedBox(),
        title: Container(
          key: titleKey,
          color: Colors.green,
          height: 1000,
        ),
        scrollable: true,
      );
      await tester.pumpWidget(_buildAppWithDialog(dialog));
      await tester.tap(find.text('X'));
      await tester.pumpAndSettle();

      final RenderBox box = tester.renderObject(find.byKey(titleKey));
      final Offset originalOffset = box.localToGlobal(Offset.zero);
      await tester.drag(find.byKey(titleKey), const Offset(0.0, -200.0));
      expect(box.localToGlobal(Offset.zero),
          equals(originalOffset.translate(0.0, -200.0)));
    });

    testWidgets('Content is scrollable', (WidgetTester tester) async {
      final Key contentKey = UniqueKey();
      final GiffyDialog dialog = GiffyDialog(
        giffy: const SizedBox(),
        content: Container(
          key: contentKey,
          color: Colors.orange,
          height: 1000,
        ),
        scrollable: true,
      );
      await tester.pumpWidget(_buildAppWithDialog(dialog));
      await tester.tap(find.text('X'));
      await tester.pumpAndSettle();

      final RenderBox box = tester.renderObject(find.byKey(contentKey));
      final Offset originalOffset = box.localToGlobal(Offset.zero);
      await tester.drag(find.byKey(contentKey), const Offset(0.0, -200.0));
      expect(box.localToGlobal(Offset.zero),
          equals(originalOffset.translate(0.0, -200.0)));
    });

    testWidgets('Title and content are scrollable',
        (WidgetTester tester) async {
      final Key titleKey = UniqueKey();
      final Key contentKey = UniqueKey();
      final GiffyDialog dialog = GiffyDialog(
        giffy: const SizedBox(),
        title: Container(
          key: titleKey,
          color: Colors.green,
          height: 400,
        ),
        content: Container(
          key: contentKey,
          color: Colors.orange,
          height: 400,
        ),
        scrollable: true,
      );
      await tester.pumpWidget(_buildAppWithDialog(dialog));
      await tester.tap(find.text('X'));
      await tester.pumpAndSettle();

      final RenderBox title = tester.renderObject(find.byKey(titleKey));
      final RenderBox content = tester.renderObject(find.byKey(contentKey));
      final Offset titleOriginalOffset = title.localToGlobal(Offset.zero);
      final Offset contentOriginalOffset = content.localToGlobal(Offset.zero);

      // Dragging the title widget should scroll both the title
      // and the content widgets.
      await tester.drag(find.byKey(titleKey), const Offset(0.0, -200.0));
      expect(title.localToGlobal(Offset.zero),
          equals(titleOriginalOffset.translate(0.0, -200.0)));
      expect(content.localToGlobal(Offset.zero),
          equals(contentOriginalOffset.translate(0.0, -200.0)));

      // Dragging the content widget should scroll both the title
      // and the content widgets.
      await tester.drag(find.byKey(contentKey), const Offset(0.0, 200.0));
      expect(title.localToGlobal(Offset.zero), equals(titleOriginalOffset));
      expect(content.localToGlobal(Offset.zero), equals(contentOriginalOffset));
    });
  });

  testWidgets('GiffyDialog.actionsAlignment', (WidgetTester tester) async {
    final Key actionKey = UniqueKey();

    Widget buildFrame(MainAxisAlignment? alignment) {
      return MaterialApp(
        theme: ThemeData(useMaterial3: false),
        home: Scaffold(
          body: GiffyDialog(
            giffy: const SizedBox(),
            content: const SizedBox(width: 800),
            actionsAlignment: alignment,
            actions: <Widget>[SizedBox(key: actionKey, width: 20, height: 20)],
            buttonPadding: EdgeInsets.zero,
            insetPadding: EdgeInsets.zero,
          ),
        ),
      );
    }

    // Default configuration
    await tester.pumpWidget(buildFrame(null));
    expect(tester.getTopLeft(find.byType(GiffyDialog)).dx, 0);
    expect(tester.getTopRight(find.byType(GiffyDialog)).dx, 800);
    expect(tester.getSize(find.byType(OverflowBar)).width, 800);
    expect(tester.getTopLeft(find.byKey(actionKey)).dx, 800 - 20);
    expect(tester.getTopRight(find.byKey(actionKey)).dx, 800);

    // All possible alignment values

    await tester.pumpWidget(buildFrame(MainAxisAlignment.start));
    expect(tester.getTopLeft(find.byKey(actionKey)).dx, 0);
    expect(tester.getTopRight(find.byKey(actionKey)).dx, 20);

    await tester.pumpWidget(buildFrame(MainAxisAlignment.center));
    expect(tester.getTopLeft(find.byKey(actionKey)).dx, (800 - 20) / 2);
    expect(tester.getTopRight(find.byKey(actionKey)).dx, (800 - 20) / 2 + 20);

    await tester.pumpWidget(buildFrame(MainAxisAlignment.end));
    expect(tester.getTopLeft(find.byKey(actionKey)).dx, 800 - 20);
    expect(tester.getTopRight(find.byKey(actionKey)).dx, 800);

    await tester.pumpWidget(buildFrame(MainAxisAlignment.spaceBetween));
    expect(tester.getTopLeft(find.byKey(actionKey)).dx, 0);
    expect(tester.getTopRight(find.byKey(actionKey)).dx, 20);

    await tester.pumpWidget(buildFrame(MainAxisAlignment.spaceAround));
    expect(tester.getTopLeft(find.byKey(actionKey)).dx, (800 - 20) / 2);
    expect(tester.getTopRight(find.byKey(actionKey)).dx, (800 - 20) / 2 + 20);

    await tester.pumpWidget(buildFrame(MainAxisAlignment.spaceEvenly));
    expect(tester.getTopLeft(find.byKey(actionKey)).dx, (800 - 20) / 2);
    expect(tester.getTopRight(find.byKey(actionKey)).dx, (800 - 20) / 2 + 20);
  });
}
