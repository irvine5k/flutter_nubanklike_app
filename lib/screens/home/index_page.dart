import 'package:flutter/material.dart';
import 'package:nubank_light_clone/screens/home/bloc/bloc_drag_down.dart';
import 'package:nubank_light_clone/screens/menu/menu_page.dart';
import './home_page.dart';
import './bloc/bloc_root.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  BlocRoot bloc = BlocRoot();
  BlocDragDown blocdrag;

  @override
  void initState() {
    positionUpdated.listen((value) {
      if (value > 0) blocdrag.jumptoBottom();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text("Logo"),
          ),
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.13)),
      body: StreamBuilder(
        stream: bloc.selectPage.stream,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? Stack(
                  children: <Widget>[
                    HomePage(),
                    snapshot.data == true
                        ? MenuPage(
                            animated: false,
                            scroll: bloc.scroll,
                          )
                        : MenuPage(
                            animated: true,
                            scroll: bloc.scroll,
                          ),
                  ],
                )
              : Container();
        },
      ),
    );
  }
}
