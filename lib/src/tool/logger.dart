import 'package:logger/logger.dart';

// verbose（最详细）-->trace
// debug
// info
// warning
// error
// wtf（最严重）-->fatal
// nothing（关闭日志）-->off

LogT(String msg) {
  _WLoggerConfig.instance.logger.t(msg);
}

LogD(String msg) {
  _WLoggerConfig.instance.logger.d(msg);
}

LogI(String msg) {
  _WLoggerConfig.instance.logger.i(msg);
}

LogW(String msg) {
  _WLoggerConfig.instance.logger.w(msg);
}

LogE(String msg) {
  _WLoggerConfig.instance.logger.e(msg);
}

LogF(String msg) {
  _WLoggerConfig.instance.logger.f(msg);
}

class _WLoggerConfig {
  late Logger logger;
  //
  static final _WLoggerConfig _instance = _WLoggerConfig._internal();
  _WLoggerConfig._internal() {
    logger = Logger(
      printer: PrettyPrinter(
        methodCount: 0,
        errorMethodCount: 5,
        lineLength: 50,
        colors: true,
        printEmojis: false,
        dateTimeFormat: DateTimeFormat.dateAndTime,
      ),
    );
  }

  static _WLoggerConfig get instance => _instance;
}

class WLogger {
  static void turnOff() {
    _WLoggerConfig.instance.logger = Logger(level: Level.off);
  }
}
