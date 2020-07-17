import 'package:Chanakya/bottom_bar.dart';
import 'package:Chanakya/screens/login_screen.dart';
import 'package:Chanakya/topic_tile.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {  
  static String id='home_screen';
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _auth=FirebaseAuth.instance;
  String userName='user';
  Future<void> getCurrentUser() async
  {
    try{
    FirebaseUser current_user=await _auth.currentUser();
    if(current_user!=null)
    {
      userName=current_user.email;
      setState(() {
        
      });
    }
    }
    catch(e)
    {}
  }
  @override
  void initState() {
    // TODO: implement initState
    getCurrentUser();
    super.initState();
  }
@override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
            backgroundColor: Color(0xFF0A0E21),
        appBar: AppBar(
          backgroundColor: Color(0xFF0A0E21),
          centerTitle: true,
          title: TypewriterAnimatedTextKit(text: <String>['Chanakya Learning App']),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search), 
            onPressed: (){
              
            })
          ],
        ),
        drawer:Drawer(
            child:ListView(
              children:[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.pinkAccent,
          ),
          child: Column(
            //mainAxisAlignment:MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text(userName,
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
            ),
          ),
          SizedBox(height: 15,),
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('images/paradigm.jpg'),
          )
            ]
          )
        ),
        ListTile(
          leading: Icon(Icons.message),
          title: Text('Messages'),
        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text('Profile'),
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Log Out'),
          onTap: (){
            _auth.signOut();
            Navigator.popUntil(context,ModalRoute.withName(LoginScreen.id));
            },
        ),
                
              ]
            )
          ),
        body: Container(
          
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
            TopicTile(text: 'Physics', link: 'br_AX6oWdw4'),
            TopicTile(text: 'Chemistry', link: 'br_AX6oWdw4'),
            TopicTile(text: 'Maths', link: 'br_AX6oWdw4')
            ],
          )
        ),


        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}
