import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  // 列表 1
  final listView = Container(
    child: ListView(
      children: const [
        ListTile(
          leading: Icon(Icons.map),
          title: Text('列表页1'),
        ),
        ListTile(
            leading: Icon(Icons.map),
            title: Text('列表页2'),
            textColor: Colors.red),
      ],
    ),
  );
  // 列表 2
  final scrollList = Container(
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Container(
          width: 160,
          color: Colors.red,
        ),
        Container(
          width: 160,
          color: Colors.blue,
        ),
        Container(
          width: 160,
          color: Colors.green,
        ),
        Container(
          width: 160,
          color: Colors.yellow,
        ),
        Container(
          width: 160,
          color: Colors.orange,
        ),
      ],
    ),
  );
  // 网格
  final gridView = GridView.count(
    crossAxisCount: 2,
    children: List.generate(100, (index) {
      return Center(
        child: Text(
          'Item $index',
        ),
      );
    }),
  );

  // 间隔布局列表
  final listDemo = LayoutBuilder(builder: (context, constraints) {
    return SingleChildScrollView(
        child: ConstrainedBox(
      constraints: BoxConstraints(minHeight: constraints.maxHeight),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: List.generate(40, (index) => Text('Item1 $index')),
      ),
    ));
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: const Text('ListPage'),
        ),
        body: listDemo,
      ),
    );
  }
}

// 不同元素混合的列表
/// The base class for the different types of items the list can contain.
abstract class ListItem {
  /// The title line to show in a list item.
  Widget buildTitle(BuildContext context);

  /// The subtitle line, if any, to show in a list item.
  Widget buildSubtitle(BuildContext context);
}

/// A ListItem that contains data to display a heading.
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      heading,
      style: Theme.of(context).textTheme.headlineSmall,
    );
  }

  @override
  Widget buildSubtitle(BuildContext context) => const SizedBox.shrink();
}

/// A ListItem that contains data to display a message.
class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);

  @override
  Widget buildTitle(BuildContext context) => Text(sender);

  @override
  Widget buildSubtitle(BuildContext context) => Text(body);
}
