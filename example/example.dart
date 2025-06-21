import 'package:fpd_ascii_text_drawer/fpd_ascii_text_drawer.dart';

/// Ejemplo de uso del package fpd_ascii_text_drawer
void main() async {
  print('🎨 FPD ASCII Text Drawer - Ejemplo de uso\n');

  // Ejemplo 1: Conversión básica
  print('📝 Ejemplo 1: Conversión básica');
  try {
    final result = await AsciiTextService.convertToAscii('Hello World');
    print(result);
  } on AsciiTextException catch (e) {
    print('Error: ${e.message}');
  }

  print('\n' + '=' * 50 + '\n');

  // Ejemplo 2: Diferentes fuentes
  print('🎭 Ejemplo 2: Diferentes fuentes');
  final fonts = ['Big', 'Block', 'Shadow', 'Star Wars'];

  for (final font in fonts) {
    try {
      print('\n📖 Fuente: $font');
      final result = await AsciiTextService.convertToAscii('FPD', font: font);
      print(result);
    } on AsciiTextException catch (e) {
      print('Error con fuente $font: ${e.message}');
    }
  }

  print('\n' + '=' * 50 + '\n');

  // Ejemplo 3: Con ancho personalizado
  print('📏 Ejemplo 3: Con ancho personalizado');
  try {
    final result = await AsciiTextService.convertToAscii(
      'Este es un texto largo que se ajustará al ancho especificado',
      font: 'Standard',
      width: 40,
    );
    print(result);
  } on AsciiTextException catch (e) {
    print('Error: ${e.message}');
  }

  print('\n' + '=' * 50 + '\n');

  // Ejemplo 4: Información sobre fuentes
  print('ℹ️  Ejemplo 4: Información sobre fuentes');
  final availableFonts = AsciiTextService.getAvailableFonts();
  print('Total de fuentes disponibles: ${availableFonts.length}');

  // Mostrar algunas fuentes populares
  final popularFonts = [
    'Standard',
    'Big',
    'Block',
    'Shadow',
    '3D',
    'Star Wars',
  ];
  print('\nFuentes populares:');
  for (final font in popularFonts) {
    final isAvailable = AsciiTextService.isFontAvailable(font);
    print('  $font: ${isAvailable ? '✅' : '❌'}');
  }

  print('\n' + '=' * 50 + '\n');

  // Ejemplo 5: Manejo de errores
  print('⚠️  Ejemplo 5: Manejo de errores');
  try {
    final result = await AsciiTextService.convertToAscii(
      'Test',
      font: 'FuenteInexistente',
    );
    print(result);
  } on AsciiTextException catch (e) {
    print('Error capturado: ${e.message}');
    print('Código de estado: ${e.statusCode}');
  }

  print('\n' + '=' * 50 + '\n');

  // Ejemplo 6: Texto vacío
  print('🔍 Ejemplo 6: Texto vacío');
  try {
    final result = await AsciiTextService.convertToAscii('');
    print('Resultado: "${result}" (longitud: ${result.length})');
  } on AsciiTextException catch (e) {
    print('Error: ${e.message}');
  }

  print('\n🎉 ¡Ejemplos completados!');
}
