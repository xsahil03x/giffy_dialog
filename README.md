# 👏 Giffy Dialogs
[![Say Thanks!](https://img.shields.io/badge/Say%20Thanks-!-1EAEDB.svg)](https://saythanks.io/to/xsahil03x) [![Twitter](https://img.shields.io/twitter/url/https/github.com/xsahil03x/giffy_dialog.svg?style=social)](https://twitter.com/intent/tweet?text=Wow:&url=https%3A%2F%2Fgithub.com%2Fxsahil03x%2Fgiffy_dialog)

<p>A beautiful and custom alert dialog for flutter highly inspired from <a href="https://github.com/Shashank02051997/FancyGifDialog-Android">FancyAlertDialog-Android</a>.</p>

The source code is **100% Dart**, and everything resides in the [/lib](https://github.com/xsahil03x/giffy_dialog/tree/master/lib) folder.


### Show some :heart: and star the repo to support the project

[![GitHub stars](https://img.shields.io/github/stars/xsahil03x/giffy_dialog.svg?style=social&label=Star)](https://github.com/xsahil03x/giffy_dialog) [![GitHub forks](https://img.shields.io/github/forks/xsahil03x/giffy_dialog.svg?style=social&label=Fork)](https://github.com/xsahil03x/giffy_dialog/fork) [![GitHub watchers](https://img.shields.io/github/watchers/xsahil03x/giffy_dialog.svg?style=social&label=Watch)](https://github.com/xsahil03x/giffy_dialog) [![GitHub followers](https://img.shields.io/github/followers/xsahil03x.svg?style=social&label=Follow)](https://github.com/xsahil03x/giffy_dialog)  
[![Twitter Follow](https://img.shields.io/twitter/follow/xsahil03x.svg?style=social)](https://twitter.com/xsahil03x)

[![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.svg?v=102)](https://opensource.org/licenses/MIT)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/xsahil03x/giffy_dialog/blob/master/LICENSE)
[![Build Status](https://travis-ci.com/xsahil03x/giffy_dialog.svg?branch=master)](https://travis-ci.com/xsahil03x/giffy_dialog)
[![CodeCov](https://codecov.io/gh/xsahil03x/giffy_dialog/branch/master/graph/badge.svg)](https://codecov.io/gh/xsahil03x/giffy_dialog)

# 💻 Installation
In the `dependencies:` section of your `pubspec.yaml`, add the following line:

[![Version](https://img.shields.io/pub/v/giffy_dialog.svg)](https://pub.dartlang.org/packages/giffy_dialog)

```yaml
dependencies:
  giffy_dialog: <latest version>
```


# ❔ Usage

### Import this class

```dart
import 'package:giffy_dialog/giffy_dialog.dart';
```

### Network giffy dialog

<img src="https://user-images.githubusercontent.com/25670178/51350453-379afc80-1ace-11e9-91b4-3ceea44e7bad.gif" align = "right" height = "350" alt="Network">

```dart
onPressed: () {
  showDialog(
  context: context,builder: (_) => NetworkGiffyDialog(
    imageUrl:"https://raw.githubusercontent.com/Shashank02051997/
              FancyGifDialog-Android/master/GIF's/gif14.gif",
    title: Text('Granny Eating Chocolate',
            textAlign: TextAlign.center,
            style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.w600)),
    description:Text('This is a granny eating chocolate dialog box.
          This library helps you easily create fancy giffy dialog',
          textAlign: TextAlign.center,
        ),
    entryAnimation: EntryAnimation.BOTTOM_TOP,
    onOkButtonPressed: () {},
  ) );
}
```

### Flare giffy dialog

<img src="https://user-images.githubusercontent.com/25670178/51350659-c576e780-1ace-11e9-94f2-ce463af2218a.gif" align = "right" height = "350" alt="Flare">

```dart
onPressed: () {
  showDialog(
  context: context,builder: (_) => FlareGiffyDialog(
    flarePath: 'assets/space_demo.flr',
    flareAnimation: 'loading',
    title: Text('Space Reloading',
           style: TextStyle(
           fontSize: 22.0, fontWeight: FontWeight.w600),
    ),
    description: Text('This is a space reloading dialog box.
          This library helps you easily create fancy flare dialog.',
          textAlign: TextAlign.center,
          style: TextStyle(),
        ),
    entryAnimation: EntryAnimation.DEFAULT,
    onOkButtonPressed: () {},
  ) );
}
```

### Asset giffy dialog

<img src="https://user-images.githubusercontent.com/25670178/51350846-4504b680-1acf-11e9-8f9d-d6704742ff21.gif" align = "right" height = "350" alt="Asset">

```dart
onPressed: () {
  showDialog(
  context: context,builder: (_) => AssetGiffyDialog(
    imagePath: 'assets/men_wearing_jacket.gif',
    title: Text('Men Wearing Jackets',
            style: TextStyle(
            fontSize: 22.0, fontWeight: FontWeight.w600),
    ),
    description: Text('This is a men wearing jackets dialog box.
          This library helps you easily create fancy giffy dialog.',
          textAlign: TextAlign.center,
          style: TextStyle(),
        ),
    entryAnimation: EntryAnimation.RIGHT_LEFT,
    onOkButtonPressed: () {},
  ) );
}
```

# 👍 How to Contribute
If you are interested in contributing to the project, please read [Contributing guide](CONTRIBUTING.md) and let us know!

## Contributors ✨

Thanks goes to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore -->
<table>
  <tr>
    <td align="center"><a href="https://github.com/ArtemKolichenkov"><img src="https://avatars3.githubusercontent.com/u/24019688?v=4" width="100px;" alt="ArtemKolichenkov"/><br /><sub><b>ArtemKolichenkov</b></sub></a><br /><a href="https://github.com/xsahil03x/giffy_dialog/commits?author=ArtemKolichenkov" title="Documentation">📖</a> <a href="#ideas-ArtemKolichenkov" title="Ideas, Planning, & Feedback">🤔</a></td>
    <td align="center"><a href="https://github.com/alejandrofierro"><img src="https://avatars1.githubusercontent.com/u/25576040?v=4" width="100px;" alt="Alex Fierro"/><br /><sub><b>Alex Fierro</b></sub></a><br /><a href="https://github.com/xsahil03x/giffy_dialog/commits?author=alejandrofierro" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/Kawaeee"><img src="https://avatars2.githubusercontent.com/u/26347733?v=4" width="100px;" alt="Kasidech C."/><br /><sub><b>Kasidech C.</b></sub></a><br /><a href="https://github.com/xsahil03x/giffy_dialog/commits?author=Kawaeee" title="Code">💻</a></td>
    <td align="center"><a href="http://www.fieldassist.in"><img src="https://avatars2.githubusercontent.com/u/13694349?v=4" width="100px;" alt="Jai Sachdeva"/><br /><sub><b>Jai Sachdeva</b></sub></a><br /><a href="#question-astralstriker" title="Answering Questions">💬</a></td>
    <td align="center"><a href="https://www.fb.com/TarekkMA1"><img src="https://avatars0.githubusercontent.com/u/6633545?v=4" width="100px;" alt="Tarekk Mohamed Abdalla"/><br /><sub><b>Tarekk Mohamed Abdalla</b></sub></a><br /><a href="https://github.com/xsahil03x/giffy_dialog/commits?author=TarekkMA" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/madhukesh048"><img src="https://avatars0.githubusercontent.com/u/31788197?v=4" width="100px;" alt="madhukesh_048"/><br /><sub><b>madhukesh_048</b></sub></a><br /><a href="https://github.com/xsahil03x/giffy_dialog/commits?author=madhukesh048" title="Tests">⚠️</a></td>
  </tr>
</table>

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind welcome!

# 📃 License

    Copyright (c) 2019 Sahil Kumar
    
    Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
    
    The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
    
    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

## Getting Started

For help getting started with Flutter, view our online [documentation](https://flutter.io/).

For help on editing package code, view the [documentation](https://flutter.io/developing-packages/).
