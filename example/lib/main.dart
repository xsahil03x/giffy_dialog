import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

final material3Notifier = ValueNotifier<bool>(true);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: material3Notifier,
      builder: (context, useMaterial3, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Giffy Demo',
          theme: ThemeData(
            brightness: Brightness.light,
            useMaterial3: useMaterial3,
            colorSchemeSeed: Colors.teal,
            textTheme: GoogleFonts.ralewayTextTheme(),
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            useMaterial3: useMaterial3,
            colorSchemeSeed: Colors.teal,
            textTheme: GoogleFonts.ralewayTextTheme(),
          ),
          home: MyHomePage(),
        );
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Giffy Example"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialToggleButtons(),
            SizedBox(height: 30),
            Text('Image Giffy'),
            SizedBox(height: 10),
            TypedExample(type: GiffyType.image),
            SizedBox(height: 30),
            Text('Rive Giffy'),
            SizedBox(height: 10),
            TypedExample(type: GiffyType.rive),
            SizedBox(height: 30),
            Text('Lottie Giffy'),
            SizedBox(height: 10),
            TypedExample(type: GiffyType.lottie),
          ],
        ),
      ),
    );
  }
}

class MaterialToggleButtons extends StatelessWidget {
  const MaterialToggleButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final useMaterial3 = Theme.of(context).useMaterial3;
    final primary = Theme.of(context).colorScheme.primary;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final selectedColor = useMaterial3
        ? primary
        : isDark
            ? Colors.black
            : Colors.white;
    final borderColor = useMaterial3 ? primary.withOpacity(0.12) : primary;
    final borderRadius = useMaterial3
        ? const BorderRadius.all(Radius.circular(16))
        : const BorderRadius.all(Radius.circular(4));

    return ToggleButtons(
      isSelected: [!useMaterial3, useMaterial3],
      borderRadius: borderRadius,
      borderColor: borderColor,
      selectedBorderColor: borderColor,
      color: primary,
      selectedColor: selectedColor,
      fillColor: borderColor,
      constraints: const BoxConstraints(
        minHeight: 30.0,
        minWidth: 100.0,
      ),
      onPressed: (index) {
        material3Notifier.value = index == 1;
      },
      children: [Text('Material 2'), Text('Material 3')],
    );
  }
}

enum GiffyType {
  image,
  rive,
  lottie;

  Widget when({
    required Widget Function() image,
    required Widget Function() rive,
    required Widget Function() lottie,
  }) {
    switch (this) {
      case GiffyType.image:
        return image();
      case GiffyType.rive:
        return rive();
      case GiffyType.lottie:
        return lottie();
    }
  }
}

class TypedExample extends StatelessWidget {
  const TypedExample({
    super.key,
    required this.type,
  });

  final GiffyType type;

  @override
  Widget build(BuildContext context) {
    final useMaterial3 = Theme.of(context).useMaterial3;

    final image = GiffyModel.image(context);
    final rive = GiffyModel.rive(context);
    final lottie = GiffyModel.lottie(context);

    Widget buildDialog() {
      return type.when(
        image: () {
          return GiffyDialog.image(
            image.giffy as Image,
            title: image.title,
            content: image.content,
            actions: image.actions,
          );
        },
        rive: () {
          return GiffyDialog.rive(
            rive.giffy as RiveAnimation,
            giffyBuilder: (context, rive) {
              return ClipRRect(
                borderRadius: useMaterial3
                    ? const BorderRadius.all(Radius.circular(16))
                    : const BorderRadius.all(Radius.circular(4)),
                child: SizedBox(height: 200, child: rive),
              );
            },
            title: rive.title,
            content: rive.content,
            actions: rive.actions,
          );
        },
        lottie: () {
          return GiffyDialog.lottie(
            lottie.giffy as LottieBuilder,
            title: lottie.title,
            content: lottie.content,
            actions: lottie.actions,
          );
        },
      );
    }

    Widget buildBottomSheet() {
      return type.when(
        image: () {
          return GiffyBottomSheet.image(
            image.giffy as Image,
            title: image.title,
            content: image.content,
            actions: image.actions,
          );
        },
        rive: () {
          return GiffyBottomSheet.rive(
            rive.giffy as RiveAnimation,
            giffyBuilder: (context, rive) {
              return ClipRRect(
                borderRadius: useMaterial3
                    ? const BorderRadius.all(Radius.circular(16))
                    : const BorderRadius.all(Radius.circular(4)),
                child: SizedBox(height: 200, child: rive),
              );
            },
            title: rive.title,
            content: rive.content,
            actions: rive.actions,
          );
        },
        lottie: () {
          return GiffyBottomSheet.lottie(
            lottie.giffy as LottieBuilder,
            title: lottie.title,
            content: lottie.content,
            actions: lottie.actions,
          );
        },
      );
    }

    return SizedBox(
      height: 36,
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              child: Text('Show Dialog'),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) {
                    return buildDialog();
                  },
                );
              },
            ),
          ),
          VerticalDivider(),
          Expanded(
            child: ElevatedButton(
              child: Text('Show Bottom Sheet'),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  clipBehavior: Clip.antiAlias,
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(useMaterial3 ? 32 : 4),
                    ),
                  ),
                  builder: (_) {
                    return buildBottomSheet();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class GiffyModel {
  final Widget giffy;
  final Widget title;
  final Widget content;
  final List<Widget> actions;

  const GiffyModel({
    required this.giffy,
    required this.title,
    required this.content,
    required this.actions,
  });

  factory GiffyModel.image(BuildContext context) {
    return GiffyModel(
      giffy: Image.network(
        "https://raw.githubusercontent.com/Shashank02051997/FancyGifDialog-Android/master/GIF's/gif14.gif",
        height: 200,
        fit: BoxFit.cover,
      ),
      title: Text(
        'Image Animation',
        textAlign: TextAlign.center,
      ),
      content: Text(
        'This is a image animation dialog box. This library helps you easily create fancy giffy dialog.',
        textAlign: TextAlign.center,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, 'CANCEL'),
          child: const Text('CANCEL'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK'),
        ),
      ],
    );
  }

  factory GiffyModel.rive(BuildContext context) {
    return GiffyModel(
      giffy: RiveAnimation.network(
        'https://cdn.rive.app/animations/vehicles.riv',
        fit: BoxFit.cover,
        placeHolder: Center(child: CircularProgressIndicator()),
      ),
      title: Text(
        'Rive Animation',
        textAlign: TextAlign.center,
      ),
      content: Text(
        'This is a rive animation dialog box. This library helps you easily create fancy giffy dialog.',
        textAlign: TextAlign.center,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, 'CANCEL'),
          child: const Text('CANCEL'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK'),
        ),
      ],
    );
  }

  factory GiffyModel.lottie(BuildContext context) {
    return GiffyModel(
      giffy: Lottie.network(
        'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json',
        fit: BoxFit.contain,
        height: 200,
      ),
      title: Text(
        'Lottie Animation',
        textAlign: TextAlign.center,
      ),
      content: Text(
        'This is a lottie animation dialog box. This library helps you easily create fancy giffy dialog.',
        textAlign: TextAlign.center,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, 'CANCEL'),
          child: const Text('CANCEL'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK'),
        ),
      ],
    );
  }
}
