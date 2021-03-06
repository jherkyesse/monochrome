import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:monochrome/components/Signature.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:monochrome/constants/colors.dart';
import 'package:signature/signature.dart';
import 'components/CustomButton.dart';
import 'constants/theme.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Monochrome',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      home: Main(title: 'Monochrome'),
    );
  }
}

class Main extends StatefulWidget {
  Main({Key key, this.title}) : super(key: key);
  final String title;
  @override
  MainState createState() => MainState();
}

class MainState extends State<Main> {
  double penWeight = 5;
  List<Point> pointList = [];
  String editMode = 'pencil';
  SignatureController signatureController;
  @override
  void initState() {
    super.initState();
    setState(() => signatureController = SignatureController(
          penStrokeWidth: penWeight,
          points: pointList,
          penColor: black,
          exportBackgroundColor: white,
        ));
  }

  void setEditMode(_editMode) => setState(() => editMode = _editMode);

  void undo() {
    if (signatureController.points.length == 0) return;
    signatureController.points.removeLast();
    setState(() => pointList = signatureController.points);
  }

  void onChangePenWeight(_penWeight) {
    setState(() {
      penWeight = _penWeight;
      signatureController = SignatureController(
        penStrokeWidth: penWeight,
        points: pointList,
        penColor: black,
        exportBackgroundColor: white,
      );
    });
  }

  void savePng() async {
    if (signatureController.isNotEmpty) {
      final Uint8List data = await signatureController.toPngBytes();
      await Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (BuildContext context) {
            return Scaffold(
              appBar: AppBar(),
              body: Center(
                child: Container(
                  color: Colors.grey[300],
                  child: Image.memory(data),
                ),
              ),
            );
          },
        ),
      );
    } else {
      print('Empty image');
    }
  }

  void reset() {
    final List<Point> _pointList = [];
    setState(() {
      pointList = _pointList;
      signatureController = SignatureController(
        penStrokeWidth: penWeight,
        points: _pointList,
        penColor: black,
        exportBackgroundColor: white,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.canvasColor,
      appBar: AppBar(
        title: Text(widget.title,
            style: TextStyle(
                color: theme.primaryColor,
                fontFamily: 'Titillium',
                fontSize: 24.0,
                fontWeight: FontWeight.w900)),
        backgroundColor: theme.canvasColor,
        shadowColor: Colors.transparent,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: [
                SignatureContainer(signatureController),
                Row(
                  children: [
                    renderIconButton(
                        Foundation.pencil,
                        () => setEditMode('pencil'),
                        editMode == 'pencil',
                        theme),
                    renderIconButton(
                        Ionicons.ios_undo, () => undo(), false, theme),
                    renderIconButton(
                        MaterialIcons.color_lens,
                        () => setEditMode('colorLens'),
                        editMode == 'colorLens',
                        theme),
                    renderIconButton(
                        AntDesign.save, () => savePng(), false, theme),
                    renderIconButton(
                        AntDesign.delete, () => reset(), false, theme),
                  ],
                ),
                Slider(
                  value: penWeight,
                  activeColor: theme.primaryColor,
                  inactiveColor: theme.accentColor,
                  onChanged: onChangePenWeight,
                  divisions: 9,
                  label: "$penWeight",
                  min: 1,
                  max: 10,
                ),
                Text('Draw your image and send it to the monoworld!',
                    style: TextStyle(
                        color: theme.unselectedWidgetColor,
                        fontFamily: 'Titillium',
                        fontSize: 14,
                        fontWeight: FontWeight.w700)),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 10.0,
              ),
              child: renderOutlinedButton('Post to monoworld', () {}, theme),
            )
          ],
        ),
      ),
    );
  }
}
