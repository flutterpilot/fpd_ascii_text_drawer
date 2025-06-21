# Development Checklist - FpdAsciiTextDrawer

## 🚀 Setup Inicial

### Entorno de Desarrollo
- [ ] Dart SDK ≥ 3.7.0 instalado

- [ ] IDE configurado (VS Code/IntelliJ)
- [ ] Extensiones Dart/Flutter instaladas
- [ ] Git configurado

### Proyecto
- [ ] `dart pub get` ejecutado sin errores
- [ ] `dart analyze` sin warnings/errors
- [ ] `dart test` pasa todos los tests
- [ ] `dart format` aplicado

## 📝 Antes de Cada Feature

### Planificación
- [ ] Requirement claramente definido
- [ ] Design/Architecture discutido
- [ ] Breaking changes identificados
- [ ] Tests strategy definida

### Branch Setup
- [ ] Nueva branch desde main/develop
- [ ] Naming convention seguido (`feature/`, `fix/`, `refactor/`)
- [ ] Branch actualizada con latest changes

## 💻 Durante el Desarrollo

### Código
- [ ] Seguir naming conventions
- [ ] Documentar APIs públicas
- [ ] Implementar error handling
- [ ] Evitar código duplicado
- [ ] Usar tipos no-nullable cuando sea posible

### Testing
- [ ] Tests unitarios para nueva lógica

- [ ] Tests de edge cases
- [ ] Mocks para dependencias externas
- [ ] Coverage ≥ 80% mantenido

### Performance
- [ ] No operaciones costosas en main thread
- [ ] Memory leaks verificados
- [ ] Lazy loading implementado donde corresponde


## 🔍 Code Review

### Self Review
- [ ] Código formateado (`dart format`)
- [ ] Análisis estático limpio (`dart analyze`)
- [ ] Tests pasando (`dart test`)
- [ ] Documentación actualizada
- [ ] TODO/FIXME comentarios resueltos

### PR Preparation
- [ ] Descripción clara del cambio
- [ ] Screenshots/GIFs para UI changes
- [ ] Breaking changes documentados
- [ ] Migration guide si es necesario

## 📦 Build & Deploy

### Pre-build
- [ ] Version bumped siguiendo semver
- [ ] CHANGELOG.md actualizado
- [ ] Documentation generada
- [ ] Example app funciona

### Build Verification
- [ ] `dart compile exe` exitoso
- [ ] No warnings en build
- [ ] Tests en CI pasando

### Quality Checks
- [ ] Linting rules aplicadas
- [ ] Security scan realizado
- [ ] Dependencias audit ejecutado
- [ ] Performance benchmarks verificados

## 🧪 Testing Checklist

### Unit Tests
- [ ] Funciones puras testeadas
- [ ] Edge cases cubiertos
- [ ] Error conditions testeadas
- [ ] Mocks utilizados apropiadamente

### Integration Tests
- [ ] API endpoints testeados
- [ ] Database operations verificadas
- [ ] External services mocked
- [ ] Error scenarios cubiertos

## 📊 Performance Checklist

### Memory
- [ ] No memory leaks detectados
- [ ] Resources properly disposed
- [ ] Caching strategy implementada
- [ ] Large objects release verificado

### Speed
- [ ] Function execution time optimizada
- [ ] Database queries eficientes
- [ ] Network calls minimizadas
- [ ] Async operations non-blocking

## 🔒 Security Checklist

### Code Security
- [ ] No hardcoded secrets/keys
- [ ] Input validation implementada
- [ ] SQL injection prevention
- [ ] XSS protection (si aplica)

### Data Security
- [ ] Sensitive data encrypted
- [ ] Secure communication (HTTPS)
- [ ] Authentication implemented
- [ ] Authorization checks en place

## 📱 Compatibility Checklist

### Dart Versions
- [ ] Minimum Dart SDK especificado
- [ ] Latest Dart features utilizadas apropiadamente
- [ ] Backwards compatibility mantenida

### Platforms
- [ ] Cross-platform compatibility verificada
- [ ] Platform-specific code properly isolated
- [ ] Conditional imports utilizados correctamente

## 📝 Documentation Checklist

### Code Documentation
- [ ] Public APIs documentadas
- [ ] Complex logic explicada
- [ ] Examples incluidos en doc comments
- [ ] Return types y exceptions documentados

### Project Documentation
- [ ] README.md actualizado
- [ ] API documentation generada
- [ ] Examples actualizados
- [ ] Migration guides escritas (si aplica)

## ✅ Final Checks

### Before Merge
- [ ] All CI checks passing
- [ ] Code review approved
- [ ] Conflicts resolved
- [ ] Feature branch up to date

### Before Release
- [ ] Version tags creados
- [ ] Release notes escritas
- [ ] Backwards compatibility verificada
- [ ] Rollback plan definido

---

**Tip**: Marca cada item antes de considerar la tarea completa. ¡La calidad es responsabilidad de todos! 🎯
