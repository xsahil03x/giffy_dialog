## 👍 How to Contribute

1.  Fork it
2.  Create your feature branch (git checkout -b my-new-feature)
3.  Commit your changes (git commit -am 'Add some feature')
4.  Push to the branch (git push origin my-new-feature)
5.  Create new Pull Request

## 📁 Project structure

`lib` - Giffy Dialog source code.  
`test` - widget tests.  
`example` - example app that uses Giffy Dialog.  

## 🧪 Running tests

Repo has Travis CI configured to run test on pull requests, so be sure to run tests locally before submitting PR.  
Run tests with `flutter test --no-test-assets` command.  
Option `--no-test-assets` is required since Flutter can't load assets for some reason. Might be resolved later. Read more [here](https://github.com/flutter/flutter/issues/32609).  
Testing `Image.network` requires `provideMockedNetworkImages` function from `image_test_utils` package. Read more in [Iiro Krankka blog](https://iirokrankka.com/2018/09/16/image-network-widget-tests/).

## 📝 Documentation

Projects contains documentation comments starting with `///` - this is [doc comments](https://dart.dev/guides/language/effective-dart/documentation#doc-comments),
[dartdoc](https://github.com/dart-lang/dartdoc) automatically generates [API reference](https://pub.dev/documentation/giffy_dialog/latest/) based on these comments.  

To generate documentation locally
1) Set FLUTTER_ROOT path to your flutter sdk directory
```shell
export FLUTTER_ROOT=~/flutter-sdk-path/flutter 
```
2) Use this command to generate the documentation
```shell
$FLUTTER_ROOT/bin/cache/dart-sdk/bin/dartdoc --exclude 'dart:async,dart:collection,dart:convert,dart:core,dart:developer,dart:io,dart:isolate,dart:math,dart:typed_data,dart:ui,dart:ffi,dart:html,dart:js,dart:js_util'
```

It will generate `/doc` directory where you'll find `api/index.html` containing locally generated documentation.
Documentation directory is added to .gitignore so it is not committed.