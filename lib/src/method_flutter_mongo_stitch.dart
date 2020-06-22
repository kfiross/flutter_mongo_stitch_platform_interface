import 'dart:async';
import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import '../flutter_mongo_stitch_platform_interface.dart';
import 'core_stitch_user.dart';

const MethodChannel _channel = MethodChannel('flutter_mongo_stitch');

/// An implementation of [FlutterMongoStitchPlatform] that uses method channels.
class MethodChannelFlutterMongoStitch extends FlutterMongoStitchPlatform {
//  @override
//  Future<bool> launch(String url) {
//        return _channel.invokeMethod<bool>(
//      'launch',
//      <String, Object>{
//        'url': url,
//      },
//    );
//  }

  @override
  Future connectToMongo(String appId) async {
    //await _channel.invokeMethod('connectMongo', {'app_id': appId});
    await FlutterMongoStitchPlatform.instance.connectToMongo(appId);
  }
  
  ///
  @override
  Future insertDocument({
    @required String collectionName,
    @required String databaseName,
    @required Map<String, Object> data,
  }) async {
    await _channel.invokeMethod('insertDocument', {
      'database_name': databaseName,
      'collection_name': collectionName,
      'data': data
    });
  }

  @override
  Future insertDocuments({
    @required String collectionName,
    @required String databaseName,
    @required List<String> list,
  }) async {
    await _channel.invokeMethod('insertDocuments', {
      'database_name': databaseName,
      'collection_name': collectionName,
      'list': list
    });
  }

  @override
  Future findDocuments(
      {String collectionName, String databaseName, dynamic filter,
        String projection, int limit, String sort}) async {
    final result = await _channel.invokeMethod('findDocuments', {
      'database_name': databaseName,
      'collection_name': collectionName,
      'filter': filter,
      'projection': projection,
      'limit': limit,
      'sort': sort
    });

    return result;
  }

  @override
  Future findFirstDocument(
      {String collectionName, String databaseName, dynamic filter, String projection}) async {
    final result = await _channel.invokeMethod('findDocument', {
      'database_name': databaseName,
      'collection_name': collectionName,
      'filter': filter,
      'projection': projection,
    });

    return result;
  }

  @override
  Future deleteDocument(
      {String collectionName, String databaseName, dynamic filter}) async {
    final result = await _channel.invokeMethod('deleteDocument', {
      'database_name': databaseName,
      'collection_name': collectionName,
      'filter': filter
    });

    return result;
  }

  @override
  Future deleteDocuments(
      {String collectionName, String databaseName, dynamic filter}) async {
    final result = await _channel.invokeMethod('deleteDocuments', {
      'database_name': databaseName,
      'collection_name': collectionName,
      'filter': filter
    });

    return result;
  }

  @override
  Future countDocuments(
      {String collectionName, String databaseName, dynamic filter}) async {
    final size = await _channel.invokeMethod('countDocuments', {
      'database_name': databaseName,
      'collection_name': collectionName,
      'filter': filter
    });

    return size;
  }

  ///
  @override
  Future updateDocument(
      {String collectionName,
        String databaseName,
        String filter,
        String update}) async {
    final results = await _channel.invokeMethod('updateDocument', {
      'database_name': databaseName,
      'collection_name': collectionName,
      'filter': filter,
      'update': update
    });

    return results;
  }

  @override
  Future updateDocuments(
      {String collectionName,
        String databaseName,
        String filter,
        String update}) async {
    final results = await _channel.invokeMethod('updateDocuments', {
      'database_name': databaseName,
      'collection_name': collectionName,
      'filter': filter,
      'update': update
    });

    return results;
  }

  @override
  aggregate({ @required String collectionName,  @required String databaseName,
    List<String> pipeline}) async {
    final results = await _channel.invokeMethod('aggregate', {
      'database_name': databaseName,
      'collection_name': collectionName,
      'pipeline': pipeline,
    });

    return results;
  }
  

  ///
  @override
  Future signInAnonymously() async {
    final result = await _channel.invokeMethod('signInAnonymously');
    return CoreStitchUser.fromMap(result);
  }

  @override
  Future<CoreStitchUser> signInWithUsernamePassword(
      String username, String password) async {
    final result = await _channel.invokeMethod(
        'signInWithUsernamePassword',
        {'username': username, 'password': password});

    return CoreStitchUser.fromMap(result);
  }

  @override
  Future<CoreStitchUser> signInWithGoogle(String authCode) async{
    final LinkedHashMap result = await _channel.invokeMethod(
        'signInWithGoogle', {'code': authCode});
    return CoreStitchUser.fromMap(result);
  }

  @override
  Future<CoreStitchUser> signInWithFacebook(String accessToken) async{
    final LinkedHashMap result = await _channel.invokeMethod(
        'signInWithFacebook', {'token': accessToken});

    return CoreStitchUser.fromMap(result);
  }

  @override
  Future logout() async {
    final result = await _channel.invokeMethod('logout');

    return result;
  }

  @override
  Future getUserId() async {
    final result = await _channel.invokeMethod('getUserId');

    return result;
  }

  @override
  Future<bool> registerWithEmail(String email, String password) async {
    final result = await _channel.invokeMethod(
        'registerWithEmail', {'email': email, 'password': password});

    return result;
  }

  @override
  Future<CoreStitchUser> getUser() async{
    final LinkedHashMap result = await _channel.invokeMethod('getUser');
    print(result);
    return CoreStitchUser.fromMap(result);
  }

  @override
  Future<bool> sendResetPasswordEmail(String email) async {
    final result = await _channel.invokeMethod(
        'sendResetPasswordEmail', {'email': email});

    return result;
  }

  ///
  @override
  Future callFunction(String name, {List args, int requestTimeout}) async{
    final result = _channel.invokeMethod('callFunction', {
      "name": name,
      "args": args,
      "timeout": requestTimeout
    });

    return result;
  }
}