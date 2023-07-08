# Giffy Dialog

[![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.svg?v=102)](https://opensource.org/licenses/MIT)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/xsahil03x/giffy_dialog/blob/master/LICENSE)
[![Dart CI](https://github.com/xsahil03x/giffy_dialog/workflows/giffy_dialog/badge.svg)](https://github.com/xsahil03x/giffy_dialog/actions)
[![CodeCov](https://codecov.io/gh/xsahil03x/giffy_dialog/branch/master/graph/badge.svg)](https://codecov.io/gh/xsahil03x/giffy_dialog)
[![Version](https://img.shields.io/pub/v/giffy_dialog.svg)](https://pub.dartlang.org/packages/giffy_dialog)

A beautiful and custom alert dialog for flutter highly inspired from <a href="https://github.com/Shashank02051997/FancyGifDialog-Android">FancyAlertDialog-Android</a>.

**Show some ❤️ and star the repo to support the project**

Live Demo: https://xsahil03x.github.io/giffy_dialog

<p>
<img src="https://github.com/xsahil03x/giffy_dialog/blob/master/asset/package_demo.gif?raw=true" alt="An animated image of the GiffyDialog" height="400"/>
</p>

## Migration from v1 to v2

Please refer to the [migration guide](v1-v2_migration.md) to migrate from v1 to v2.

## Installation

Add the following to your  `pubspec.yaml`  and replace  `[version]`  with the latest version:

```yaml
dependencies:
  giffy_dialog: ^[version]
```

## Usage

Import the package:

```dart
import 'package:giffy_dialog/giffy_dialog.dart';
```

Use it like a dialog:

```dart
 showDialog(
   context: context,
   builder: (BuildContext context) {
     return GiffyDialog.image(
       Image.network(
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
   },
 );
```

Or use it like a bottom sheet:

```dart
 showModalBottomSheet(
   context: context,
   clipBehavior: Clip.antiAlias,
   isScrollControlled: true,
   shape: RoundedRectangleBorder(
     borderRadius: BorderRadius.vertical(
       top: Radius.circular(useMaterial3 ? 32 : 4),
     ),
   ),
   builder: (BuildContext context) {
     return GiffyBottomSheet.image(
       Image.network(
         "https://raw.githubusercontent.com/Shashank02051997/FancyGifDialog-Android/master/GIF's/gif14.gif",
         height: 200,
         fit: BoxFit.cover,
       ),
       title: Text(
         'Image Animation',
         textAlign: TextAlign.center,
       ),
       content: Text(
         'This is a image animation bottom sheet. This library helps you easily create fancy giffy bottom sheet.',
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
   },
 );
```

## Demo

<table>
  <tr>
    <th></th>
    <th colspan="4">Giffy Dialog</th>
    <th colspan="4">Giffy BottomSheet</th>
  </tr>
  <tr>
    <th></th>
    <th colspan="2">Material 2</th>
    <th colspan="2">Material 3</th>
    <th colspan="2">Material 2</th>
    <th colspan="2">Material 3</th>
  </tr>
  <tr>
    <th>Image Giffy</th>
    <td colspan="2"><img src="https://github.com/xsahil03x/giffy_dialog/blob/master/asset/m2/image_giffy_dialog.gif?raw=true" height="400" alt="Image Giffy Dialog"/></td>
    <td colspan="2"><img src="https://github.com/xsahil03x/giffy_dialog/blob/master/asset/m3/image_giffy_dialog.gif?raw=true" height="400" alt="Image Giffy Dialog"/></td>
    <td colspan="2"><img src="https://github.com/xsahil03x/giffy_dialog/blob/master/asset/m2/image_giffy_bottom_sheet.gif?raw=true" height="400" alt="Image Giffy Dialog"/></td>
    <td colspan="2"><img src="https://github.com/xsahil03x/giffy_dialog/blob/master/asset/m3/image_giffy_bottom_sheet.gif?raw=true" height="400" alt="Image Giffy Dialog"/></td>
  </tr>
  <tr>
    <th>Rive Giffy</th>
    <td colspan="2"><img src="https://github.com/xsahil03x/giffy_dialog/blob/master/asset/m2/rive_giffy_dialog.gif?raw=true" height="400" alt="Image Giffy Dialog"/></td>
    <td colspan="2"><img src="https://github.com/xsahil03x/giffy_dialog/blob/master/asset/m3/rive_giffy_dialog.gif?raw=true" height="400" alt="Image Giffy Dialog"/></td>
    <td colspan="2"><img src="https://github.com/xsahil03x/giffy_dialog/blob/master/asset/m2/rive_giffy_bottom_sheet.gif?raw=true" height="400" alt="Image Giffy Dialog"/></td>
    <td colspan="2"><img src="https://github.com/xsahil03x/giffy_dialog/blob/master/asset/m3/rive_giffy_bottom_sheet.gif?raw=true" height="400" alt="Image Giffy Dialog"/></td>
  </tr>
  <tr>
    <th>Lottie Giffy</th>
    <td colspan="2"><img src="https://github.com/xsahil03x/giffy_dialog/blob/master/asset/m2/lottie_giffy_dialog.gif?raw=true" height="400" alt="Image Giffy Dialog"/></td>
    <td colspan="2"><img src="https://github.com/xsahil03x/giffy_dialog/blob/master/asset/m3/lottie_giffy_dialog.gif?raw=true" height="400" alt="Image Giffy Dialog"/></td>
    <td colspan="2"><img src="https://github.com/xsahil03x/giffy_dialog/blob/master/asset/m2/lottie_giffy_bottom_sheet.gif?raw=true" height="400" alt="Image Giffy Dialog"/></td>
    <td colspan="2"><img src="https://github.com/xsahil03x/giffy_dialog/blob/master/asset/m3/lottie_giffy_bottom_sheet.gif?raw=true" height="400" alt="Image Giffy Dialog"/></td>
  </tr>
</table>

## Customization

The GiffyDialog widget provides several customization options, such as the dialog title, description, buttons,
animations, and more. Please refer to the [documentation](https://pub.dev/documentation/giffy_dialog/latest/) for a
complete list of available options.

## Contributors

Thanks goes to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <td align="center"><a href="https://github.com/ArtemKolichenkov"><img src="https://avatars3.githubusercontent.com/u/24019688?v=4" width="100px;" alt=""/><br /><sub><b>ArtemKolichenkov</b></sub></a><br /><a href="https://github.com/xsahil03x/giffy_dialog/commits?author=ArtemKolichenkov" title="Documentation">📖</a> <a href="#ideas-ArtemKolichenkov" title="Ideas, Planning, & Feedback">🤔</a></td>
    <td align="center"><a href="https://github.com/alejandrofierro"><img src="https://avatars1.githubusercontent.com/u/25576040?v=4" width="100px;" alt=""/><br /><sub><b>Alex Fierro</b></sub></a><br /><a href="https://github.com/xsahil03x/giffy_dialog/commits?author=alejandrofierro" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/Kawaeee"><img src="https://avatars2.githubusercontent.com/u/26347733?v=4" width="100px;" alt=""/><br /><sub><b>Kasidech C.</b></sub></a><br /><a href="https://github.com/xsahil03x/giffy_dialog/commits?author=Kawaeee" title="Code">💻</a></td>
    <td align="center"><a href="https://www.fieldassist.in"><img src="https://avatars2.githubusercontent.com/u/13694349?v=4" width="100px;" alt=""/><br /><sub><b>Jai Sachdeva</b></sub></a><br /><a href="#question-astralstriker" title="Answering Questions">💬</a></td>
    <td align="center"><a href="https://www.fb.com/TarekkMA1"><img src="https://avatars0.githubusercontent.com/u/6633545?v=4" width="100px;" alt=""/><br /><sub><b>Tarekk Mohamed Abdalla</b></sub></a><br /><a href="https://github.com/xsahil03x/giffy_dialog/commits?author=TarekkMA" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/madhukesh048"><img src="https://avatars0.githubusercontent.com/u/31788197?v=4" width="100px;" alt=""/><br /><sub><b>madhukesh_048</b></sub></a><br /><a href="https://github.com/xsahil03x/giffy_dialog/commits?author=madhukesh048" title="Tests">⚠️</a></td>
    <td align="center"><a href="https://github.com/dpedrinha"><img src="https://avatars2.githubusercontent.com/u/14824799?v=4" width="100px;" alt=""/><br /><sub><b>dpedrinha</b></sub></a><br /><a href="https://github.com/xsahil03x/giffy_dialog/commits?author=dpedrinha" title="Code">💻</a></td>
  </tr>
  <tr>
    <td align="center"><a href="https://github.com/natezhengbne"><img src="https://avatars1.githubusercontent.com/u/34373238?v=4" width="100px;" alt=""/><br /><sub><b>Nate</b></sub></a><br /><a href="https://github.com/xsahil03x/giffy_dialog/commits?author=natezhengbne" title="Code">💻</a> <a href="#example-natezhengbne" title="Examples">💡</a></td>
    <td align="center"><a href="https://github.com/alexlindroos"><img src="https://avatars0.githubusercontent.com/u/17140689?v=4" width="100px;" alt=""/><br /><sub><b>Alex</b></sub></a><br /><a href="https://github.com/xsahil03x/giffy_dialog/commits?author=alexlindroos" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/jritchie"><img src="https://avatars3.githubusercontent.com/u/2582314?v=4" width="100px;" alt=""/><br /><sub><b>jritchie</b></sub></a><br /><a href="https://github.com/xsahil03x/giffy_dialog/commits?author=jritchie" title="Code">💻</a></td>
    <td align="center"><a href="https://saadbinshahid.com"><img src="https://avatars1.githubusercontent.com/u/7608345?v=4" width="100px;" alt=""/><br /><sub><b>Saad Bin Shahid</b></sub></a><br /><a href="https://github.com/xsahil03x/giffy_dialog/commits?author=SaadBinShahid" title="Code">💻</a></td>
  </tr>
</table>

<!-- markdownlint-enable -->
<!-- prettier-ignore-end -->
<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind welcome!

## License

[MIT License](LICENSE)
