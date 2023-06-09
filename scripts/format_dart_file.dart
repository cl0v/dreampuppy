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

  //? B1 "ElevatedButton",
  //? B2 "TextButton",
  //? C1 "Container",
  //? C2 "Column",
  //? C3 "Center",
  //? C4 "Card",
  //? F1 "Form",
  //? L1 "ListView",
  //? L2 "ListTile",
  //? P1 "Placeholder",
  //? P2 "Padding",
  //? R1 "Row",
  //? S1 "SizedBox",
  //? T1 "Text",
  //? T2 "TextField",
  
  var findList = [
    'B1',
    'B2',
    'C1',
    'C2',
    'C3',
    'C4',
    'F1',
    'L1',
    'L2',
    'P1',
    'P2',
    'R1',
    'S1',
    'T1',
    'T2',
  ];

  var replaceList = [
    "ElevatedButton",
    "TextButton",
    "Container",
    "Column",
    "Center",
    "Card",
    "Form",
    "ListView",
    "ListTile",
    "Placeholder",
    "Padding",
    "Row",
    "SizedBox",
    "Text",
    "TextField",
  ];

  for (var i = 0; i < findList.length; i++) {
    code = code.replaceAll(findList[i], replaceList[i]);
  }

  await file.writeAsString(code);
}
