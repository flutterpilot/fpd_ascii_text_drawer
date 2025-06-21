# Testing Checklist - FpdAsciiTextDrawer

## 🎯 Test Strategy

### Coverage Goals
- [ ] **Unit Tests**: ≥ 80% coverage
- [ ] **Critical Path**: 100% coverage
- [ ] **Integration Tests**: API flows covered
- [ ] **Edge Cases**: Error scenarios tested

### Test Types Priority
1. **Unit Tests** (80%) - Fast, isolated, reliable
2. **Integration Tests** (15%) - Real component interaction
3. **E2E Tests** (5%) - Full user workflows

## 🧪 Unit Testing

### Setup
- [ ] Test files in `test/` directory
- [ ] Naming convention: `*_test.dart`
- [ ] One test file per source file
- [ ] Test groups organized logically

### Test Structure (AAA Pattern)
```dart
test('should return expected result when valid input provided', () {
  // Arrange - Setup test data
  final input = 'valid_input';
  final expected = 'expected_output';
  
  // Act - Execute the function
  final result = functionUnderTest(input);
  
  // Assert - Verify the result
  expect(result, equals(expected));
});
```

### Coverage Areas
- [ ] **Happy Path**: Normal execution flow
- [ ] **Edge Cases**: Boundary conditions
- [ ] **Error Cases**: Exception handling
- [ ] **Null Safety**: Null/empty inputs
- [ ] **Data Validation**: Input validation logic

### Best Practices
- [ ] Tests are independent (no shared state)
- [ ] Descriptive test names
- [ ] One assertion per test (when possible)
- [ ] Use setUp/tearDown for common initialization
- [ ] Mock external dependencies

### Example Unit Test
```dart
group('FpdAsciiTextDrawer', () {
  late FpdAsciiTextDrawer instance;
  
  setUp(() {
    instance = FpdAsciiTextDrawer();
  });
  
  group('processData', () {
    test('should return processed data when valid input', () {
      // Arrange
      final input = TestData.validInput();
      
      // Act
      final result = instance.processData(input);
      
      // Assert
      expect(result.isSuccess, isTrue);
      expect(result.data, isNotNull);
    });
    
    test('should throw ValidationException when invalid input', () {
      // Arrange
      final invalidInput = TestData.invalidInput();
      
      // Act & Assert
      expect(
        () => instance.processData(invalidInput),
        throwsA(isA<ValidationException>()),
      );
    });
  });
});
```



## 🔗 Integration Testing

### Setup
- [ ] Test real component interactions
- [ ] Use real dependencies (where possible)
- [ ] Test data flow between layers

### Integration Areas
- [ ] **API Calls**: Network requests/responses
- [ ] **Database**: CRUD operations
- [ ] **File I/O**: Reading/writing files
- [ ] **External Services**: Third-party integrations

### Mocking Strategy
- [ ] Mock external APIs
- [ ] Mock expensive operations
- [ ] Use dependency injection for testability

```dart
group('Integration Tests', () {
  late ApiClient mockApiClient;
  late Repository repository;
  
  setUp(() {
    mockApiClient = MockApiClient();
    repository = Repository(apiClient: mockApiClient);
  });
  
  test('should fetch and parse data from API', () async {
    // Arrange
    when(mockApiClient.fetchData())
        .thenAnswer((_) async => ApiResponse.success(testData));
    
    // Act
    final result = await repository.getData();
    
    // Assert
    expect(result.isSuccess, isTrue);
    expect(result.data, equals(expectedData));
    verify(mockApiClient.fetchData()).called(1);
  });
});
```

## 🔥 Error Testing

### Exception Handling
- [ ] Network failures handled
- [ ] Invalid data scenarios covered
- [ ] Resource not found cases
- [ ] Permission denied situations

### Error Test Checklist
- [ ] **Timeout Errors**: Network/operation timeouts
- [ ] **Format Errors**: Invalid data format
- [ ] **Validation Errors**: Input validation failures
- [ ] **System Errors**: File system, memory issues

```dart
test('should handle network timeout gracefully', () async {
  // Arrange
  when(mockApiClient.fetchData())
      .thenThrow(TimeoutException('Request timeout', Duration(seconds: 30)));
  
  // Act
  final result = await repository.getData();
  
  // Assert
  expect(result.isFailure, isTrue);
  expect(result.error, contains('timeout'));
});
```

## 📊 Performance Testing

### Performance Areas
- [ ] **Response Times**: Function execution time
- [ ] **Memory Usage**: Memory allocation/deallocation
- [ ] **Resource Leaks**: Proper cleanup verification

```dart
test('should complete operation within acceptable time', () async {
  final stopwatch = Stopwatch()..start();
  
  await expensiveOperation();
  
  stopwatch.stop();
  expect(stopwatch.elapsedMilliseconds, lessThan(1000)); // < 1 second
});
```

## 🧹 Test Maintenance

### Regular Tasks
- [ ] Remove obsolete tests
- [ ] Update tests for code changes
- [ ] Refactor duplicate test code
- [ ] Keep test data updated

### Test Code Quality
- [ ] DRY principle applied
- [ ] Clear test structure
- [ ] Meaningful assertions
- [ ] Proper cleanup in tearDown

## 🚀 CI/CD Testing

### Continuous Integration
- [ ] Tests run on every commit
- [ ] Tests run on multiple platforms
- [ ] Coverage reports generated
- [ ] Failed tests block merges

### Test Environment
- [ ] Consistent test environment
- [ ] Test data isolated
- [ ] Parallel test execution
- [ ] Flaky test detection

## 📈 Test Metrics

### Coverage Tracking
```bash
# Generate coverage report
dart test --coverage=coverage
genhtml coverage/lcov.info -o coverage/html

# Check coverage percentage
lcov --summary coverage/lcov.info
```

### Quality Metrics
- [ ] **Test Coverage**: ≥ 80%
- [ ] **Test Speed**: All tests < 30 seconds
- [ ] **Test Reliability**: < 1% flaky tests
- [ ] **Test Maintainability**: Low coupling, high cohesion

## ✅ Pre-Commit Testing

### Local Verification
```bash
# Run all tests
dart test

# Run tests with coverage
dart test --coverage=coverage

# Run specific test file
dart test test/specific_test.dart

# Run tests matching pattern
dart test --name="pattern"
```

### Commit Checklist
- [ ] All existing tests pass
- [ ] New functionality has tests
- [ ] Coverage threshold maintained
- [ ] No test warnings/errors
- [ ] Test code formatted and linted

---

**Remember**: Good tests are your safety net. Write them as if your future self depends on them! 🛡️
