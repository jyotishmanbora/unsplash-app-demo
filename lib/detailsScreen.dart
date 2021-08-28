import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen(
      {@required this.imageUrl,
      @required this.firstName,
      @required this.lastName,
      this.transitionAnimation,
      this.dpTag,
      this.fNameTag,
      this.lNameTag});
  final imageUrl,
      firstName,
      lastName,
      transitionAnimation,
      dpTag,
      fNameTag,
      lNameTag;

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  List<AnimatedBuilder> getImages() {
    List<AnimatedBuilder> imageList = [];
    for (int i = 1; i <= 2; i++) {
      for (int j = 1; j <= 3; j++) {
        imageList.add(
          AnimatedBuilder(
              animation: widget.transitionAnimation,
              builder: (context, child) {
                return SlideTransition(
                  position: Tween(
                    begin: Offset(0, 1),
                    end: Offset(0, 0),
                  ).animate(
                    CurvedAnimation(
                      parent: widget.transitionAnimation,
                      curve: (j == 1 || j == 3)
                          ? Interval(0.55, 0.75, curve: Curves.ease)
                          : Interval(0.75, 1, curve: Curves.ease),
                    ),
                  ),
                  child: child,
                );
              },
              child: Row(
                children: [
                  Container(
                    height: 180.0,
                    width: 180.0,
                    margin: EdgeInsets.only(left: 25.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/image$j.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.3),
                          offset: Offset(-5.0, 5.0),
                          blurRadius: 13.0,
                          spreadRadius: 0.0,
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        );
      }
    }
    return imageList;
  }

  var dragYstart, dragYupdate;
  double bottomContainerMargin = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 2.0,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leadingWidth: 109.0,
      ),
      body: AnimatedBuilder(
        animation: widget.transitionAnimation,
        builder: (context, child) {
          return SlideTransition(
            position: Tween(
              begin: Offset(1, 0),
              end: Offset(0, 0),
            ).animate(
              CurvedAnimation(
                  parent: widget.transitionAnimation,
                  curve: Interval(0, 0.3, curve: Curves.easeOut)),
            ),
            child: child,
          );
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(widget.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.only(top: 0),
          child: Column(
            children: [
              Expanded(
                flex: 63,
                child: Padding(
                  padding: EdgeInsets.only(left: 45.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 7,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 15.0),
                              child: Hero(
                                tag: widget.dpTag,
                                child: CircleAvatar(
                                  backgroundImage: AssetImage('assets/dp.jpg'),
                                  radius: 40.0,
                                ),
                              ),
                            ),
                            Hero(
                              tag: widget.fNameTag,
                              child: Text(
                                widget.firstName,
                                style: poppinsStyle(context, 35.0),
                              ),
                            ),
                            Hero(
                              tag: widget.lNameTag,
                              child: Text(
                                widget.lastName,
                                style: poppinsStyle(context, 35.0),
                              ),
                            ),
                            AnimatedBuilder(
                              animation: widget.transitionAnimation,
                              builder: (context, child) {
                                return SlideTransition(
                                  position: Tween(
                                    begin: Offset(0, 0.3),
                                    end: Offset(0, 0),
                                  ).animate(
                                    CurvedAnimation(
                                        parent: widget.transitionAnimation,
                                        curve: Interval(0.3, 1,
                                            curve: Curves.ease)),
                                  ),
                                  child: child,
                                );
                              },
                              child: Text(
                                '@userName',
                                style: nunitoText.copyWith(fontSize: 20.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: AnimatedBuilder(
                          animation: widget.transitionAnimation,
                          builder: (context, child) {
                            return SlideTransition(
                              position: Tween(
                                begin: Offset(0, 0.3),
                                end: Offset(0, 0),
                              ).animate(
                                CurvedAnimation(
                                    parent: widget.transitionAnimation,
                                    curve:
                                        Interval(0.3, 1, curve: Curves.ease)),
                              ),
                              child: child,
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 8.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.white,
                                      size: 20.0,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 5.0),
                                      child: Text(
                                        'location',
                                        style:
                                            nunitoText.copyWith(fontSize: 18.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.instagram,
                                    color: Colors.white,
                                    size: 20.0,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 6.0),
                                    child: Text(
                                      'instagram',
                                      style:
                                          nunitoText.copyWith(fontSize: 18.0),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 37,
                child: AnimatedBuilder(
                  animation: widget.transitionAnimation,
                  builder: (context, child) {
                    return SlideTransition(
                      position: Tween(
                        begin: Offset(0, 1),
                        end: Offset(0, 0),
                      ).animate(
                        CurvedAnimation(
                            parent: widget.transitionAnimation,
                            curve: Interval(0.3, 0.55, curve: Curves.ease)),
                      ),
                      child: child,
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: bottomContainerMargin),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40.0),
                          topRight: Radius.circular(40.0)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: GestureDetector(
                            onVerticalDragStart: (DragStartDetails details) {
                              dragYstart = details.localPosition.dy;
                            },
                            onVerticalDragUpdate: (DragUpdateDetails details) {
                              dragYupdate = details.localPosition.dy;
                              setState(() {
                                if (dragYupdate - dragYstart > 0) {
                                  bottomContainerMargin =
                                      (dragYupdate - dragYstart) * 0.1;
                                }
                              });
                            },
                            onVerticalDragEnd: (DragEndDetails details) {
                              if (dragYupdate - dragYstart > 40.0) {
                                Navigator.pop(context);
                              } else {
                                setState(() {
                                  bottomContainerMargin = 0.0;
                                });
                              }
                            },
                            child: Container(
                              height: double.infinity,
                              margin: EdgeInsets.symmetric(horizontal: 40.0),
                              color: Colors.white,
                              child: Center(
                                child: Container(
                                  height: 8.0,
                                  width: 80.0,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                    color: Color(0xffBEBFBB),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 12,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                flex: 15,
                                fit: FlexFit.loose,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 45.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 35.0),
                                        child: Text(
                                          'Photos',
                                          style: poppinsStyle(context, 23.0)
                                              .copyWith(
                                                  color: Color(0xff000000)),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 35.0),
                                        child: Text(
                                          'Likes',
                                          style: poppinsStyle(context, 17.0)
                                              .copyWith(
                                                  color: Color(0xffBEBFBB)),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 35.0),
                                        child: Text(
                                          'Collection',
                                          style: poppinsStyle(context, 17.0)
                                              .copyWith(
                                                  color: Color(0xffBEBFBB)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 85,
                                fit: FlexFit.loose,
                                child: Container(
                                  height: 220.0,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) =>
                                        getImages()[index],
                                    itemCount: getImages().length,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
