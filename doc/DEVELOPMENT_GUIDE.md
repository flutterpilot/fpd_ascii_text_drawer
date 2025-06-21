# Guía de Desarrollo - FpdAsciiTextDrawer

Esta guía contiene las mejores prácticas y patrones de desarrollo para este proyecto package.

## 🏗️ Arquitectura

### Estructura del Proyecto
```
fpd_ascii_text_drawer/
├── lib/
│   ├── fpd_ascii_text_drawer.dart          # API pública
│   └── src/                          # Implementación interna
├── test/                             # Tests unitarios
├── example/                          # Ejemplos de uso
├── doc/                              # Documentación
└── pubspec.yaml                      # Configuración
```

### Principios de Diseño
- **Single Responsibility**: Cada clase tiene una única responsabilidad
- **Open/Closed**: Abierto para extensión, cerrado para modificación
- **Dependency Inversion**: Depender de abstracciones, no de concreciones

## 🎨 Convenciones de Código

### Naming
- **Packages**: snake_case (`fpd_ascii_text_drawer`)
- **Classes**: PascalCase (`FpdAsciiTextDrawer`)
- **Variables/Functions**: camelCase (`getValue`)
- **Constants**: lowerCamelCase (`defaultValue`)

### Documentación
- Documentar todas las APIs públicas
- Usar `///` para doc comments
- Incluir ejemplos en la documentación

```dart
/// Calculates the sum of two numbers.
/// 
/// Example:
/// ```dart
/// final result = add(2, 3); // Returns 5
/// ```
int add(int a, int b) => a + b;
```

## 🧪 Testing

### Estructura de Tests
- Un archivo de test por clase
- Usar `group()` para organizar tests relacionados
- Naming descriptivo para tests

```dart
group('FpdAsciiTextDrawer', () {
  test('should return correct value when valid input', () {
    // Arrange
    final instance = FpdAsciiTextDrawer();
    
    // Act
    final result = instance.process('valid');
    
    // Assert
    expect(result, equals('expected'));
  });
});
```

### Coverage
- Mantener coverage mínimo del 80%
- Priorizar tests de lógica crítica
- Usar mocks para dependencias externas

## 🚀 Performance

### Mejores Prácticas
- Evitar operaciones costosas en constructores
- Usar `const` constructors cuando sea posible
- Implementar `toString()` eficientemente
- Considerar lazy loading para recursos pesados

## 🔒 Seguridad

### Validación de Input
- Validar todos los inputs externos
- Sanitizar data del usuario
- Usar tipos seguros (non-nullable)

### Manejo de Errores
- Usar exceptions específicas
- Proporcionar mensajes de error útiles
- Documentar exceptions que pueden lanzarse

## 📦 Dependencias

### Gestión
- Mantener dependencias actualizadas
- Revisar regularmente vulnerabilidades
- Usar versiones específicas en production

### Análisis
```bash
# Analizar dependencias obsoletas
dart pub outdated

# Analizar vulnerabilidades
dart pub deps
```

## 🔄 CI/CD

### Pre-commit Hooks
- Formateo automático
- Análisis estático
- Tests unitarios

### Pipeline
1. **Análisis**: `dart analyze`
2. **Tests**: `dart test --coverage`
3. **Formato**: `dart format --set-exit-if-changed .`
4. **Build**: Verificar que compila

## 📝 Versionado

### Semantic Versioning
- **MAJOR**: Cambios incompatibles
- **MINOR**: Nueva funcionalidad compatible
- **PATCH**: Bug fixes compatibles

### Changelog
- Mantener CHANGELOG.md actualizado
- Seguir formato [Keep a Changelog](https://keepachangelog.com/)
- Documentar breaking changes claramente

## 🤝 Contribución

Ver [CONTRIBUTING.md](../CONTRIBUTING.md) para detalles sobre cómo contribuir.

## 📚 Recursos

- [Effective Dart](https://dart.dev/guides/language/effective-dart)
- [Flutter Best Practices](https://docs.flutter.dev/development/best-practices)
- [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)
