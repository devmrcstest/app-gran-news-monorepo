// ignore_for_file: non_constant_identifier_names

const _path = 'assets/images';

class GranImages {
  static const String package = 'lib_gran_design';

  static _LogoImages logo = _LogoImages();
  static _IllustrationsImages illustrations = _IllustrationsImages();
}

class _LogoImages {
  static const String _logoPath = '$_path/logo';
  final String logo_gran_cursos = '$_logoPath/logo-gran-cursos.png';
  final String logo_gran_cursos_dark = '$_logoPath/logo-gran-cursos-dark.png';
}

class _IllustrationsImages {
  static const String _illustrationsPath = '$_path/illustrations';
  final String reset_cycle = '$_illustrationsPath/reset-cycle.png';
}
