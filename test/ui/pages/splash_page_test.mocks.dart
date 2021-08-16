// Mocks generated by Mockito 5.0.14 from annotations
// in flutter_app/test/ui/pages/splash_page_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:flutter_app/ui/pages/splash/splash_presenter.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

/// A class which mocks [SplashPresenter].
///
/// See the documentation for Mockito's code generation for more information.
class MockSplashPresenter extends _i1.Mock implements _i2.SplashPresenter {
  MockSplashPresenter() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Stream<String> get navigateToStream =>
      (super.noSuchMethod(Invocation.getter(#navigateToStream),
          returnValue: Stream<String>.empty()) as _i3.Stream<String>);
  @override
  _i3.Future<void> checkAccount({int? durationInSeconds}) =>
      (super.noSuchMethod(
          Invocation.method(
              #checkAccount, [], {#durationInSeconds: durationInSeconds}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  String toString() => super.toString();
}
