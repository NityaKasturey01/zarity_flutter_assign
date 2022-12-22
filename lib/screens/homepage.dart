import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              height: 50,
            margin: EdgeInsets.only(top: 30),
            child: Row(
              children: [
                Container(
                child: Icon(Icons.menu, size: 30,),
                  margin: EdgeInsets.only(right: 290),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.chat, size: 30,),
                  margin: EdgeInsets.only(right: 5),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.notifications, size: 30,)
                ),

              ],
            )
            ),

            Container(
              margin: EdgeInsets.only(top: 20),
              height: 100,
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Good Afternoon,",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  color: Colors.black54,
                                  letterSpacing: .2,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          Text(
                            "John Doe",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  color: Colors.lightBlue,
                                  letterSpacing: .2,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ],
                      )
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Container(
                        width: 100,
                        child: RaisedButton(
                          elevation: 1.0,
                          onPressed: (){
                          },
                          padding: EdgeInsets.all(15.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          color: Color.fromRGBO(255, 230, 0, 1),
                          child: Row(
                            children: [
                              Text(
                                "Show Dialog",
                                textAlign: TextAlign.left,
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      color: Colors.blueGrey,
                                      letterSpacing: .2,
                                      fontSize: 12,
                                  ),
                                ),
                              ),
                              Icon(Icons.arrow_forward_ios_outlined,
                                color: Colors.blueGrey,),
                            ],
                          )

                        ),
                      )
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "View your Insights",
                textAlign: TextAlign.left,
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    color: Colors.black54,
                    letterSpacing: .2,
                    fontSize: 18,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
