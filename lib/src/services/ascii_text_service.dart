/// Servicio para convertir texto a arte ASCII
class AsciiTextService {
  /// Lista de fuentes disponibles para ASCII art
  static const List<String> availableFonts = [
    'Standard',
    'Big',
    'Block',
    'Shadow',
    '3D',
    'Star Wars',
    'Bloody',
    'Gothic',
  ];

  /// Mapa de fuentes ASCII art predefinidas
  static const Map<String, Map<String, String>> _fontMaps = {
    'Standard': {
      'A': '  A  \n A A \nAAAAA\nA   A\nA   A',
      'B': 'BBBB \nB   B\nBBBB \nB   B\nBBBB ',
      'C': ' CCCC\nC    \nC    \nC    \n CCCC',
      'D': 'DDDD \nD   D\nD   D\nD   D\nDDDD ',
      'E': 'EEEEE\nE    \nEEE  \nE    \nEEEEE',
      'F': 'FFFFF\nF    \nFFF  \nF    \nF    ',
      'G': ' GGGG\nG    \nG  GG\nG   G\n GGGG',
      'H': 'H   H\nH   H\nHHHHH\nH   H\nH   H',
      'I': ' IIII\n  I  \n  I  \n  I  \n IIII',
      'J': '    J\n    J\n    J\nJ   J\n JJJ ',
      'K': 'K   K\nK  K \nKKK  \nK  K \nK   K',
      'L': 'L    \nL    \nL    \nL    \nLLLLL',
      'M': 'M   M\nMM MM\nM M M\nM   M\nM   M',
      'N': 'N   N\nNN  N\nN N N\nN  NN\nN   N',
      'O': ' OOO \nO   O\nO   O\nO   O\n OOO ',
      'P': 'PPPP \nP   P\nPPPP \nP    \nP    ',
      'Q': ' QQQ \nQ   Q\nQ   Q\nQ  Q \n QQ Q',
      'R': 'RRRR \nR   R\nRRRR \nR  R \nR   R',
      'S': ' SSSS\nS    \n SSS \n    S\nSSSS ',
      'T': 'TTTTT\n  T  \n  T  \n  T  \n  T  ',
      'U': 'U   U\nU   U\nU   U\nU   U\n UUU ',
      'V': 'V   V\nV   V\nV   V\n V V \n  V  ',
      'W': 'W   W\nW   W\nW W W\nWW WW\nW   W',
      'X': 'X   X\n X X \n  X  \n X X \nX   X',
      'Y': 'Y   Y\n Y Y \n  Y  \n  Y  \n  Y  ',
      'Z': 'ZZZZZ\n   Z \n  Z  \n Z   \nZZZZZ',
      ' ': '     \n     \n     \n     \n     ',
      '0': ' 000 \n0   0\n0   0\n0   0\n 000 ',
      '1': '  1  \n 11  \n  1  \n  1  \n 111 ',
      '2': ' 222 \n2   2\n   2 \n  2  \n22222',
      '3': ' 333 \n3   3\n  33 \n3   3\n 333 ',
      '4': '   4 \n  44 \n 4 4 \n44444\n   4 ',
      '5': '55555\n5    \n5555 \n    5\n5555 ',
      '6': '  66 \n 6   \n6666 \n6   6\n 666 ',
      '7': '77777\n   7 \n  7  \n 7   \n7    ',
      '8': ' 888 \n8   8\n 888 \n8   8\n 888 ',
      '9': ' 999 \n9   9\n 9999\n    9\n 999 ',
      '!': '  !  \n  !  \n  !  \n     \n  !  ',
      '?': ' ??? \n?   ?\n   ? \n     \n  ?  ',
      '.': '     \n     \n     \n     \n  .  ',
      ',': '     \n     \n     \n  ,  \n ,   ',
      ':': '     \n  :  \n     \n  :  \n     ',
      ';': '     \n  ;  \n     \n  ;  \n ;   ',
      '-': '     \n     \n----- \n     \n     ',
      '+': '     \n  +  \n +++++\n  +  \n     ',
      '=': '     \n=====\n     \n=====\n     ',
      '*': '     \n * * \n  *  \n * * \n     ',
      '/': '    /\n   / \n  /  \n /   \n/    ',
      '\\': '\\    \n \\   \n  \\  \n   \\ \n    \\',
      '|': '  |  \n  |  \n  |  \n  |  \n  |  ',
      '_': '     \n     \n     \n     \n_____',
      '#': ' # # \n#####\n # # \n#####\n # # ',
      '@': ' @@@ \n@   @\n@ @@ \n@   @\n @@@ ',
      '\$': '  \$  \n \$\$\$ \n\$ \$  \n \$\$\$ \n  \$  ',
      '%': '%   %\n   % \n  %  \n %   \n%   %',
      '^': '  ^  \n ^ ^ \n^   ^\n     \n     ',
      '&': ' &&  \n&  & \n&&&  \n&  & \n && &',
      '(': '  (  \n (   \n(    \n (   \n  (  ',
      ')': '  )  \n   ) \n    )\n   ) \n  )  ',
      '[': ' [   \n [   \n [   \n [   \n [   ',
      ']': '   ] \n   ] \n   ] \n   ] \n   ] ',
      '{': '  {  \n {   \n{    \n {   \n  {  ',
      '}': '  }  \n   } \n    }\n   } \n  }  ',
      '<': '   < \n  <  \n <   \n  <  \n   < ',
      '>': ' >   \n  >  \n   > \n  >  \n >   ',
    },
    'Big': {
      'A':
          '    AA    \n   AAAA   \n  AA  AA  \n AA    AA \nAAAAAAAAAA\nAA      AA\nAA      AA',
      'B':
          'BBBBBBB  \nB       B \nB       B \nBBBBBBB  \nB       B \nB       B \nBBBBBBB  ',
      'C':
          ' CCCCCCC \nC       C\nC        \nC        \nC        \nC       C\n CCCCCCC ',
      'D':
          'DDDDDDD  \nD       D \nD        D\nD        D\nD        D\nD       D \nDDDDDDD  ',
      'E':
          'EEEEEEEEE\nE        \nE        \nEEEEEEE  \nE        \nE        \nEEEEEEEEE',
      'F':
          'FFFFFFFFF\nF        \nF        \nFFFFFFF  \nF        \nF        \nF        ',
      'G':
          ' GGGGGGG \nG       G\nG        \nG   GGGGG\nG       G\nG       G\n GGGGGGG ',
      'H':
          'H       H\nH       H\nH       H\nHHHHHHHHH\nH       H\nH       H\nH       H',
      'I':
          'IIIIIIIII\n    I    \n    I    \n    I    \n    I    \n    I    \nIIIIIIIII',
      'J':
          '         J\n         J\n         J\n         J\nJ        J\nJ        J\n JJJJJJJ ',
      'K':
          'K       K\nK      K \nK     K  \nKKKKK    \nK     K  \nK      K \nK       K',
      'L':
          'L        \nL        \nL        \nL        \nL        \nL        \nLLLLLLLLL',
      'M':
          'M       M\nMM     MM\nM M   M M\nM  M M  M\nM   M   M\nM       M\nM       M',
      'N':
          'N       N\nNN      N\nN N     N\nN  N    N\nN   N   N\nN    N  N\nN       N',
      'O':
          ' OOOOOOO \nO       O\nO       O\nO       O\nO       O\nO       O\n OOOOOOO ',
      'P':
          'PPPPPPPP \nP       P\nP       P\nPPPPPPPP \nP        \nP        \nP        ',
      'Q':
          ' QQQQQQQ \nQ       Q\nQ       Q\nQ       Q\nQ     Q Q\nQ      Q \n QQQQQQQQ',
      'R':
          'RRRRRRRR \nR       R\nR       R\nRRRRRRRR \nR      R \nR       R\nR        R',
      'S':
          ' SSSSSSS \nS       S\nS        \n SSSSSSS \n        S\nS       S\n SSSSSSS ',
      'T':
          'TTTTTTTTT\n    T    \n    T    \n    T    \n    T    \n    T    \n    T    ',
      'U':
          'U       U\nU       U\nU       U\nU       U\nU       U\nU       U\n UUUUUUU ',
      'V':
          'V       V\nV       V\nV       V\nV       V\n V     V \n  V   V  \n   VVV   ',
      'W':
          'W       W\nW       W\nW       W\nW   W   W\nW  W W  W\nW W   W W\nW       W',
      'X':
          'X       X\n X     X \n  X   X  \n   XXX   \n  X   X  \n X     X \nX       X',
      'Y':
          'Y       Y\n Y     Y \n  Y   Y  \n   YYY   \n    Y    \n    Y    \n    Y    ',
      'Z':
          'ZZZZZZZZZ\n        Z\n       Z \n      Z  \n     Z   \n    Z    \nZZZZZZZZZ',
      ' ':
          '         \n         \n         \n         \n         \n         \n         ',
    },
  };

