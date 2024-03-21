import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const int kMobile = 1000;
const int kTablet = 1400;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

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
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: width,
          height: height,
          color: Colors.red,
          child: Center(
              child: Text(
            'Width: $width\nHeight: $height',
            style: TextStyle(
              fontSize: 100 * (width / height),
            ),
          )),
        ),
      ),
      // body: Column(
      //   children: [
      //     Container(
      //       height: 100,
      //       color: Colors.red,
      //     ),
      //     Expanded(
      //         child: Container(
      //       color: Colors.green,
      //     )),
      //     Expanded(
      //         child: Container(
      //       color: Colors.blue,
      //     ))
      //   ],
      // ),
      // body: Column(
      //   children: [
      //     Flexible(
      //       flex: 2,
      //       child: Container(
      //         color: Colors.red,
      //       ),
      //     ),
      //     Flexible(
      //       flex: 5,
      //       child: Container(
      //         color: Colors.green,
      //       ),
      //     ),
      //     Flexible(
      //       // flex: 1,
      //       child: Container(
      //         height: 100,
      //         color: Colors.blue,
      //       ),
      //     ),
      //   ],

      // body: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: LayoutBuilder(builder: (context, constraints) {
      //     return _build(
      //       constraints,
      //       context,
      //     );
      //   }),
      // ),
      // body: OrientationBuilder(builder: (context, orientation) {
      //   return GridView.count(
      //       crossAxisCount: orientation == Orientation.portrait ? 2 : 6,
      //       children: List.generate(20, (index) {
      //         return Container(
      //           color: Colors.blue,
      //           margin: const EdgeInsets.all(10),
      //           child: Center(
      //             child: Text(
      //               'Item $index',
      //               style: Theme.of(context).textTheme.headlineSmall,
      //             ),
      //           ),
      //         );
      //       }));
      // }),
      // This trailing comma makes auto-formatting nicer for build methods.
      // ),
    );
  }

  Widget _build(BoxConstraints constraints, BuildContext context) {
    int device = constraints.maxWidth < kMobile ? kMobile : kTablet;
    if (device == kMobile) {
      return Row(children: _buildChildren(constraints, true));
    } else {
      return Column(children: _buildChildren(constraints, false));
    }
  }

  List<Widget> _buildChildren(BoxConstraints constraints, bool isAMobile) {
    return [
      Container(
        color: Colors.blue,
        // margin: const EdgeInsets.all(10),
        width: constraints.maxWidth * (isAMobile ? 0.4 : 1),
        height: constraints.maxHeight * 0.3,
        child: Center(
          child: Text(
            'Item 1',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
      ),
      Container(
        color: Colors.red,
        // margin: const EdgeInsets.all(10),
        width: constraints.maxWidth * (isAMobile ? 0.59 : 1),
        height: constraints.maxHeight * (isAMobile ? 0.3 : 0.1),
        child: Center(
          child: Text(
            'Item 2',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
      ),
    ];
  }

  // Widget buildRowToTablet(BoxConstraints constraints, BuildContext context) {
  //   return Column(
  //     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [
  //       Container(
  //         color: Colors.blue,
  //         // margin: const EdgeInsets.all(10),
  //         width: constraints.maxWidth,
  //         height: constraints.maxHeight * 0.3,
  //         child: Center(
  //           child: Text(
  //             'Item 1',
  //             style: Theme.of(context).textTheme.headlineSmall,
  //           ),
  //         ),
  //       ),
  //       Container(
  //         color: Colors.red,
  //         // margin: const EdgeInsets.all(10),
  //         width: constraints.maxWidth,
  //         height: constraints.maxHeight * 0.1,
  //         child: Center(
  //           child: Text(
  //             'Item 2',
  //             style: Theme.of(context).textTheme.headlineSmall,
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
