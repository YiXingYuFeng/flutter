// 如果一个对象不受限于到哪一类型可以执行为Objec类型

// Dart语言要求一健全的空安全方式编写代码
// 空安全能够放置意外访问null的变量而导致错误，这样的错误也被称之为空解引用错误
// 访问一个求职位null的表达式的属性或调用方法时，会发生空解引用错误
// 但是对于toString()方法和hashCode属性，空安全会体现出例外情况

void main(){
  // 空安全
  // 当为一个变量、参数、另外一个组件指定类型时，可以控制该类型是够允许为null。
  // 要让一个变量为空，可以在类型声明的末尾添加?
  String? name;
  name = null;
  /**
   * 如果不添加？，会报错
   * Error: The value 'null' can't be assigned to a variable of type 'String' because 'String' is not nullable.
      name = null;
   */

  /**
   * 非空变量在使用之前一定要初始化变量的值
   * 不然会提示报错：Error: Non-nullable variable 'lineCount' must be assigned before it can be used.
      print(lineCount);
   */
  int lineCount = 0;
  print(lineCount);


  /**
   * 延迟初始化变量
   * late 修饰符两种用法
   *  1: 声明一个非空变量，但不在声明时初始化
   *  2: 延迟初始化一个变量
   */
  late String description;
  description = 'Feijoada!';
  print(description);

  /**
   * 终值final 常量const
   * final变量只能设置一次
   * const变量是编译时常量
   */
  final nameCode = 'jack';
  // nameCode = 'd22';  Error: Can't assign to the final variable 'nameCode'

}
