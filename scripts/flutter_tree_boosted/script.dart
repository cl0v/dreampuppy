import 'dart:core';
import 'dart:io';

/// Substitui os widgets pelos correspondentes.

/// Mapa que armazena todos os widgets que serão encurtados => expandidos
/// no lado das chaves, fica a forma encurtada, que geralmente segue um padão
/// de LetrasNumeros
/// No lado dos valores, fica os detalhes do widget.
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
    't': const FlutterWidgetParam(
      "",
      customValues: {
        0: "''",
        1: "'Titulo'",
        2: "'Subtitulo com mais coisas'",
        3: "'Body com coisas pra caralho brother, da pra escrever quase que por uns 40 segundos sem parar pra obter esse tipo de texto'"
      },
    ),
    's': const FlutterWidgetParam("style", customValues: {
      0: "TextStyle()",
    }),
    'st': const FlutterWidgetParam("style", customValues: {
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

/// Itens comuns aos botões
const Map<String, FlutterWidgetParam> buttonCommons = {
  'p': FlutterWidgetParam(
    "onPressed",
    customValues: {0: "null", 1: "(){}"},
  )
};

/// Itens comuns aos widget que tem altura e largura 
const Map<String, FlutterWidgetParam> boxCommons = {
  'h': FlutterWidgetParam('height'),
  'w': FlutterWidgetParam('width'),
};

/// Itens comuns aos multi-child-widgets (Column, Row, etc)
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

// Cria a versão "Expandida" do Widget
class FlutterWidget {
  /// Widget a ser usado (e.g SizedBox)
  final String widget;
  /// Parametros utilizados (e.g {"h" : "height"})
  final Map<String, FlutterWidgetParam>? params;

  FlutterWidget(
    this.widget, {
    this.params,
  });
}

// Armazena os parametros para que sejam tratados de forma única.
class FlutterWidgetParam {
  /// Nome do parametro (e.g onPressed)
  final String param;
  /// Valores customizados pre-definidos do parametro.
  /// Quando não definido, o valor numérico digitado após o short-param (e.g "w" ou "h")
  /// será o valor exatamente como digitado
  final Map<int, String>? customValues;

  const FlutterWidgetParam(
    this.param, {
    this.customValues,
  });
}

void main(List<String> arguments) async {
  final filePath = arguments[0];
  // Não faz nada caso não seja um arquivo .dart
  if (!filePath.contains(".dart")) {
    print("Is not a .dart file");
    return;
  }

  // Read the file
  var file = File(filePath);
  var code = await file.readAsString();

  code = formatScript(code);
  
  // Write the file
  await file.writeAsString(code);
}

/// Divide todo o código em pequenas linhas.
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
  // Separa os códigos em pares de {letras : numeros}
  final fragments = codeline.extract;
  // Caso não seja um comando que nos interessa (Não segue o padrão), apenas retorna a linha inteira.
  if (fragments.isEmpty) return codeline;
  final ReplaceEntity entity = buildEntity(fragments, codeline);
  return entity.line;
}

extension CodeStringManipulator on String {
  /// Separa os códigos em pares de {letras : numeros}
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

/// Constroi a entidade
ReplaceEntity buildEntity(Map<String, dynamic> fragments, String line) {
  return ReplaceEntity(
    command: getFirstEntry(fragments.entries.first),
    params: removeFirstEntry(fragments),
    codeLine: line,
  );
}

/// Recebe apenas o primeiro item do mapa, unindo a LetraNumero ({"S":1} => "S1")
String getFirstEntry(MapEntry entry) {
  return '${entry.key}${entry.value}';
}

/// Remove o primeiro item do mapa.
Map<String, dynamic> removeFirstEntry(Map<String, dynamic> map) {
  Map<String, dynamic> temp = map;
  if (map.isNotEmpty) {
    List<String> keys = map.keys.toList();
    temp.remove(keys.first);
  }
  return temp;
}

/// Entidade que representa o código a ser substituido.
class ReplaceEntity {
  /// Comando principal, geralmente os 2 ou 3 primeiros digitos (e.g "S1")
  final String command;
  /// Parametros do Widget (e.g "S1w32" => {"w": 32})
  final Map<String, dynamic>? params; 
  /// Linha do código antes da formatação.
  final String codeLine;

  ReplaceEntity({
    required this.command,
    required this.codeLine,
    this.params,
  });

  /// Retorna a linha do código já formatada.
  String get line => _replaceCode();

  _replaceCode() {
    /// Primeira aparição na linha de código RAW.
    final s = codeLine.indexOf(command);
    /// Conta quantos espaços brancos tem na linha de código RAW.
    int blankSpaces = codeLine.substring(0, s).length;
    /// Final da linha de código, geralmente finaliza com um "("
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

  /// Posiciona os parametros de forma correta (Formatada).
  //TODO: Ajustar para parametros não nomeados.
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