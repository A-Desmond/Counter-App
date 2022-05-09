// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:counter_app/authpage.dart';
import 'package:counter_app/home.dart';
import 'package:counter_app/logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
//REGISTER PAGE WIDGET TEST
  testWidgets('Username', (WidgetTester tester) async {
    final usernameField = find.byKey(const ValueKey('username'));

    await tester.pumpWidget(const MaterialApp(home: Register()));
    await tester.enterText(usernameField, 'username ');
    await tester.pump();
    expect(find.text('username '), findsOneWidget);
  });

  testWidgets('Email', (WidgetTester tester) async {
    final emailField = find.byKey(const ValueKey('email'));

    await tester.pumpWidget(const MaterialApp(home: Register()));
    await tester.enterText(emailField, 'email');
    await tester.pump();
    expect(find.text('email'), findsOneWidget);
  });

  testWidgets('Password', (WidgetTester tester) async {
    final passwordField= find.byKey(const ValueKey('password'));

    await tester.pumpWidget(const MaterialApp(home: Register()));
    await tester.enterText(passwordField, 'password');
    await tester.pump();

    expect(find.text('password'), findsOneWidget);
  });


  testWidgets('Navigation to Login Page', ((WidgetTester tester)async {
   await tester.pumpWidget(const MaterialApp(home: Register(),));
   await tester.tap(find.byKey( const ValueKey('login')));
   await  tester.pump();
   expect(find.byKey( const ValueKey('login')), findsOneWidget);
}));

  // LOGIN WIDGET TEST
  testWidgets('Email login', (WidgetTester tester) async {
    final emailField = find.byKey(const ValueKey('login email'));

    await tester.pumpWidget(const MaterialApp(home: Login()));
    await tester.enterText(emailField, 'email');
    await tester.pump();
    expect(find.text('email'), findsOneWidget);
  });

testWidgets('login pasword', (WidgetTester tester)async {
  final loginEmailField = find.byKey( const ValueKey('login password'));
  await tester.pumpWidget(const MaterialApp(home:Login()));
  await tester.enterText(loginEmailField, 'password');
  await tester.pump();
  expect(find.text('password'), findsOneWidget);
  
});



testWidgets('Navigation to Register Page', ((WidgetTester tester)async {
   await tester.pumpWidget(const MaterialApp(home: Login(),));
   await tester.tap(find.byKey( const ValueKey('register')));
   await  tester.pump();
   expect(find.byKey( const ValueKey('register')), findsOneWidget);
}));


}