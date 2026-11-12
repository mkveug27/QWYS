import 'package:qwys/core/core.dart';
import 'package:qwys/core/i18n/strings.g.dart';

extension ObjectUtil on Object {
  String get errorMessage {
    if (this is ServerError) {
      return (this as ServerError).message;
    }
    return t.error.error_default;
  }
}
