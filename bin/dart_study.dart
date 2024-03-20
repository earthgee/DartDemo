import 'package:args/args.dart';

const String version = '0.0.1';

ArgParser buildParser() {
  return ArgParser()
    ..addFlag(
      'help',
      abbr: 'h',
      negatable: false,
      help: 'Print this usage information.',
    )
    ..addFlag(
      'verbose',
      abbr: 'v',
      negatable: false,
      help: 'Show additional command output.',
    )
    ..addFlag(
      'version',
      negatable: false,
      help: 'Print the tool version.',
    );
}

void printUsage(ArgParser argParser) {
  print('Usage: dart dart_study.dart <flags> [arguments]');
  print(argParser.usage);
}

void main(List<String> arguments) {
  // print('hello world');
  //
  // String? s = "hello";
  // s = null;

  //集合
  var list = [1,2,3];
   var list2 = [0,...list];
   print(list2);

   //高阶函数(胖箭头缩写法)
   var newList = list.map((e) => e * 2 + 1);
    print(newList);

    //高阶函数
    final fruitList = ["apples", "bananas", "oranges"];
    fruitList.forEach((element) {
      print("${fruitList.indexOf(element)}: $element");
    });

    var p = Point(3, 3);
    print(p);

    var anotherP = Point(5, 5);
    print(p + anotherP);

    //mixin 在多重继承中复用某个类中代码的方法模式
    final processor = Processor();
    processor.process();
}

//类
class Point {

  //类构造器
  int x;
  int y;

  Point(this.x, this.y);

  @override
  String toString() {
    return 'Point{x: $x, y: $y}';
  }

  Point.fromJson(Map json):
      x=json['x'], y=json['y'];

  //操作符重载
  Point operator +(Point p) => Point(x + p.x, y + p.y);

}

class Point3D extends Point {

  int z;

  Point3D(super.x, super.y, this.z);

}

mixin Logger on Taggable{
  void log(Object message) {
    print("[$tag] $message");
  }
}

abstract class Taggable {

  String tag = "";

}

class Processor extends Taggable with Logger {

  @override
  String tag = "Xprocessor";

  void process() {
    log(1);
    log('x');
  }

}



