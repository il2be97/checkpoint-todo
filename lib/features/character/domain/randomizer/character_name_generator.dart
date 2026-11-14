import 'dart:math';

abstract class CharacterNameGenerator {
  static final _random = Random();

  static const _prefixes = [
    'Ar',
    'Ash',
    'Cor',
    'Drak',
    'Ed',
    'Eld',
    'Fara',
    'Gael',
    'Gwyn',
    'Hav',
    'Kal',
    'Kael',
    'Lor',
    'Loth',
    'Mal',
    'Mor',
    'Nito',
    'Orn',
    'Ost',
    'Sieg',
    'Sol',
    'Tar',
    'Val',
    'Vel',
    'Ven',
    'Vor',
    'Yor',
    'Zul',
  ];

  static const _suffixes = [
    'an',
    'ar',
    'as',
    'dor',
    'el',
    'en',
    'garl',
    'gorn',
    'in',
    'is',
    'mir',
    'ok',
    'on',
    'or',
    'os',
    'ric',
    'stein',
    'th',
    'ul',
    'us',
    'var',
    'yn',
  ];

  static const _iconicNames = [
    'GWYN',
    'GAEL',
    'NITO',
    'HAVEL',
    'ORBECK',
    'EIGON',
    'ANRI',
    'LUCAT',
    'VELKA',
    'ALVA',
    'ZULLIE',
    'SIF',
  ];

  static String generate({bool upperCase = true}) {
    String name;

    if (_random.nextInt(5) == 0) {
      name = _iconicNames[_random.nextInt(_iconicNames.length)];
    } else {
      final prefix = _prefixes[_random.nextInt(_prefixes.length)];
      final suffix = _suffixes[_random.nextInt(_suffixes.length)];
      name = '$prefix$suffix';

      if (name.length > 7) {
        name = prefix.length >= 4 ? prefix : '${prefix}or';
      }
    }

    return upperCase ? name.toUpperCase() : _capitalize(name);
  }

  static String _capitalize(String text) {
    if (text.isEmpty) return text;
    return '${text[0].toUpperCase()}${text.substring(1).toLowerCase()}';
  }
}
