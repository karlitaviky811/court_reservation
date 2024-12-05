String formatDate(String value) {
  List<String> months = [
    'enero',
    'febrero',
    'marzo',
    'abril',
    'mayo',
    'junio',
    'julio',
    'agosto',
    'septiembre',
    'octumbre',
    'noviembre',
    'diciembre',
  ];

  List<String> splitDate = value.split('/');

  return '${splitDate[1]} de ${months[int.parse(splitDate[0])]} ${splitDate[2]}';
}
