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

enum AnimalType { rato, besouro, esponja }

void enumeration(AnimalType animalType) {
  if (animalType == AnimalType.rato) {
    print("CADE O RATOOO?");
  } else if (animalType == AnimalType.besouro) {
    print("churrascão de inseto");
  }
}

void enumerationSwitchVersion(AnimalType animalType) {
  switch (animalType) {
    case AnimalType.esponja:
      print("esponja");
      break;
    case AnimalType.besouro:
      print("besouro");
      break; //break leave the switch statment
    case AnimalType.rato:
      print("rato");
      return; //return don't leave the switch statment
  }
  print("function is finished");
}

class Person {
  Person(this.name, this.age);

  void run() {
    print("Running");
  }

  void breathe() {
    print("Breathing");
  }

  void methodTest() {
    print(name);
  }

  final String name;
  final int age;
}

void testingClasses() {
  final baz = Person("baz", 10);
  baz.run();
  baz.breathe();
}

void objects() {
  //final foo = Person();
  //objects are instances of classes
}

//constructors can be also call initializers
void constructorsAndMethods() {
  final foo = Person("Foo Bar", 24);
  print(foo.name);
  print(foo.age);
  foo.methodTest();
}

//-------------------------------------------------
//---------inheritance and subclasses--------------
//-------------------------------------------------
//abstract class can't be instantiate, they're useful to make a set of functions to other classes use from.
abstract class LivingThing {
  String? name;
  void breath() {
    print('$name is breathing');
  }

  void move() {
    print('$name is moving');
  }
}

class Cat extends LivingThing {
  final String name;
  Cat(this.name);
}

void testSubClasses() {
  final fluffers = Cat('Soneca');
  fluffers.move();
  fluffers.breath();
}

//-------------------------------------------------
//---------factory Constructors--------------------
//-------------------------------------------------

class Animal extends Object {
  final String name;
  Animal(this.name);

  //-------------------------------------------------
  //---------Custom Operators------------------------
  //-------------------------------------------------

  @override
  bool operator ==(covariant Animal other) => other.name == name;

  @override
  int get hashCode => name.hashCode;

  factory Animal.fluffBall() {
    return Animal('Fluff Ball');
  }
}

void factoryConstructors() {
  final bolota = Animal.fluffBall();
  print(bolota);
}

void customOperators() {
  final dog = Animal('foo');
  final dog1 = Animal('foo');
  if (dog == dog1) {
    print('mema fita');
  } else {
    print('diferentão pô');
  }
}

//-------------------------------------------------
//-----------------Extensions----------------------
//-------------------------------------------------

extension Corrida on Cat {
  void run() {
    print('Cat $name is running');
  }
}

class PersonProprieties {
  final String firstName;
  final String lastName;
  PersonProprieties(this.firstName, this.lastName);
}

extension NomeInteiro on PersonProprieties {
  String get fullName => '$firstName $lastName';
}

void extensions() {
  var bar = PersonProprieties('Felpudo', 'Soneca');
  print(bar.fullName);
}

//-------------------------------------------------
//-----------------Asynchronous--------------------
//-------------------------------------------------

Future<int> heavyFutureMultiplicaPorDois(int a) {
  return Future.delayed(const Duration(seconds: 3), () => a * 2);
}

void noFuturo() async {
  final result = await heavyFutureMultiplicaPorDois(10);
  print(result);
}

//-------------------------------------------------
//----------------------Streams--------------------
//-------------------------------------------------

Stream<String> getName() {
  return Stream.periodic(const Duration(seconds: 1), (value) {
    return 'Foo';
  });
}

void corrente() async {
  await for (final value in getName()) {
    print(value);
  }
  print('Stream Finished');
}

//-------------------------------------------------
//------------------GENEREATORS--------------------
//-------------------------------------------------

Iterable<int> umDoisTres() sync* {
  yield 1;
  yield 2;
  yield 3;
}

void generators() {
  print(umDoisTres());
  for (final value in umDoisTres()) {
    print(value);
    if (value == 2) {
      break;
    }
  }
}

//-------------------------------------------------
//------------------Generics-----------------------
//-------------------------------------------------

class PairOfStrings {
  final String value1;
  final String value2;
  PairOfStrings(this.value1, this.value2);
}

class PairOfIntegers {
  final int value1;
  final int value2;
  PairOfIntegers(this.value1, this.value2);
}

class Pair<A, B> {
  final A value1;
  final B value2;
  Pair(this.value1, this.value2);
}

void generics() {
  final names = Pair('Churrasco', null);
  print([names.value1, names.value2]);
}

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
    //enumeration(AnimalType.besouro);
    //testingClasses();
    //constructorsAndMethods();
    //testSubClasses();
    //factoryConstructors();
    //customOperators();
    //extensions();
    //noFuturo();
    //corrente();
    //generators();
    generics();
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
