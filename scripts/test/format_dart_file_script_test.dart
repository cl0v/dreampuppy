import '../format_dart_file_script.dart';

void main() {
  final result = formatScript(codeIn);
  final s1 = result.split('');
  final s2 = codeOut.split('');

  print(s1.length);
  print(s2.length);
  print(result);

  print(result == codeOut);
}

final codeIn = '''import 'package:flutter/material.dart';

class TempPage extends StatefulWidget {
  const TempPage({super.key});

  @override
  State<TempPage> createState() => _TempPageState();
}

class _TempPageState extends State<TempPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: C3(
      child: C2(
        children: <Widget>[
          S1(
            child: P1(
              child: L1(),
            ),
          ),
          S1(
            child: P1(
              child: L1(),
            ),
          ),
          S1(
            child: P1(
              child: L1(),
            ),
          ),
          B1(),
        ],
      ),
    ));
  }
}''';

final codeIn2 = '''C3(
        child: C2(
          children: <Widget>[
            S1(
              child: P1(),
            ),
            SizedBox(
              height: 36,
              width: 128,
              child: Placeholder(),
            ),
            B1p0(
              child: T1t0(),
            )
          ],
        ),
      )''';

final codeOut = '''Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              child: Placeholder(),
            ),
            SizedBox(
              height: 36,
              width: 128,
              child: Placeholder(),
            ),
            ElevatedButton(
              onPressed: null,
              child: Text(
                        '',),
            )
          ],
        ),
      )''';
