import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

AnimationController _animationController;
Animation _animation;

void mylistener(status){
if(status==AnimationStatus.completed){
  _animation.removeStatusListener(mylistener);
  _animationController.reset();
  _animation = Tween(begin: 0.0 , end:1.0 ).animate(
  CurvedAnimation(parent: _animationController,
  curve: Curves.fastOutSlowIn));
  _animationController.forward();

}
}

@override
  void initState() {
    // TODO: implement initState
    super.initState();
  _animationController =AnimationController(  
    vsync: this,
    duration: Duration(
      seconds: 2
    )
  );
_animation = Tween(begin: -1.0 , end: 0.0).animate(
  CurvedAnimation(  
    parent: _animationController,
    curve: Curves.fastOutSlowIn
))..addStatusListener(mylistener);
  
_animationController.forward();
  }
  @override
  Widget build(BuildContext context) {


    final width = MediaQuery.of(context).size.width;
    return Scaffold(

      appBar: AppBar(  
        title: Text("Animations -2"),
      ),
      body: Container(
        color: Colors.black,
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context,child) => Transform(

            transform: Matrix4.translationValues(_animation.value * width, 0.0, 0.0),
                    child: Center(
              child: Container( 
                height: 200,
                width: 200,
             
                child: FlutterLogo(),
              ),
            ),
          ),
        ),
      ),
      
    );
  }
}