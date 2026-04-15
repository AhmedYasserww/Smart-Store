import 'dart:ui';

Color hexToColor(String hex) {
  final normalized = hex.replaceAll('#', '');
  return Color(int.parse('FF$normalized', radix: 16));
}