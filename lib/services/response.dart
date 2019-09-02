import 'package:padi_pos_kasir/config/status.dart';

bool _notNul(param, key) {
  return param != null && param[key] != null;
}

class Response {
  Response({body, serialize, httpstatus}) {
    _responseBody = body;

    if (_notNul(body, 'data')) _data = body['data'];

    if (_notNul(body, 'status')) _status = body['status'] as String;

    if (_notNul(body, 'rows')) _rows = body['status'] as int;

    if (serialize != null) _serialize = serialize;

    if (httpstatus != null) _httpStatus = httpstatus;
  }

  List<String> _statusSuccess = [
    Status.SAVE_SUCCESS,
    Status.UPDATE_SUCCESS,
    Status.DELETE_SUCCESS,
    Status.UPLOAD_SUCCESS,
    Status.LOGIN_SUCCESS,
    Status.OPERATION_COMPLETE,
  ];

  dynamic _data;

  int _rows;

  String _status;

  int _httpStatus;

  dynamic _responseBody;

  dynamic Function(dynamic json) _serialize;

  getData(dynamic defaultValue) => _data ?? defaultValue;

  getStatus() => _status;

  getHttpStatus() => _httpStatus;

  getRows() => _rows;

  getResponseBody(dynamic defaultValue, {String key}) {
    return key == null
        ? (_responseBody ?? defaultValue)
        : ((_responseBody ?? const {})[key] ?? defaultValue);
  }

  getDeserializeResponse({dynamic defaultValue}) {
    if (isSuccess() && _serialize != null) {
      return _serialize(_data);
    }

    return defaultValue;
  }

  isSuccess() {
    return _data != null || _statusSuccess.indexOf(_status) != -1;
  }
}
