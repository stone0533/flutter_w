class HttpConfig {
  final Duration _connectTimeout;
  final Duration _receiveTimeOut;
  final bool _retry;
  final int _retryCount;

  get connectTimeout {
    return _connectTimeout;
  }

  get receiveTimeOut {
    return _receiveTimeOut;
  }

  get retry {
    return _retry;
  }

  get retryCount {
    return _retryCount;
  }

  HttpConfig(HttpConfigBuilder builder)
      : _connectTimeout = builder._connectTimeout,
        _receiveTimeOut = builder._receiveTimeOut,
        _retry = builder._retry,
        _retryCount = builder._retryCount;
}

class HttpConfigBuilder {
  Duration _connectTimeout = const Duration(milliseconds: 10000); //连接超时时间
  Duration _receiveTimeOut = const Duration(milliseconds: 50000); //接收超时时间
  bool _retry = false;
  int _retryCount = 3;

  HttpConfigBuilder setConnectTimeout(Duration connectTimeout) {
    _connectTimeout = connectTimeout;
    return this;
  }

  HttpConfigBuilder setReceiveTimeOut(Duration receiveTimeOut) {
    _receiveTimeOut = receiveTimeOut;
    return this;
  }

  HttpConfigBuilder setRetry(bool retry) {
    _retry = retry;
    return this;
  }

  HttpConfigBuilder setRetryCount(int retryCount) {
    _retryCount = _retryCount;
    return this;
  }

  HttpConfig build() => HttpConfig(this);
}
