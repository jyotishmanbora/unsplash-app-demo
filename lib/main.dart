import 'package:flutter/material.dart';
import 'constants.dart';
import 'detailsScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Container> produceImages() {
      List<Container> imageList = [];
      for (int j = 1; j <= 2; j++) {
        for (int i = 1; i <= 3; i++) {
          imageList.add(Container(
            height: 220,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image$i.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.0, bottom: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                return DetailsScreen(
                                  imageUrl: 'assets/image$i.jpg',
                                  firstName: 'FirstName$i',
                                  lastName: 'LastName$i',
                                  dpTag: 'dp$j$i',
                                  fNameTag: 'firstName$j$i',
                                  lNameTag: 'lastName$j$i',
                                  transitionAnimation: animation,
                                );
                              },
                              transitionDuration:
                                  const Duration(milliseconds: 900),
                            ),
                          );
                        },
                        child: Hero(
                          tag: 'dp$j$i',
                          child: CircleAvatar(
                            backgroundImage: AssetImage('assets/dp.jpg'),
                            radius: 15.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 13.0),
                        child: Hero(
                          tag: 'firstName$j$i',
                          child: Text(
                            'FirstName$i',
                            style: poppinsStyle(context, 15.0),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 7.0),
                        child: Hero(
                          tag: 'lastName$j$i',
                          child: Text(
                            'LastName$i',
                            style: poppinsStyle(context, 15.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ));
        }
      }
      return imageList;
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Plants',
          style: poppinsStyle(context, 22.0),
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(top: 0),
        itemBuilder: (context, index) => produceImages()[index],
        itemCount: produceImages().length,
      ),
    );
  }
}

// class ImagesContainer extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     List<Container> produceImages() {
//       List<Container> imageList = [];
//       for (int j = 1; j <= 2; j++) {
//         for (int i = 1; i <= 3; i++) {
//           imageList.add(Container(
//             height: 220,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/image$i.jpg'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 Padding(
//                   padding: EdgeInsets.only(left: 20.0, bottom: 30.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.of(context).push(
//                             PageRouteBuilder(
//                               pageBuilder:
//                                   (context, animation, secondaryAnimation) {
//                                 return DetailsScreen(
//                                   imageUrl: 'assets/image$i.jpg',
//                                   firstName: 'FirstName$i',
//                                   lastName: 'LastName$i',
//                                   dpTag: 'dp$j$i',
//                                   fNameTag: 'firstName$j$i',
//                                   lNameTag: 'lastName$j$i',
//                                   transitionAnimation: animation,
//                                 );
//                               },
//                               transitionDuration:
//                                   const Duration(milliseconds: 900),
//                             ),
//                           );
//                         },
//                         child: Hero(
//                           tag: 'dp$j$i',
//                           child: CircleAvatar(
//                             backgroundImage: AssetImage('assets/dp.jpg'),
//                             radius: 15.0,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(left: 13.0),
//                         child: Hero(
//                           tag: 'firstName$j$i',
//                           child: Text(
//                             'FirstName$i',
//                             style: poppinsText.copyWith(
//                               fontSize: 15.0,
//                             ),
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(left: 7.0),
//                         child: Hero(
//                           tag: 'lastName$j$i',
//                           child: Text(
//                             'LastName$i',
//                             style: poppinsText.copyWith(
//                               fontSize: 15.0,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ));
//         }
//       }
//       return imageList;
//     }

//     return ListView.builder(
//       padding: EdgeInsets.only(top: 0),
//       itemBuilder: (context, index) => produceImages()[index],
//       itemCount: produceImages().length,
//     );
//   }
// }
