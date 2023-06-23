import 'dart:core';
import 'dart:io';

const Map<String, FlutterWidgetParam> buttonCommons = {
  'p': FlutterWidgetParam(
    "onPressed",
    customValues: {0: "null", 1: "(){}"},
  )
};

const Map<String, FlutterWidgetParam> boxCommons = {
  'h': FlutterWidgetParam('height'),
  'w': FlutterWidgetParam('width'),
};

const Map<String, FlutterWidgetParam> multiChildCommons = {
  'm': FlutterWidgetParam('mainAxisAlignment', customValues: {
    0: "MainAxisAlignment.start",
    1: "MainAxisAlignment.center",
    2: "MainAxisAlignment.end",
    3: "MainAxisAlignment.spaceBetween",
    4: "MainAxisAlignment.spaceAround",
    5: "MainAxisAlignment.spaceEvenly",
  }),
  'c': FlutterWidgetParam('crossAxisAlignment', customValues: {
    0: "CrossAxisAlignment.start",
    1: "CrossAxisAlignment.center",
    2: "CrossAxisAlignment.end",
    4: "CrossAxisAlignment.stretch",
    5: "CrossAxisAlignment.baseline",
  }),
};

Map<String, FlutterWidget> findReplaceMap = {
  'B1': FlutterWidget("ElevatedButton", params: buttonCommons),
  'B2': FlutterWidget("TextButton", params: buttonCommons),
  'Bc1': FlutterWidget("BtnLoading", params: buttonCommons),
  'C1': FlutterWidget("Container"),
  'C2': FlutterWidget("Column", params: multiChildCommons),
  'C3': FlutterWidget("Center"),
  'C4': FlutterWidget("Card"),
  'F1': FlutterWidget("Form"),
  'L1': FlutterWidget("ListView"),
  'L2': FlutterWidget("ListTile"),
  'P1': FlutterWidget("Placeholder"),
  'P2': FlutterWidget("Padding"),
  'R1': FlutterWidget("Row", params: multiChildCommons),
  'S1': FlutterWidget("SizedBox", params: boxCommons),
  'T1': FlutterWidget("Text", params: {
    't': FlutterWidgetParam(
      "",
      customValues: {
        0: "''",
        1: "'Titulo'",
        2: "'Subtitulo com mais coisas'",
        3: "'Body com coisas pra caralho brother, da pra escrever quase que por uns 40 segundos sem parar pra obter esse tipo de texto'"
      },
    ),
    's': FlutterWidgetParam("style", customValues: {
      0: "TextStyle()",
    }),
    'st': FlutterWidgetParam("style", customValues: {
      0: "Theme.of(context).textTheme",
      1: "Theme.of(context).textTheme.headlineLarge",
      2: "Theme.of(context).textTheme.headlineMedium",
      3: "Theme.of(context).textTheme.headlineSmall",
      4: "Theme.of(context).textTheme.bodyLarge",
      5: "Theme.of(context).textTheme.bodyMedium",
      6: "Theme.of(context).textTheme.bodySmall",
    }),
  }),
  'T2': FlutterWidget("TextField"),
  'Tc1': FlutterWidget("CustomTextFieldWidget"),
};

class FlutterWidget {
  final String widget;
  final Map<String, FlutterWidgetParam>? params;

  FlutterWidget(
    this.widget, {
    this.params,
  });
}

class FlutterWidgetParam {
  final String param;
  final Map<int, String>? customValues;

  const FlutterWidgetParam(
    this.param, {
    this.customValues,
  });
}

void main(List<String> arguments) async {
  final filePath = arguments[0];

  if (!filePath.contains(".dart")) {
    print("Is not a .dart file");
    return;
  }

  // Read the file
  var file = File(filePath);
  var code = await file.readAsString();

  code = formatScript(code);

  await file.writeAsString(code);
}

String formatScript(String code) =>
    code.split('\n').map((String line) => formatLine(line)).join('\n');

String formatLine(String codeline) {
  // Ignore lines which do not contain numbers
  if (!codeline.contains(RegExp(r'[0-9]'))) {
    return codeline;
  }
  return _formattedLine(codeline);
}

String _formattedLine(String codeline) {
  final fragments = codeline.extract;
  if (fragments.isEmpty) return codeline;
  final ReplaceEntity entity = buildEntity(fragments, codeline);
  return entity.line;
}

extension CodeStringManipulator on String {
  Map<String, dynamic> get extract {
    RegExp regExp = RegExp(r'([a-zA-Z]+)(\d+)');
    Iterable<Match> matches = regExp.allMatches(this);

    Map<String, String> extractedMap = {};

    for (Match match in matches) {
      String key = match.group(1)!;
      String value = match.group(2)!;
      extractedMap[key] = value;
    }

    return extractedMap;
  }
}

ReplaceEntity buildEntity(Map<String, dynamic> fragments, String line) {
  return ReplaceEntity(
    command: getFirstEntry(fragments.entries.first),
    params: removeFirstEntry(fragments),
    codeLine: line,
  );
}

String getFirstEntry(MapEntry entry) {
  return '${entry.key}${entry.value}';
}

Map<String, dynamic> removeFirstEntry(Map<String, dynamic> map) {
  Map<String, dynamic> temp = map;
  if (map.isNotEmpty) {
    List<String> keys = map.keys.toList();
    temp.remove(keys.first);
  }
  return temp;
}

class ReplaceEntity {
  final String command; // e.g "S1"
  final Map<String, dynamic>? params; // "S1w32" => {"w": 32}
  final String codeLine;

  ReplaceEntity({
    required this.command,
    required this.codeLine,
    this.params,
  });

  String get line => _replaceCode();

  _replaceCode() {
    final s = codeLine.indexOf(command);
    int blankSpaces = codeLine.substring(0, s).length;
    final e = codeLine.lastIndexOf('(');
    final FlutterWidget val = findReplaceMap[command]!;
    String expandedParams = "";
    if (val.params != null) {
      expandedParams = mapToString(val.params!, params, blankSpaces);
    }
    final tempString = "${val.widget}($expandedParams";

    String temp = codeLine.replaceRange(s, e + 1, tempString);

    return temp;
  }

  String mapToString(Map<String, FlutterWidgetParam> ref,
      Map<String, dynamic>? p, int blankSpaces) {
    List<String> fragments = [];

    p?.forEach((key, value) {
      // Procura pelos parametros dentro do custom, caso custom seja null, retorna o valor que está digitado
      final v = ref[key]?.customValues?[int.tryParse(value)] ?? value;
      fragments
          .add("${ref[key]!.param}${ref[key]!.param.isNotEmpty ? ':' : ''} $v");
    });

    if (fragments.isNotEmpty) {
      return '\n${' ' * (blankSpaces + 2)}${fragments.join(",\n${' ' * (blankSpaces + 2)}")},';
    }
    return fragments.join("");
  }
}
