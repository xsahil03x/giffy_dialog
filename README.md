# 👏 Giffy Dialogs

[![Say Thanks!](https://img.shields.io/badge/Say%20Thanks-!-1EAEDB.svg)](https://saythanks.io/to/xsahil03x) [![Twitter](https://img.shields.io/twitter/url/https/github.com/xsahil03x/giffy_dialog.svg?style=social)](https://twitter.com/intent/tweet?text=Wow:&url=https%3A%2F%2Fgithub.com%2Fxsahil03x%2Fgiffy_dialog)

<p>A beautiful and custom alert dialog for flutter highly inspired from <a href="https://github.com/Shashank02051997/FancyGifDialog-Android">FancyAlertDialog-Android</a>.</p>

The source code is **100% Dart**, and everything resides in the [/lib](https://github.com/xsahil03x/giffy_dialog/tree/master/lib) folder.


### Show some :heart: and star the repo to support the project

[![GitHub stars](https://img.shields.io/github/stars/xsahil03x/giffy_dialog.svg?style=social&label=Star)](https://github.com/xsahil03x/giffy_dialog) [![GitHub forks](https://img.shields.io/github/forks/xsahil03x/giffy_dialog.svg?style=social&label=Fork)](https://github.com/xsahil03x/giffy_dialog/fork) [![GitHub watchers](https://img.shields.io/github/watchers/xsahil03x/giffy_dialog.svg?style=social&label=Watch)](https://github.com/xsahil03x/giffy_dialog) [![GitHub followers](https://img.shields.io/github/followers/xsahil03x.svg?style=social&label=Follow)](https://github.com/xsahil03x/giffy_dialog)  
[![Twitter Follow](https://img.shields.io/twitter/follow/xsahil03x.svg?style=social)](https://twitter.com/xsahil03x)

[![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.svg?v=102)](https://opensource.org/licenses/MIT)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/xsahil03x/giffy_dialog/blob/master/LICENSE)
[![Build Status](https://travis-ci.com/aagarwal1012/Animated-Text-Kit.svg?token=pXLTRcXnVLpccbxqiWBi&branch=master)](https://travis-ci.com/xsahil03x/giffy_dialog)

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
    onOkButtonPressed: () {},
  ) );
}
```

# 👍 How to Contribute
1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request

# 📃 License

    Copyright (c) 2019 Sahil Kumar
    
    Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
    
    The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
    
    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

## Getting Started

For help getting started with Flutter, view our online [documentation](https://flutter.io/).

For help on editing package code, view the [documentation](https://flutter.io/developing-packages/).
