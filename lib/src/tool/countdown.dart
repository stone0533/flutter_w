import 'dart:async';

class WCountdown {
  // 总秒数
  int countdown = 0;

  // 是否已开始
  bool isRun = false;
  //
  final WCountdownCallback? callback;
  WCountdown({this.callback});
  Timer? timer;
  // 开始
  void start({required int second}) {
    const period = Duration(seconds: 1);
    countdown = second;
    isRun = true;
    timer?.cancel();
    timer = Timer.periodic(period, (timer) {
      countdown--;
      if (callback != null) {
        callback!(countdown);
      }
      if (countdown == 0) {
        isRun = false;
        timer.cancel();
      }
    });
  }

  // 关闭
  void stop() {
    timer?.cancel();
  }

  // 剩余
  String remaining({WCountdownRemainingType type = WCountdownRemainingType.S}) {
    if (type == WCountdownRemainingType.MS) {
      return Duration(seconds: countdown).toString().substring(2, 7); // 分:秒
    }
    // 默认是秒
    return Duration(seconds: countdown).toString().substring(5, 7); // 秒
  }
}

enum WCountdownRemainingType { S, MS }

typedef WCountdownCallback<int> = void Function(int value);