  /// Convierte texto a arte ASCII usando la fuente especificada
  ///
  /// [text] - El texto a convertir
  /// [font] - La fuente a usar (por defecto 'Standard')
  /// [width] - El ancho máximo del texto (opcional, no implementado en esta versión)
  ///
  /// Retorna el texto convertido a ASCII art
  ///
  /// Ejemplo:
  /// ```dart
  /// final asciiArt = await AsciiTextService.convertToAscii('Hello World', 'Standard');
  /// print(asciiArt);
  /// ```
  static Future<String> convertToAscii(
    String text, {
    String font = 'Standard',
    int? width,
  }) async {
    if (text.isEmpty) {
      return '';
    }

    // Validar que la fuente esté disponible
    if (!isFontAvailable(font)) {
      throw AsciiTextException('Fuente no disponible: $font', 400);
    }

    try {
      final fontMap = _fontMaps[font];
      if (fontMap == null) {
        throw AsciiTextException('Fuente no implementada: $font', 400);
      }

      final lines = <String>[];
      final textUpper = text.toUpperCase();

      // Obtener la altura de la fuente (número de líneas)
      final sampleChar = fontMap['A'] ?? fontMap.values.first;
      final height = sampleChar.split('\n').length;

      // Inicializar líneas vacías
      for (int i = 0; i < height; i++) {
        lines.add('');
      }

      // Procesar cada carácter
      for (int charIndex = 0; charIndex < textUpper.length; charIndex++) {
        final char = textUpper[charIndex];
        final charArt = fontMap[char] ?? fontMap[' '] ?? '';

        if (charArt.isNotEmpty) {
          final charLines = charArt.split('\n');

          // Agregar cada línea del carácter a la línea correspondiente
          for (
            int lineIndex = 0;
            lineIndex < height && lineIndex < charLines.length;
            lineIndex++
          ) {
            if (lineIndex < lines.length) {
              lines[lineIndex] += charLines[lineIndex];
            }
          }
        }
      }

      return lines.join('\n');
    } catch (e) {
      throw AsciiTextException('Error al convertir texto: $e', -1);
    }
  }

  /// Obtiene la lista de fuentes disponibles
  ///
  /// Retorna una lista de todas las fuentes soportadas
  static List<String> getAvailableFonts() {
    return List.unmodifiable(availableFonts);
  }

  /// Verifica si una fuente está disponible
  ///
  /// [font] - El nombre de la fuente a verificar
  ///
  /// Retorna true si la fuente está disponible
  static bool isFontAvailable(String font) {
    return availableFonts.contains(font);
  }
}

/// Excepción personalizada para errores de ASCII text
class AsciiTextException implements Exception {
  final String message;
  final int statusCode;

  const AsciiTextException(this.message, this.statusCode);

  @override
  String toString() => 'AsciiTextException: $message (Status: $statusCode)';
}
