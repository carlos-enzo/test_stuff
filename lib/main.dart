import 'package:flutter/material.dart';
import 'package:test_stuff/fl_chart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _controller = TextEditingController();
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Connectivity example app'),
        ),
        body: Center(child: LineChartSample1())

        // PinCodeTextFieldTest(
        //   controller: _controller,
        //   focusNode: _focusNode,
        // ),
        // Stack(
        //   children: [
        //     // PinCodeTextFieldTest(
        //     //   controller: _controller,
        //     //   focusNode: _focusNode,
        //     // ),
        //     Align(
        //       child: GestureDetector(
        //         onTap: () => showModalBottomSheet(
        //             context: context,
        //             builder: (context) => Stack(
        //                   children: [
        //                     Positioned(
        //                       bottom: 0,
        //                       child: Padding(
        //                         padding: const EdgeInsets.symmetric(horizontal: 20.0),
        //                         child: Container(
        //                           height: 400,
        //                           decoration: BoxDecoration(
        //                               color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(8))),
        //                         ),
        //                       ),
        //                     ),
        //                     Positioned(
        //                       bottom: 350,
        //                       child: Padding(
        //                         padding: const EdgeInsets.symmetric(horizontal: 8.0),
        //                         child: Container(
        //                           height: 100,
        //                           color: Colors.black,
        //                         ),
        //                       ),
        //                     ),
        //                   ],
        //                 )),
        //         child: PlayOneShotAnimation(
        //           dimensions: 300,
        //         ),
        //       ),
        //     )
        //   ],
        // ),
        );
  }

  void onTextChanged(String value) {
    print('value: $value');
  }
}
