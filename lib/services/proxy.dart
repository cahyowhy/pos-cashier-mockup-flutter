import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:padi_pos_kasir/common/storage.dart';
import 'package:padi_pos_kasir/common/notification.dart';
import 'package:padi_pos_kasir/config/status.dart';
import 'package:padi_pos_kasir/services/response.dart';
import 'package:padi_pos_kasir/util/StringUtil.dart';
import 'package:padi_pos_kasir/config/env.dart';
import 'package:padi_pos_kasir/util/logUtil.dart';

enum Method { get, post, put, delete }

class ProxyService {
  String url = env.baseUrl;
  Method method;

  Map normalizeParam(Map param) {
    Map cloneParam = new Map<dynamic, dynamic>.from(param);

    param.forEach((key, value) {
      if (value is String) {
        if (value.isEmpty) cloneParam.remove(key);
      } else if (value is int) {
        if (value == 0) cloneParam.remove(key);
      }
    });

    return cloneParam;
  }

  dynamic serializer(dynamic json) {
    return json;
  }

  Future<Response> find(
      {final param,
      String url,
      Map<String, String> header,
      BuildContext ctx,
      bool toast = false}) {
    String finalUrl;

    if (url.isNotEmpty) {
      finalUrl = url;
    } else if (param != null) {
      finalUrl = this.url;

      if (param is Map) {
        finalUrl += generateQuery(normalizeParam(param));
      } else {
        finalUrl += param.toString();
      }
    } else {
      finalUrl = this.url;
    }

    return this
        ._request(Method.get, finalUrl, header: header, ctx: ctx, toast: toast);
  }

  Future<Response> post(final Map<String, dynamic> param,
      {String url,
      Map<String, String> header,
      BuildContext ctx,
      bool toast = true}) {
    return this._request(Method.post, url ?? this.url,
        param: param, header: header, ctx: ctx, toast: toast);
  }

  Future<Response> put(final Map<String, dynamic> param,
      {String url,
      Map<String, String> header,
      BuildContext ctx,
      bool toast = true}) {
    return this._request(Method.put, url ?? this.url,
        param: param, header: header, ctx: ctx, toast: toast);
  }

  Future<Response> delete(String id,
      {String url,
      Map<String, String> header,
      BuildContext ctx,
      bool toast = true}) {
    String apiUrl = this.url + id;

    return this._request(Method.delete, url ?? apiUrl,
        header: header, ctx: ctx, toast: toast);
  }

  Future<Response> _request(Method method, String url,
      {Map param,
      Map<String, String> header,
      BuildContext ctx,
      bool toast = true}) async {
    http.Response response;

    Map<String, String> finalHeader = {};

    if (header == null) {
      finalHeader['Content-Type'] = 'application/json';
    } else {
      finalHeader = header;
    }

    try {
      String token = await Authentication.getToken();
      
      if (token.isNotEmpty) {
        finalHeader['Authorization'] = token;
      }
    } catch (e) {
      print(e.toString());
    }

    try {
      switch (method) {
        case Method.delete:
          response = await http.delete(url, headers: finalHeader);
          break;
        case Method.put:
          response = await http.put(url,
              body: json.encode(param), headers: finalHeader);
          break;
        case Method.post:
          response = await http.post(url,
              body: json.encode(param), headers: finalHeader);
          break;
        default:
          response = await http.get(url, headers: finalHeader);
          break;
      }

      dynamic body = json.decode(response.body);
      int code = response.statusCode;
      var responseProxy =
          Response(body: body, serialize: serializer, httpstatus: code);

      if (code == int.parse(Status.UNAUTHORIZED)) {
        await Storage.deleteValue();

        if (ctx != null) {
          Navigator.of(ctx).pushNamed('ProductCategory');
        }
      }

      if (toast) {
        NotifToast.showToast(
            status: responseProxy.getStatus(),
            type: responseProxy.isSuccess() ? Type.INFO : Type.DANGER);
      }

      return responseProxy;
    } catch (e) {
      print(e.toString());

      return Response();
    }
  }
}
