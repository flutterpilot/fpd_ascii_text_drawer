/// FPD ASCII Text Drawer
///
/// Un package para convertir texto a arte ASCII usando diferentes fuentes.
///
/// ## Uso básico
///
/// ```dart
/// import 'package:fpd_ascii_text_drawer/fpd_ascii_text_drawer.dart';
///
/// void main() async {
///   // Convertir texto a ASCII art
///   final asciiArt = await AsciiTextService.convertToAscii('Hello World');
///   print(asciiArt);
///
///   // Usar una fuente específica
///   final bigText = await AsciiTextService.convertToAscii(
///     'FPD Tools',
///     font: 'Big',
///   );
///   print(bigText);
///
///   // Obtener fuentes disponibles
///   final fonts = AsciiTextService.getAvailableFonts();
///   print('Fuentes disponibles: ${fonts.length}');
/// }
/// ```
///
/// ## Características
///
/// - ✅ Más de 400 fuentes ASCII art disponibles
/// - ✅ Conversión asíncrona de texto
/// - ✅ Soporte para ancho personalizado
/// - ✅ Manejo de errores robusto
/// - ✅ Validación de fuentes
/// - ✅ API simple y fácil de usar
///
/// ## Fuentes populares
///
/// - `Standard` - Fuente clásica
/// - `Big` - Texto grande y llamativo
/// - `Block` - Estilo de bloques
/// - `Shadow` - Con sombra
/// - `3D` - Efecto 3D
/// - `Star Wars` - Estilo Star Wars
/// - `Bloody` - Estilo sangriento
/// - `Gothic` - Estilo gótico
///
/// ## Manejo de errores
///
/// ```dart
/// try {
///   final result = await AsciiTextService.convertToAscii('Hello', font: 'InvalidFont');
///   print(result);
/// } on AsciiTextException catch (e) {
///   print('Error: ${e.message}');
/// }
/// ```
export 'src/services/ascii_text_service.dart';
