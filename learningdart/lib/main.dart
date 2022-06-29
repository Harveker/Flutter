import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

String getFullName(String firstName, String lastName) {
  return '$firstName $lastName';
}

String printMyName() {
  return '';
}

void main() {
  runApp(const MyApp());
}

void operators() {
  final name = 'bar';
  var age = 24;
  final meiOfAge = age / 2;
  final doubleOfAge = age * 2;
  final ageMinusOne = --age;
  print(meiOfAge);
  print(doubleOfAge);
  print(ageMinusOne);
  if (name == 'foo') {
    print('yes this is foo');
  } else if (name != 'bar') {
    print("No this isn't bar");
  } else {
    print('i don\'t know what it is');
  }
}

void lists() {
  final names = ['Foo', 'Bar', 'baz'];
  final length = names.length;
  print(length);
  names.add('My name');
  print(names);
}

void sets() {
  var names = {'foo', 'bar', 'baz'};
  names.add('foo');
  names.add('bar');
  names.add('baz');
  print(names);
}

void maps() {
  var person = {
    'age': 20,
    'name': 'Foo',
  };
  print(person);
  person['name'] = 'fooooo';
  print(person);
}

void nullValues(String? name, String? names, String? firstName,
    String? middleName, String? lastName) {
  String? name = null;
  print(name);
  name = 'Foo';
  print(name);

  List<String?>? names = ['Foo', 'Bar', null];
  names = null;

  //testing null values through if and the ?? operator.
  //The ?? select the first non-null variable that appears, otherwise it testes the next.
  if (firstName != null) {
    print("first name is first non-null value");
  } else if (middleName != null) {
    print("middle name is the first non-null value");
  } else if (lastName != null) {
    print("last name is the first non-null value");
  }
  var firstNonNullValue = firstName ?? middleName ?? lastName;
  print(firstNonNullValue);

  //testing the null-aware assignment operator (??=). if the datatype is null in the left the ??= assign the non-null data of the right to the left.
  String? name0 = firstName;
  name0 ??= middleName;
  name0 ??= lastName;
  print(name0);
}

void conditionalInvocation(List<String>? names) {
  //if names is not null after the ? operator, then the lenght will be draw to the Length const, otherwise if names is null,
  //length will also be null which the operator ?? will select the next value, which here is 0.
  final Length = names?.length ?? 0;
}

//enumarations can enumarate characteristics of a
enum PersonPropertities { firstName, lastName, age }

enum AnumalType { rato, besouro, esponja }

void enumeration() {
  print(PersonPropertities.firstName);
}

void objects() {}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //operators();
    //lists();
    //sets();
    //maps();
    //nullValues('Foo', 'bar', null, null, 'bazer');
    //conditionalInvocation(null);
    enumeration();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(
        title: 'Barter',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
