library flutter_mongo_stitch_platform_interface;

import 'dart:async';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'src/method_flutter_mongo_stitch.dart';

/// The interface that implementations of flutter_mongo_stitch must implement.
///
/// Platform implementations should extend this class rather than implement it as `flutter_mongo_stitch`
/// does not consider newly added methods to be breaking changes. Extending this class
/// (using `extends`) ensures that the subclass will get the default implementation, while
/// platform implementations that `implements` this interface will be broken by newly added
/// [FlutterMongoStitchPlatform] methods.
abstract class FlutterMongoStitchPlatform extends PlatformInterface {
  /// Constructs a FlutterMongoStitchPlatform.
  FlutterMongoStitchPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterMongoStitchPlatform _instance =
      MethodChannelFlutterMongoStitch();

  /// The default instance of [FlutterMongoStitchPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterMongoStitch].
  static FlutterMongoStitchPlatform get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [FlutterMongoStitchPlatform] when they register themselves.
  static set instance(FlutterMongoStitchPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future connectToMongo(String appId) async {
    throw UnimplementedError('connectToMongo() has not been implemented.');
  }

  ///

  Future insertDocument({
    required String collectionName,
    required String databaseName,
    required Map<String, Object?> data,
  }) async {
    throw UnimplementedError('insertDocument() has not been implemented.');
  }

  Future insertDocuments({
    required String collectionName,
    required String databaseName,
    required List<String> list,
  }) async {
    throw UnimplementedError('insertDocuments() has not been implemented.');
  }

  Future findDocuments({
    String? collectionName,
    String? databaseName,
    dynamic filter,
    String? projection,
    int? limit,
    String? sort,
  }) async {
    throw UnimplementedError('findDocuments() has not been implemented.');
  }

  Future findFirstDocument(
      {String? collectionName,
      String? databaseName,
      dynamic filter,
      String? projection}) async {
    throw UnimplementedError('findFirstDocument() has not been implemented.');
  }

  Future deleteDocument(
      {String? collectionName, String? databaseName, dynamic filter}) async {
    throw UnimplementedError('deleteDocument() has not been implemented.');
  }

  Future deleteDocuments(
      {String? collectionName, String? databaseName, dynamic filter}) async {
    throw UnimplementedError('deleteDocuments() has not been implemented.');
  }

  Future countDocuments(
      {String? collectionName, String? databaseName, dynamic filter}) async {
    throw UnimplementedError('countDocuments() has not been implemented.');
  }

  ///
  Future updateDocument(
      {String? collectionName,
      String? databaseName,
      String? filter,
      String? update}) async {
    throw UnimplementedError('updateDocument() has not been implemented.');
  }

  Future updateDocuments(
      {String? collectionName,
      String? databaseName,
      String? filter,
      String? update}) async {
    throw UnimplementedError('updateDocuments() has not been implemented.');
  }

  aggregate(
      {required String collectionName,
      required String databaseName,
      List<String>? pipeline}) {
    throw UnimplementedError('aggregate() has not been implemented.');
  }

  ///

  Future signInAnonymously() async {
    throw UnimplementedError('signInAnonymously() has not been implemented.');
  }

  Future/*<CoreStitchUser>*/ signInWithUsernamePassword(
      String username, String password) async {
    throw UnimplementedError(
        'signInWithUsernamePassword() has not been implemented.');
  }

  Future/*<CoreStitchUser>*/ signInWithGoogle(String authCode) async {
    throw UnimplementedError('signInWithGoogle() has not been implemented.');
  }

  Future/*<CoreStitchUser>*/ signInWithFacebook(String accessToken) async {
    throw UnimplementedError('signInWithFacebook() has not been implemented.');
  }

  Future/*<CoreStitchUser>*/ signInWithCustomJwt(String accessToken) async {
    throw UnimplementedError('signInWithCustomJwt() has not been implemented.');
  }

  Future signInWithCustomFunction(String json) async {
    throw UnimplementedError(
        'signInWithCustomFunction() has not been implemented.');
  }

  Future signInWithApple(String json) async {
    throw UnimplementedError('signInWithApple() has not been implemented.');
  }

  Future linkCredentials(Map<String, Object> credsJson) async{
    throw UnimplementedError('linkCredentials() has not been implemented.');
  }

  Future logout() async {
    throw UnimplementedError('logout() has not been implemented.');
  }

  Future getUserId() async {
    throw UnimplementedError('getUserId() has not been implemented.');
  }

  Future<bool?> registerWithEmail(String email, String password) async {
    throw UnimplementedError('registerWithEmail() has not been implemented.');
  }

  Future/*<CoreStitchUser>*/ getUser() async {
    throw UnimplementedError('getUser() has not been implemented.');
  }

  Future<bool?> sendResetPasswordEmail(String email) async {
    throw UnimplementedError(
        'sendResetPasswordEmail() has not been implemented.');
  }

  ///

  Future callFunction(String name, {List? args, int? requestTimeout}) async {
    throw UnimplementedError('callFunction() has not been implemented.');
  }

  /// Web-specific
  Future setupWatchCollection(String collectionName, String databaseName,
      {List<String>? ids, bool? asObjectIds, String? filter}) async {
    throw UnimplementedError(
        'setupWatchCollection() has not been implemented.');
  }
}
