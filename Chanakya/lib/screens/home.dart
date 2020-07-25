//import 'package:Chanakya/bottom_bar.dart';
import 'package:Chanakya/lectures.dart';
import 'package:Chanakya/screens/assignment.dart';
import 'package:Chanakya/screens/login_screen.dart';
import 'package:Chanakya/screens/notes.dart';
import 'package:Chanakya/screens/quiz.dart';
import 'package:Chanakya/topic_tile.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



final _auth=FirebaseAuth.instance;
String _userName='user';

class MyHomePage extends StatefulWidget {  
  static String id='home_screen';
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex=0;

  Widget bodyContent(int index)
  {
    if(index==0)
      return Lectures();
    else if(index==1)
      return Notes();
    else
      return Assignment();
  }
  void bottomTap(int index)
  {
    setState(() {
      _selectedIndex=index;
      });
  }

  Future<void> getCurrentUser() async
  {
    try{
    FirebaseUser current_user=await _auth.currentUser();
    if(current_user!=null)
    {
      _userName=current_user.email;
      setState(() {});
    }
    }
    catch(e){}
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
        drawer:Menu(),
        body: bodyContent(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
      onTap: (index){
        if(index==3)
          Navigator.pushNamed(context, Quizzler.id);
        else
          bottomTap(index);
        },
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFFFF0067),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.ondemand_video),title: Text('Home'),),
          BottomNavigationBarItem(icon: Icon(Icons.class_),title: Text('Notes'),),
          BottomNavigationBarItem(icon: Icon(Icons.assignment),title: Text('Assignment'),),
          BottomNavigationBarItem(icon: Icon(Icons.timer),title: Text('Quiz'),)
        ]
        ),
      ),
    );
  }
}
//Drawer

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
             Text(_userName,
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
          onTap: ()async{
            final shared=await SharedPreferences.getInstance();
            shared.setBool('isLoggedIn', false);
            _auth.signOut();
            Navigator.popUntil(context,ModalRoute.withName(LoginScreen.id));
            },
        ),
                
              ]
            )
          );
  }
}
