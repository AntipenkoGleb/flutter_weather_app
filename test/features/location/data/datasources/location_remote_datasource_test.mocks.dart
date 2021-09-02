// Mocks generated by Mockito 5.0.15 from annotations
// in flutter_weather_app/test/features/location/data/datasources/location_remote_datasource_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;
import 'dart:convert' as _i6;
import 'dart:typed_data' as _i7;

import 'package:flutter_dotenv/src/dotenv.dart' as _i9;
import 'package:flutter_dotenv/src/parser.dart' as _i10;
import 'package:http/src/base_request.dart' as _i8;
import 'package:http/src/client.dart' as _i4;
import 'package:http/src/response.dart' as _i2;
import 'package:http/src/streamed_response.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeResponse_0 extends _i1.Fake implements _i2.Response {}

class _FakeStreamedResponse_1 extends _i1.Fake implements _i3.StreamedResponse {
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockClient extends _i1.Mock implements _i4.Client {
  MockClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.Response> head(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#head, [url], {#headers: headers}),
              returnValue: Future<_i2.Response>.value(_FakeResponse_0()))
          as _i5.Future<_i2.Response>);
  @override
  _i5.Future<_i2.Response> get(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#get, [url], {#headers: headers}),
              returnValue: Future<_i2.Response>.value(_FakeResponse_0()))
          as _i5.Future<_i2.Response>);
  @override
  _i5.Future<_i2.Response> post(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i6.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#post, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i2.Response>.value(_FakeResponse_0()))
          as _i5.Future<_i2.Response>);
  @override
  _i5.Future<_i2.Response> put(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i6.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#put, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i2.Response>.value(_FakeResponse_0()))
          as _i5.Future<_i2.Response>);
  @override
  _i5.Future<_i2.Response> patch(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i6.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#patch, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i2.Response>.value(_FakeResponse_0()))
          as _i5.Future<_i2.Response>);
  @override
  _i5.Future<_i2.Response> delete(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i6.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#delete, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i2.Response>.value(_FakeResponse_0()))
          as _i5.Future<_i2.Response>);
  @override
  _i5.Future<String> read(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#read, [url], {#headers: headers}),
          returnValue: Future<String>.value('')) as _i5.Future<String>);
  @override
  _i5.Future<_i7.Uint8List> readBytes(Uri? url,
          {Map<String, String>? headers}) =>
      (super.noSuchMethod(
              Invocation.method(#readBytes, [url], {#headers: headers}),
              returnValue: Future<_i7.Uint8List>.value(_i7.Uint8List(0)))
          as _i5.Future<_i7.Uint8List>);
  @override
  _i5.Future<_i3.StreamedResponse> send(_i8.BaseRequest? request) =>
      (super.noSuchMethod(Invocation.method(#send, [request]),
              returnValue:
                  Future<_i3.StreamedResponse>.value(_FakeStreamedResponse_1()))
          as _i5.Future<_i3.StreamedResponse>);
  @override
  void close() => super.noSuchMethod(Invocation.method(#close, []),
      returnValueForMissingStub: null);
  @override
  String toString() => super.toString();
}

/// A class which mocks [DotEnv].
///
/// See the documentation for Mockito's code generation for more information.
class MockDotEnv extends _i1.Mock implements _i9.DotEnv {
  MockDotEnv() {
    _i1.throwOnMissingStub(this);
  }

  @override
  Map<String, String> get env => (super.noSuchMethod(Invocation.getter(#env),
      returnValue: <String, String>{}) as Map<String, String>);
  @override
  bool get isInitialized =>
      (super.noSuchMethod(Invocation.getter(#isInitialized), returnValue: false)
          as bool);
  @override
  void clean() => super.noSuchMethod(Invocation.method(#clean, []),
      returnValueForMissingStub: null);
  @override
  String get(String? name, {String? fallback}) => (super.noSuchMethod(
      Invocation.method(#get, [name], {#fallback: fallback}),
      returnValue: '') as String);
  @override
  String? maybeGet(String? name, {String? fallback}) => (super.noSuchMethod(
      Invocation.method(#maybeGet, [name], {#fallback: fallback})) as String?);
  @override
  _i5.Future<void> load(
          {String? fileName = r'.env',
          _i10.Parser? parser = const _i10.Parser(),
          Map<String, String>? mergeWith = const {}}) =>
      (super.noSuchMethod(
          Invocation.method(#load, [],
              {#fileName: fileName, #parser: parser, #mergeWith: mergeWith}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  void testLoad(
          {String? fileInput = r'',
          _i10.Parser? parser = const _i10.Parser(),
          Map<String, String>? mergeWith = const {}}) =>
      super.noSuchMethod(
          Invocation.method(#testLoad, [],
              {#fileInput: fileInput, #parser: parser, #mergeWith: mergeWith}),
          returnValueForMissingStub: null);
  @override
  bool isEveryDefined(Iterable<String>? vars) =>
      (super.noSuchMethod(Invocation.method(#isEveryDefined, [vars]),
          returnValue: false) as bool);
  @override
  String toString() => super.toString();
}
