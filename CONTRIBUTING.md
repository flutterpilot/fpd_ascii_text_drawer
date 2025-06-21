# Contributing to FpdAsciiTextDrawer

We're excited that you're interested in contributing! This document outlines the process for contributing to this project.

## 🤝 Code of Conduct

By participating in this project, you agree to abide by our code of conduct:

- **Be respectful** and inclusive
- **Be constructive** in discussions and feedback
- **Focus on the best outcome** for the community
- **Show empathy** towards other community members

## 🚀 Getting Started

### Development Setup

1. **Fork the repository**
   ```bash
   git clone https://github.com/yourusername/fpd_ascii_text_drawer.git
   cd fpd_ascii_text_drawer
   ```

2. **Install dependencies**
   ```bash
   dart pub get
   ```

3. **Verify setup**
   ```bash
   dart analyze
   dart test
   
   ```

### Development Environment
- **Dart SDK**: ≥ 3.7.0

- **IDE**: VS Code or IntelliJ with Dart extensions
- **Git**: For version control

## 📝 How to Contribute

### 1. Reporting Bugs

Before creating a bug report:
- **Search existing issues** to avoid duplicates
- **Use the latest version** to ensure the bug still exists
- **Provide minimal reproduction** case

**Bug Report Template:**
```markdown
**Describe the bug**
A clear and concise description of what the bug is.

**To Reproduce**
Steps to reproduce the behavior:
1. Go to '...'
2. Click on '....'
3. See error

**Expected behavior**
What you expected to happen.

**Environment:**
- Dart version: 
- Package version:
- OS: 
- Device: 

**Additional context**
Any other context about the problem.
```

### 2. Suggesting Features

Feature requests are welcome! Please:
- **Check existing issues** for similar requests
- **Explain the use case** clearly
- **Consider the scope** of the change
- **Be open to discussion** about implementation

**Feature Request Template:**
```markdown
**Is your feature request related to a problem?**
A clear description of what the problem is.

**Describe the solution you'd like**
A clear description of what you want to happen.

**Describe alternatives you've considered**
Other solutions or features you've considered.

**Additional context**
Any other context or screenshots about the feature request.
```

### 3. Code Contributions

#### Branch Strategy
- **main**: Stable release branch
- **develop**: Development branch (if applicable)
- **feature/xxx**: Feature development
- **fix/xxx**: Bug fixes
- **docs/xxx**: Documentation updates

#### Development Workflow

1. **Create a branch**
   ```bash
   git checkout -b feature/my-new-feature
   ```

