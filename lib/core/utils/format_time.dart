int formatTime(String timeInit, String timeEnd) {
  final timeInitHour = timeInit.split(':')[0];
  final timeEndHour = timeEnd.split(':')[0];

  return int.parse(timeEndHour) - int.parse(timeInitHour);
}
