import 'dart:io';

main() {
  var dir = Directory('');

  if (dir.existsSync()) {
    print('Directory already exists');
  } else {
    dir.createSync();
    if (dir.existsSync()) {
      print('Directory created');
    }
  }
}