2. **Make your changes**
   - Follow [coding standards](#coding-standards)
   - Add tests for new functionality
   - Update documentation if needed

3. **Test your changes**
   ```bash
   dart analyze
   dart test
   dart format .
   ```

4. **Commit your changes**
   ```bash
   git add .
   git commit -m "feat: add new feature description"
   ```

5. **Push to your fork**
   ```bash
   git push origin feature/my-new-feature
   ```

6. **Create a Pull Request**

## 📋 Coding Standards

### Dart Style Guide
- Follow [Effective Dart](https://dart.dev/guides/language/effective-dart)
- Use `dart format` for consistent formatting
- Follow naming conventions:
  - **Classes**: PascalCase (`MyClass`)
  - **Variables/Functions**: camelCase (`myVariable`)
  - **Constants**: lowerCamelCase (`defaultValue`)
  - **Files**: snake_case (`my_file.dart`)

### Code Quality
- **Documentation**: Document all public APIs
- **Testing**: Maintain ≥ 80% test coverage
- **Error Handling**: Implement proper error handling
- **Performance**: Consider performance implications

### Example Code Style
```dart
/// Calculates the area of a rectangle.
/// 
/// Takes [width] and [height] as parameters and returns
/// the calculated area as a [double].
/// 
/// Example:
/// ```dart
/// final area = calculateArea(10.0, 5.0); // Returns 50.0
/// ```
/// 
/// Throws [ArgumentError] if width or height is negative.
double calculateArea(double width, double height) {
  if (width < 0 || height < 0) {
    throw ArgumentError('Width and height must be non-negative');
  }
  
  return width * height;
}
```

## 🧪 Testing Guidelines

### Test Requirements
- **Unit tests** for all new functionality
- **Integration tests** for complex features

- **Tests must pass** before PR approval

### Test Structure
```dart
group('FeatureName', () {
  late FeatureClass feature;
  
  setUp(() {
    feature = FeatureClass();
  });
  
  group('methodName', () {
    test('should return expected result when given valid input', () {
      // Arrange
      final input = 'valid_input';
      final expected = 'expected_output';
      
      // Act
      final result = feature.methodName(input);
      
      // Assert
      expect(result, equals(expected));
    });
    
    test('should throw exception when given invalid input', () {
      // Arrange
      final invalidInput = 'invalid';
      
      // Act & Assert
      expect(
        () => feature.methodName(invalidInput),
        throwsA(isA<ArgumentError>()),
      );
    });
  });
});
```

## 📚 Documentation

### Documentation Standards
- **API Documentation**: Use `///` for public APIs
- **README**: Keep examples up to date
- **CHANGELOG**: Follow [Keep a Changelog](https://keepachangelog.com/)
- **Code Comments**: Explain "why", not "what"

### Documentation Updates
When making changes that affect:
- **Public API**: Update API documentation
- **Usage**: Update README examples
- **Behavior**: Update relevant documentation
- **Breaking Changes**: Update migration guide

## 🔄 Pull Request Process

### PR Requirements
- [ ] **Tests**: All tests pass
- [ ] **Linting**: No analysis issues
- [ ] **Documentation**: Updated if necessary
- [ ] **Changelog**: Updated for user-facing changes
- [ ] **Description**: Clear description of changes

### PR Template
```markdown
## Description
Brief description of changes made.

## Type of Change
- [ ] Bug fix (non-breaking change that fixes an issue)
- [ ] New feature (non-breaking change that adds functionality)
- [ ] Breaking change (fix or feature that causes existing functionality to change)
- [ ] Documentation update

## Testing
- [ ] Unit tests added/updated
- [ ] Integration tests added/updated
- [ ] Manual testing completed

## Checklist
- [ ] Code follows style guidelines
- [ ] Self-review completed
- [ ] Documentation updated
- [ ] Tests added/updated
- [ ] All tests pass
```

### Review Process
1. **Automated checks** must pass (CI/CD)
2. **Code review** by maintainer(s)
3. **Address feedback** if required
4. **Approval** and merge

## 🏷️ Versioning

We follow [Semantic Versioning](https://semver.org/):
- **PATCH** (1.0.1): Bug fixes
- **MINOR** (1.1.0): New features (backwards compatible)
- **MAJOR** (2.0.0): Breaking changes

### Commit Messages
Follow [Conventional Commits](https://www.conventionalcommits.org/):
- `feat:` New features
- `fix:` Bug fixes
- `docs:` Documentation changes
- `style:` Code style changes (formatting)
- `refactor:` Code refactoring
- `test:` Adding/updating tests
- `chore:` Maintenance tasks

Examples:
```
feat: add support for custom themes
fix: resolve memory leak in image cache
docs: update API documentation for v2.0
```

## 🚀 Release Process

### For Maintainers
1. **Update version** in `pubspec.yaml`
2. **Update CHANGELOG.md**
3. **Create release branch**
4. **Final testing**
5. **Merge to main**
6. **Tag release**
7. **Publish to pub.dev**

## 🤔 Questions?

- **General questions**: Create a [GitHub Discussion](https://github.com/yourorg/fpd_ascii_text_drawer/discussions)
- **Bug reports**: Create an [Issue](https://github.com/yourorg/fpd_ascii_text_drawer/issues)
- **Feature requests**: Create an [Issue](https://github.com/yourorg/fpd_ascii_text_drawer/issues)

## 🙏 Recognition

Contributors will be:
- **Listed** in CONTRIBUTORS.md
- **Mentioned** in release notes
- **Tagged** in social media announcements (if desired)

## 📄 License

By contributing, you agree that your contributions will be licensed under the same license as the project (see [LICENSE](LICENSE) file).

---

**Thank you for contributing to FpdAsciiTextDrawer!** 🎉

Your contributions help make this project better for everyone. Whether you're fixing bugs, adding features, improving documentation, or helping other users, every contribution is valuable and appreciated.
