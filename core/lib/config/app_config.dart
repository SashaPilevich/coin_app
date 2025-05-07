class AppConfig {
  final Flavor flavor;
  final String baseUrl;

  AppConfig({
    required this.flavor,
    required this.baseUrl,
  });

  factory AppConfig.fromFlavor(Flavor flavor) {
    String baseUrl = '';

    switch (flavor) {
      case Flavor.dev:
        baseUrl = 'https://rest.coincap.io/';
        break;
      case Flavor.prod:
        baseUrl = 'https://rest.coincap.io/';
        break;
      case Flavor.qa:
        baseUrl = 'https://rest.coincap.io/';
        break;
    }

    return AppConfig(
      flavor: flavor,
      baseUrl: baseUrl,
    );
  }
}

enum Flavor {
  dev,
  prod,
  qa;

  static Flavor fromString(String flavor) {
    switch (flavor) {
      case 'dev':
        return Flavor.dev;
      case 'prod':
        return Flavor.prod;
      case 'test':
        return Flavor.qa;
      default:
        return Flavor.dev;
    }
  }
}
