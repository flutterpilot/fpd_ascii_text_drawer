import 'package:test/test.dart';
import 'package:fpd_ascii_text_drawer/fpd_ascii_text_drawer.dart';

void main() {
  group('AsciiTextService', () {
    group('getAvailableFonts', () {
      test('should return non-empty list of fonts', () {
        final fonts = AsciiTextService.getAvailableFonts();

        expect(fonts, isNotEmpty);
        expect(fonts, isA<List<String>>());
        expect(
          fonts.length,
          greaterThan(0),
        ); // Debería tener al menos una fuente
      });

      test('should return unmodifiable list', () {
        final fonts = AsciiTextService.getAvailableFonts();

        expect(() => fonts.add('Test'), throwsUnsupportedError);
      });

      test('should contain popular fonts', () {
        final fonts = AsciiTextService.getAvailableFonts();
        final popularFonts = ['Standard', 'Big'];

        for (final font in popularFonts) {
          expect(fonts, contains(font));
        }
      });
    });

    group('isFontAvailable', () {
      test('should return true for existing fonts', () {
        expect(AsciiTextService.isFontAvailable('Standard'), isTrue);
        expect(AsciiTextService.isFontAvailable('Big'), isTrue);
      });

      test('should return false for non-existing fonts', () {
        expect(AsciiTextService.isFontAvailable('NonExistentFont'), isFalse);
        expect(AsciiTextService.isFontAvailable(''), isFalse);
      });

      test('should be case sensitive', () {
        expect(AsciiTextService.isFontAvailable('standard'), isFalse);
        expect(AsciiTextService.isFontAvailable('STANDARD'), isFalse);
      });
    });

    group('convertToAscii', () {
      test('should convert simple text with default font', () async {
        final result = await AsciiTextService.convertToAscii('Hello');

        expect(result, isNotEmpty);
        expect(result, isA<String>());
        expect(result, contains('H'));
        expect(result, contains('O'));
        expect(result, contains('L'));
      });

      test('should convert text with specific font', () async {
        final result = await AsciiTextService.convertToAscii(
          'Test',
          font: 'Big',
        );

        expect(result, isNotEmpty);
        expect(result, isA<String>());
        expect(result, contains('T'));
        expect(result, contains('S'));
      });

      test('should convert text with width parameter', () async {
        final result = await AsciiTextService.convertToAscii(
          'Long text for testing width',
          font: 'Standard',
          width: 20,
        );

        expect(result, isNotEmpty);
        expect(result, isA<String>());
      });

      test('should return empty string for empty input', () async {
        final result = await AsciiTextService.convertToAscii('');

        expect(result, isEmpty);
      });

      test('should handle special characters', () async {
        final result = await AsciiTextService.convertToAscii('Hello!@#');

        expect(result, isNotEmpty);
        expect(result, isA<String>());
      });

      test('should handle numbers', () async {
        final result = await AsciiTextService.convertToAscii('12345');

        expect(result, isNotEmpty);
        expect(result, isA<String>());
        expect(result, contains('1'));
        expect(result, contains('2'));
        expect(result, contains('3'));
        expect(result, contains('4'));
        expect(result, contains('5'));
      });

      test('should handle unicode characters', () async {
        final result = await AsciiTextService.convertToAscii('Héllö');

        expect(result, isNotEmpty);
        expect(result, isA<String>());
      });
    });

    group('error handling', () {
      test('should throw AsciiTextException for invalid font', () async {
        expect(
          () => AsciiTextService.convertToAscii('Test', font: 'InvalidFont'),
          throwsA(isA<AsciiTextException>()),
        );
      });

      test('should handle errors gracefully', () async {
        try {
          await AsciiTextService.convertToAscii('Test', font: 'InvalidFont');
        } on AsciiTextException catch (e) {
          expect(e, isA<AsciiTextException>());
          expect(e.message, isNotEmpty);
          expect(e.statusCode, isA<int>());
        }
      });
    });

    group('performance', () {
      test('should handle multiple requests efficiently', () async {
        final stopwatch = Stopwatch()..start();

        final futures = <Future<String>>[];
        for (int i = 0; i < 5; i++) {
          futures.add(AsciiTextService.convertToAscii('Test$i'));
        }

        final results = await Future.wait(futures);
        stopwatch.stop();

        expect(results, hasLength(5));
        expect(results.every((r) => r.isNotEmpty), isTrue);
        expect(
          stopwatch.elapsedMilliseconds,
          lessThan(10000),
        ); // Máximo 10 segundos
      });
    });
  });

  group('AsciiTextException', () {
    test('should create exception with message and status code', () {
      const exception = AsciiTextException('Test error', 404);

      expect(exception.message, equals('Test error'));
      expect(exception.statusCode, equals(404));
    });

    test('should have proper string representation', () {
      const exception = AsciiTextException('Test error', 500);
      final stringRep = exception.toString();

      expect(stringRep, contains('AsciiTextException'));
      expect(stringRep, contains('Test error'));
      expect(stringRep, contains('500'));
    });
  });
}
