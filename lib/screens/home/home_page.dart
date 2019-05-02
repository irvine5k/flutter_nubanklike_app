import 'package:flutter/material.dart';
import 'package:nubank_light_clone/screens/home/bloc/bloc_home.dart';
import 'package:nubank_light_clone/screens/home/widgets/card_home.dart';
import 'package:nubank_light_clone/screens/menu/menu_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  BlocHome bloc = BlocHome();

  AnimationController controller;
  Animation animOpacity;
  Animation animOpacityHome;
  Animation animTranslate;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    animOpacity = Tween(begin: 0.0, end: 1.0).animate(controller);
    animOpacityHome = Tween(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(parent: controller, curve: Interval(0.0, 0.1)));
    animOpacityHome.addListener(() {
      setState(() {});
    });
    animTranslate = Tween(begin: 0.0, end: 470.0).animate(controller);
    animTranslate.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    bloc.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = [
      CardHome(),
      CardHome(),
      CardHome(),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          AnimatedBuilder(
            animation: animOpacity,
            builder: (BuildContext context, Widget child) {
              return Opacity(
                opacity: animOpacity.value,
                child: MenuPage(
                  animated: false,
                  scroll: false,
                ),
              );
            },
          ),
          Container(
            child: Column(
              children: <Widget>[
                Transform.translate(
                  offset: Offset(0.0, animTranslate.value),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.05),
                    child: Transform.translate(
                      offset: Offset(0.0, 0.0),
                      child: GestureDetector(
                        onVerticalDragUpdate: (details) {
                          controller.value += details.primaryDelta / 470.0;
                        },
                        onVerticalDragEnd: (details) {
                          if (controller.value > 0.5) {
                            controller.forward();
                          } else {
                            controller.reverse();
                          }
                        },
                        child: Container(
                          constraints: BoxConstraints(
                              maxHeight:
                                  MediaQuery.of(context).size.height * 0.58),
                          child: Container(
                            child: PageView.builder(
                              itemCount: _pages.length,
                              scrollDirection: Axis.horizontal,
                              onPageChanged: (index) =>
                                  bloc.pageChange(index: index),
                              itemBuilder: (context, index) {
                                return _pages[index];
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                //DOT PAGE
                animOpacityHome.value == 0.0
                    ? Container(
                        width: 0.0,
                        height: 0.0,
                      )
                    : Opacity(
                        opacity: animOpacityHome.value,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Container(
                            constraints: BoxConstraints(
                                minWidth: 15.0 * _pages.length <=
                                        MediaQuery.of(context).size.width
                                    ? 15.0 * _pages.length
                                    : MediaQuery.of(context).size.width,
                                maxWidth: 15.0 * _pages.length <=
                                        MediaQuery.of(context).size.width
                                    ? 15.0 * _pages.length
                                    : MediaQuery.of(context).size.width,
                                maxHeight: 20.0),
                            child: ListView.builder(
                              itemCount: _pages.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: StreamBuilder(
                                    stream: bloc.positionPage.stream,
                                    builder: (context, snapshot) {
                                      return snapshot.hasData
                                          ? CircleAvatar(
                                              radius: 3.5,
                                              backgroundColor:
                                                  index == snapshot.data
                                                      ? Colors.grey[400]
                                                      : Color.fromRGBO(
                                                          99, 46, 145, 1.0),
                                            )
                                          : Container();
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),

                animOpacityHome.value == 0.0
                    ? Container(
                        width: 0.0,
                        height: 0.0,
                      )
                    : Expanded(child: Container()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
