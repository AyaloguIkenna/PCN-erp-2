import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:pcn_erp/nav/nav.dart';

class BoyB extends StatefulWidget {
  //const BoyB({Key? key}) : super(key: key);

  @override
  _BoyBState createState() => _BoyBState();
}

class _BoyBState extends State<BoyB> {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          //backgroundColor: Colors.transparent,

          title: Text(
            'The Boys Brigade ',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),

          centerTitle: true,
          flexibleSpace: ClipRRect(
              //
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30)),
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/bb.png'),
                        fit: BoxFit.fill,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.5), BlendMode.darken))),
              )),
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50))),
          actions: <Widget>[
            // Using Stack to show Notification Badge
          ],
        ),

        //extendBodyBehindAppBar: true,

        drawer: Navbar(),
        body: Center(
          heightFactor: 2.0,
            //StreamBuilder<QuerySnapshot>(
            // stream: FirebaseFirestore.instance.collection("parish")
            // .snapshots(),
            //.asBroadcastStream(),
            // builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            //  if (!snapshot.hasData) {
            //   return Center(child: CircularProgressIndicator());
            // } else {
            // var messages = snapshot.data.docs;
            // Map<String, dynamic> messages = snapshot.data.docs as Map<String, dynamic>;

            // return ListView.separated(
            //  padding: EdgeInsets.symmetric(
            //    horizontal: 9.0, vertical: 9.0),
            // itemCount: messages.length,
            // separatorBuilder: (context, index) => Divider(),
            // itemBuilder: (context, index) {
            // DocumentSnapshot rch = messages[index];
            child: Card(
                elevation: 20,
                color: Colors.white24,
                //widthFactor: 20,
                //heightFactor: 20,
                child: SizedBox(
                  width: 250.0,
                  height: 80.0,
                  child: DefaultTextStyle(
                    style: const TextStyle(
                        fontSize: 35.0,
                        fontFamily: 'Agne',
                        color: Colors.black),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText('The Boys Brigade'),
                        TypewriterAnimatedText(' Coming Soon'),
                      ],
                    ),
                  ),
                )))));

    // );
  }
  // })));

}
