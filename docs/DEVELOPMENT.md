# QWYS

- Стек: flutter, dart
- State management: flutter_bloc
- Http-client: dio
- Интернационализация: slang

# команды

- Установить все пакеты:
  `flutter pub get`

- Добавление новых слов в переводы:
  Добавляем ключи в два файла: strings_ru.i18n.json и strings_en.i18n.json и выполняем команду:
  `dart run slang`

- Изменение нативного сплэша (путь к файлу изображения в flutter_native_splash.yaml):
  `dart run flutter_native_splash:create`

- Изменение иконки приложения (путь к файлу иконки в файле flutter_launcher_icons.yaml):
  `flutter pub run flutter_launcher_icons -f flutter_launcher_icons.yaml`

- Запуск build_runner для генерации моделей:
  `flutter pub run build_runner serve --delete-conflicting-outputs`
  или:
  `dart run build_runner build -d`

- Настройка Flavors:
  `dart run flutter_flavorizr`
  Сборка android dev:
  `flutter build apk --flavor dev -t lib/main_dev.dart`
  Сборка android prod:
  `flutter build apk --flavor prod -t lib/main_prod.dart`
  Сборка android appbundle:
  `flutter build appbundle --flavor prod -t lib/main_prod.dart`