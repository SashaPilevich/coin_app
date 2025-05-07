# coin_app
 

## 1. GitFlow
Branches: main, dev, feature/$-1, bugfix/$-1.
Commit name structure: [-1] Description
Merge request should contain no more than 40 files

## 2. Architecture
Clean Architecture + BloC
Dependency Injection: GetIt
Domain layer: models, repositories, use-cases.
Data layer: entities, mappers from entities to domain model, implementations of repositories and providers.
Presentation layer: screens + bloc

## 3. Supported flavors
- Dev
- Prod
- QA

## 4. Project structure
Modules: core, core_ui, navigation, data, domain, etc.
For presentation layer every feature is a separate module.

## 5. Code Development Rules
Lint rules described in analysis_options.yaml
pre-commit hook should be configured:
1. Create file pre-commit (without extension) with content:
```
#!/bin/sh
dart format --line-length=100 --set-exit-if-changed core core_ui data domain features lib navigation
flutter analyze
```
2. Place it in .git/hooks directory of the project.
3. File should have permission to be executed.

## 6. Asynchrony support
Flutter Async

## 7. Abstractions for data sources and data access
Providers are responsible for specific services (e.g. http provider, local provider, etc.),
they use data layer entities. Do not have abstract base classes.
Repositories are responsible for gathering data from providers
and mapping it to the corresponding domain layer models. Have abstract base classes in domain layer.

## 8. Presentation layer abstractions
Base and frequently used widgets are stored in core_ui module.
Base widget for screens is AppScaffold.
Example: CustomScreen -> CustomForm
Navigation is implemented using Auto Route
Navigation on BLoC event is done from the BLoC object itself without BuildContext,
router is stored in DI container and is injected in BLoC via constructor.

## 9. Logging
Not implemented yet.

## 10. App distributing
Not implemented yet.

## 11. Approach for working with UI
One file = one widget.
Screen widget contains BlocProviders.

## 12. Localization
Localization is implemented using EasyLocalization service.

## 13. Design system
Fonts, colors, frequently used constant values, and icons are stored in core_ui module.

## 14. Supported platforms
Mobiles - iOS and Android

## How to run

1. Install Flutter
2. Install Android Studio
3. Install XCode (only for MacOS)
4. Install CocoaPods (only for MacOS)
5. Install Flutter and Dart plugins for Android Studio
6. Install XCode command line tools
7. Run `flutter doctor` and fix all issues
8. Run `prebuild_script.sh` to generate files for code generation
9. Run project by `flutter run` command
