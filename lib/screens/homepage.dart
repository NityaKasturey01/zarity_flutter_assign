

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String dropdownvalue = 'Immediate';
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  // List of items in our dropdown menu
  var items1 = [
    'Immediate',
    'This Week',
    'This Month'
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
        shrinkWrap: true,
        children:[Column(
          children: [
            Container(
              height: 50,
            margin: EdgeInsets.only(top: 30),
            child: Row(
              children: [
                Container(
                child: IconButton(
                  icon:const Icon(Icons.menu), iconSize: 30,  onPressed: () {
                    print("onclick");
                  _scaffoldKey.currentState?.openDrawer();
                },),
                  margin: EdgeInsets.only(right: 260),
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
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => _buildPopupDialog(context),
                            );
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
            ),

            ListView(
              shrinkWrap: true,
            children:[Container(
              margin: EdgeInsets.only(top: 30),
              child: Container(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('task').snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                    //print("stream22"+streamSnapshot.data!.docs[0]['product_name'].toString());
                    if (streamSnapshot.hasData) {
                      return Scrollbar(
                          child: Column(
                            children: [
                              GridView.builder(
                                shrinkWrap: true,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3),
                                itemCount: streamSnapshot.data!.docs.length,
                                padding: EdgeInsets.all(2.0),
                                itemBuilder: (BuildContext context, int index) {
                                  final DocumentSnapshot documentSnapshot =
                                  streamSnapshot.data!.docs[index];
                                  return Container(
                                    child: Card(
                                      color: Colors.amberAccent,

                                      child: Column(
                                        children: [
                                          Text(documentSnapshot['name']),
                                        ],
                                      ),
                                    ),
                                    padding: EdgeInsets.all(2.0),
                                  );
                                },
                              ),

                            ],
                          )
                      );

                    }else{
                      print("not there");
                    }

                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            )]),

          Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Scrollbar(
                    child: Container(
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance.collection('task').snapshots(),
                      builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                        //print("stream22"+streamSnapshot.data!.docs[0]['product_name'].toString());
                        if (streamSnapshot.hasData) {
                          return Scrollbar(
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: streamSnapshot.data!.docs.length,
                                    itemBuilder: (context, index) {
                                      final DocumentSnapshot documentSnapshot =
                                      streamSnapshot.data!.docs[index];
                                      return Card(
                                        margin: const EdgeInsets.all(10),
                                        child: ListTile(
                                          title: Text(documentSnapshot['name']),
                                          subtitle:Text("Rs "+documentSnapshot['name']),
                                          trailing: SizedBox(
                                            width: 50,
                                            child: Row(
                                              children: [
                                                // Press this button to edit a single product
                                                IconButton(
                                                  icon: const Icon(Icons.add_shopping_cart),
                                                  onPressed: (){},),
                                                // This icon button is used to delete a single product
                                              ],
                                            ),
                                          ),
                                        ),

                                      );
                                    },
                                  )

                          );

                        }else{
                          print("not there");
                        }

                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),
                ))
          ],
        )]),
      ),

      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Text('Setting'),
            ),
            ListTile(
              leading: Icon(
                Icons.password_sharp,
              ),
              title: const Text('Change Password'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.person_pin_sharp,
              ),
              title: const Text('Change Username'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      bottomNavigationBar: CurvedNavigationBar(

        items: <Widget>[
          Icon(Icons.home, size: 25),
          Icon(Icons.category_sharp, size: 25),
          Icon(Icons.add_shopping_cart, size: 25),
          Icon(Icons.person, size: 25),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.orangeAccent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        //currentIndex: _selectedIndex,
        //unselectedItemColor: Colors.black54,
        //selectedItemColor: Colors.amber[800],
        //onTap: _onItemTapped,
        onTap: (index) {
          setState(() {
            // if (index==1 || index==0)
            // {_page = index;
            // _selectedIndex = index;
            // print("mob_no index: "+index.toString());
            // }
            // if (index==3){
            //   _page = 2;
            //   _selectedIndex = 3;
            //   print("mob_nohere");
            //   getData();
            //   print("mob_no: val"+profileName);
            //   myController.text=profileName;
            //   print("mob_no: "+myController.text);
            // } if (index==2){
            //   _selectedIndex=2;
            // }
          });
        },

      ),
    );
  }



  Widget _buildPopupDialog(BuildContext context) {



    return new AlertDialog(

      title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
        Text('Task List', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),),
            DropdownButton(

              // Initial Value
              value: dropdownvalue,

              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: items1.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
      ]),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[Center(child:
        SizedBox(
          height: 400,
            width: 400,
            child: Scrollbar(
              child: Container(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('task').snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                    //print("stream22"+streamSnapshot.data!.docs[0]['product_name'].toString());
                    if (streamSnapshot.hasData) {
                      return Scrollbar(
                          child:  SizedBox(
                              height: 50,
                              width: 100,
                              child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: streamSnapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              final DocumentSnapshot documentSnapshot =
                              streamSnapshot.data!.docs[index];
                              print("drop"+dropdownvalue);
                              if(documentSnapshot['due_date']==dropdownvalue){
                                return Card(
                                  margin: const EdgeInsets.all(10),
                                  child: ListTile(
                                    subtitle:Text(documentSnapshot['due_date']),
                                    trailing: SizedBox(
                                      width: 50,
                                      child: Row(
                                        children: [
                                          // Press this button to edit a single product
                                          IconButton(
                                            icon: const Icon(Icons.navigate_next),
                                            onPressed: (){},),
                                          // This icon button is used to delete a single product
                                        ],
                                      ),
                                    ),
                                  ),

                                );
                              }else{
                                return SizedBox(height: 0,);
                              }

                            },
                          ))
                      );

                    }else{
                      print("not there");
                    }

                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ))
          ,)

        ],
      ),

    );
  }

}
