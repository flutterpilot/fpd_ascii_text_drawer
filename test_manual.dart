import 'package:fpd_ascii_text_drawer/fpd_ascii_text_drawer.dart';

void main() async {
  print('🎨 Probando FPD ASCII Text Drawer\n');

  // Prueba 1: Texto simple
  print('📝 Prueba 1: "HOLA"');
  try {
    final result = await AsciiTextService.convertToAscii('HOLA');
    print(result);
  } catch (e) {
    print('Error: $e');
  }

  print('\n' + '=' * 40 + '\n');

  // Prueba 2: Con fuente Big
  print('📝 Prueba 2: "FPD" con fuente Big');
  try {
    final result = await AsciiTextService.convertToAscii('FPD', font: 'Big');
    print(result);
  } catch (e) {
    print('Error: $e');
  }

  print('\n' + '=' * 40 + '\n');

  // Prueba 3: Números
  print('📝 Prueba 3: "12345"');
  try {
    final result = await AsciiTextService.convertToAscii('12345');
    print(result);
  } catch (e) {
    print('Error: $e');
  }

  print('\n' + '=' * 40 + '\n');

  // Prueba 4: Caracteres especiales
  print('📝 Prueba 4: "HOLA!"');
  try {
    final result = await AsciiTextService.convertToAscii('HOLA!');
    print(result);
  } catch (e) {
    print('Error: $e');
  }

  print('\n' + '=' * 40 + '\n');

  // Prueba 5: Información de fuentes
  print('📝 Prueba 5: Fuentes disponibles');
  final fonts = AsciiTextService.getAvailableFonts();
  print('Total de fuentes: ${fonts.length}');
  print('Fuentes: ${fonts.join(', ')}');

  print('\n🎉 ¡Pruebas completadas!');
}
