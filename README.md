# fpd_ascii_text_drawer

🎨 **FPD ASCII Text Drawer** - Un package Dart para convertir texto a arte ASCII usando más de 400 fuentes diferentes.

## ✨ Características

- 🎭 **400+ fuentes** ASCII art disponibles
- ⚡ **Conversión asíncrona** de texto
- 📏 **Ancho personalizable** para el texto
- 🛡️ **Manejo robusto de errores**
- ✅ **Validación de fuentes**
- 📱 **API simple y fácil de usar**
- 🧪 **Tests completos**
- 📚 **Documentación detallada**

## 🚀 Instalación

Agrega la dependencia a tu `pubspec.yaml`:

```yaml
dependencies:
  fpd_ascii_text_drawer: ^1.0.0
```

Luego ejecuta:

```bash
dart pub get
```

## 📖 Uso básico

```dart
import 'package:fpd_ascii_text_drawer/fpd_ascii_text_drawer.dart';

void main() async {
  // Conversión básica
  final asciiArt = await AsciiTextService.convertToAscii('Hello World');
  print(asciiArt);
  
  // Con fuente específica
  final bigText = await AsciiTextService.convertToAscii(
    'FPD Tools',
    font: 'Big',
  );
  print(bigText);
}
```

## 🎭 Fuentes populares

| Fuente | Descripción | Ejemplo |
|--------|-------------|---------|
| `Standard` | Fuente clásica | `Hello` |
| `Big` | Texto grande y llamativo | `Hello` |
| `Block` | Estilo de bloques | `Hello` |
| `Shadow` | Con sombra | `Hello` |
| `3D` | Efecto 3D | `Hello` |
| `Star Wars` | Estilo Star Wars | `Hello` |
| `Bloody` | Estilo sangriento | `Hello` |
| `Gothic` | Estilo gótico | `Hello` |

## 🔧 API Reference

### AsciiTextService

#### `convertToAscii(String text, {String font = 'Standard', int? width})`

Convierte texto a arte ASCII.

**Parámetros:**
- `text` - El texto a convertir
- `font` - La fuente a usar (por defecto 'Standard')
- `width` - El ancho máximo del texto (opcional)

**Retorna:** `Future<String>` - El texto convertido a ASCII art

**Ejemplo:**
```dart
final result = await AsciiTextService.convertToAscii(
  'Hello World',
  font: 'Big',
  width: 80,
);
```

#### `getAvailableFonts()`

Obtiene la lista de todas las fuentes disponibles.

**Retorna:** `List<String>` - Lista inmutable de fuentes

**Ejemplo:**
```dart
final fonts = AsciiTextService.getAvailableFonts();
print('Total de fuentes: ${fonts.length}');
```

#### `isFontAvailable(String font)`

Verifica si una fuente está disponible.

**Parámetros:**
- `font` - El nombre de la fuente a verificar

**Retorna:** `bool` - true si la fuente está disponible

**Ejemplo:**
```dart
if (AsciiTextService.isFontAvailable('Big')) {
  // Usar la fuente Big
}
```

## 🛡️ Manejo de errores

El package lanza `AsciiTextException` cuando ocurre un error:

```dart
try {
  final result = await AsciiTextService.convertToAscii('Hello', font: 'InvalidFont');
  print(result);
} on AsciiTextException catch (e) {
  print('Error: ${e.message}');
  print('Código de estado: ${e.statusCode}');
}
```

## 📝 Ejemplos completos

### Ejemplo 1: Conversión con diferentes fuentes

```dart
import 'package:fpd_ascii_text_drawer/fpd_ascii_text_drawer.dart';

void main() async {
  final fonts = ['Standard', 'Big', 'Block', 'Shadow'];
  
  for (final font in fonts) {
    try {
      print('\n📖 Fuente: $font');
      final result = await AsciiTextService.convertToAscii('FPD', font: font);
      print(result);
    } on AsciiTextException catch (e) {
      print('Error con fuente $font: ${e.message}');
    }
  }
}
```

### Ejemplo 2: Con ancho personalizado

```dart
final result = await AsciiTextService.convertToAscii(
  'Este es un texto largo que se ajustará al ancho especificado',
  font: 'Standard',
  width: 40,
);
print(result);
```

### Ejemplo 3: Información sobre fuentes

```dart
final availableFonts = AsciiTextService.getAvailableFonts();
print('Total de fuentes disponibles: ${availableFonts.length}');

final popularFonts = ['Standard', 'Big', 'Block', 'Shadow', '3D', 'Star Wars'];
for (final font in popularFonts) {
  final isAvailable = AsciiTextService.isFontAvailable(font);
  print('$font: ${isAvailable ? '✅' : '❌'}');
}
```

## 🧪 Testing

Ejecuta los tests:

```bash
dart test
```

Ejecuta el ejemplo:

```bash
dart run example/example.dart
```

## 📊 Rendimiento

- **Conversión rápida**: La mayoría de conversiones se completan en menos de 1 segundo
- **Manejo eficiente**: Soporte para múltiples requests simultáneos
- **Caché inteligente**: Optimizado para requests repetidos

## 🤝 Contribuir

¡Las contribuciones son bienvenidas! Por favor:

1. Fork el repositorio
2. Crea una rama para tu feature (`git checkout -b feature/amazing-feature`)
3. Commit tus cambios (`git commit -m 'Add amazing feature'`)
4. Push a la rama (`git push origin feature/amazing-feature`)
5. Abre un Pull Request

## 📄 Licencia

Este proyecto está licenciado bajo la Licencia MIT - ver el archivo [LICENSE](LICENSE) para detalles.

## 🙏 Agradecimientos

- [figlet](http://www.figlet.org/) - Librería original de ASCII art
- [FlutterPilot](https://flutterpilot.dev) - Plataforma de desarrollo

## 📞 Soporte

- 📧 Email: support@flutterpilot.dev
- 🐛 Issues: [GitHub Issues](https://github.com/flutterpilot/fpd_ascii_text_drawer/issues)
- 📖 Documentación: [GitHub README](https://github.com/flutterpilot/fpd_ascii_text_drawer#readme)

---

**Desarrollado con ❤️ por el equipo FlutterPilot**
