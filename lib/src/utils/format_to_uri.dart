formatToUri(String text)=>_replaceSpaces(_removeAcentos(text));

String _removeAcentos(String texto) {
  var acentos = 'ÁÀÂÃÄáàâãäÉÈÊËéèêëÍÌÎÏíìîïÓÒÔÕÖóòôõöÚÙÛÜúùûüÇçÑñÝýÿ';
  var semAcentos = 'AAAAAaaaaaEEEEeeeeIIIIiiiiOOOOOoooooUUUUuuuuCcNnYyy';

  for (int i = 0; i < acentos.length; i++) {
    texto = texto.replaceAll(acentos[i], semAcentos[i]);
  }

  return texto;
}

String _replaceSpaces(String texto) {
  return texto.replaceAll(' ', '_');
}
