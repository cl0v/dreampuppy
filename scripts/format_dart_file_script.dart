import 'dart:io';

void main(List<String> arguments) async {
  final filePath = arguments[0];
  if (!filePath.contains(".dart")) {
    print("Is not a .dart file");
    return;
  }

  // Read the file
  var file = File(filePath);
  var code = await file.readAsString();

  Map<String, String> findReplaceMap = {
    'B1': "ElevatedButton",
    'B2': "TextButton",
    'Bc1': "BtnLoading",
    'C1': "Container",
    'C2': "Column",
    'C3': "Center",
    'C4': "Card",
    'F1': "Form",
    'L1': "ListView",
    'L2': "ListTile",
    'P1': "Placeholder",
    'P2': "Padding",
    'R1': "Row",
    'S1': "SizedBox",
    'T1': "Text",
    'T2': "TextField",
    'Tc1': "CustomTextFieldWidget",
  };

  for (var i = 0; i < findReplaceMap.length; i++) {
    final k = findReplaceMap.keys.toList()[i];
    final v = findReplaceMap.values.toList()[i];
    code = code.replaceAll(k, v);
  }

  await file.writeAsString(code);
}
