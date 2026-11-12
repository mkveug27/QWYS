import 'package:qwys/core/core.dart';
import 'package:qwys/core/i18n/strings.g.dart';

extension ObjectUtil on Object {
  String get errorMessage {
    return this is ServerError
        ? (this as ServerError).reason
        : t.error.error_default;
  }
}
