import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class VerticalDotTraceAnimation extends StatefulWidget {
  const VerticalDotTraceAnimation();

  @override
  State<VerticalDotTraceAnimation> createState() => _VerticalDotTraceAnimationState();
}

class _VerticalDotTraceAnimationState extends State<VerticalDotTraceAnimation> with SingleTickerProviderStateMixin{
  bool selected = false;
  bool _isPlaying = true;
  bool down = true;
  double sliderValue = 0.6;
  int reps = 20;

  var bool_temp = true;
  bool userInput = false;


  Timer _timer;
  int _start = 10;


  AnimationController _animationController;
  Animation _animation;



  @override
  void initState(){
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animation = Tween(
        begin: 1.0,
        end: 10.0
    ).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOutSine)
    );


    _animationController.repeat(reverse: true);
    // _animationController.addListener(() => setState(() {}));
    // TickerFuture tickerFuture = _animationController.repeat(reverse: true);
    _animationController.reverseDuration = Duration(seconds: 3);

    // tickerFuture.timeout(Duration(seconds:  5 * 10), onTimeout:  () {
    //   _animationController.forward(from: 0);
    //   _animationController.stop(canceled: true);
    // });


    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var temp = _animation.value;
    print(temp);

    Icon indicatorIcon = Icon(Icons.arrow_upward);

    return Scaffold(
      body: !userInput ? AnimatedBuilder(
          animation: _animation,
          builder: (context, _) {

           bool_temp = down;

            if(temp < _animation.value){
              indicatorIcon = Icon(Icons.arrow_upward);
              down = false;
            }else{
              indicatorIcon = Icon(Icons.arrow_downward);
              down = true;
            }
           temp = _animation.value;
            print(temp);


          return Container(
            color: down ? Colors.black : Colors.amber.shade800,

            height: height,
            child:Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                         Positioned(
                           // width: selected ? 200.0 : 50.0,
                           // height: selected ? 50.0 : 200.0,
                            top: ((height*0.05)+15)*_animation.value,
                            child: GestureDetector(
                              onTap: (){
                                if (_isPlaying) _animationController.reset();
                                else _animationController.repeat(reverse:true);
                                setState(() => _isPlaying = !_isPlaying);
                              },
                              child: Container(
                                height:_animationController.value* 120 + 40,
                                width: 125,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(200.0),
                                  color: Colors.black12,
                                  border: Border.all(color: down ? Colors.amber.shade800 : Colors.black, width: 1.0)
                                ),
                             //   child: indicatorIcon,
                              ),
                            ),
                          ),
                      Container(
                          width: width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text( down ? 'Inhale'  : 'Exhale', style: GoogleFonts.montserrat(fontSize: (32*_animationController.value)+5),),
                            ],
                          )
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      ):
      Container(
        height: height*0.5,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text((reps*sliderValue).toStringAsFixed(0), style: GoogleFonts.montserrat(fontSize: 18),),
                ],
              ),
              Container(
                child: Slider(
                  activeColor: Colors.amber.shade800.withOpacity(sliderValue),
                  label: 'Set Reps',
                  min: 0.05,
                  max: 1.0,
                  value: sliderValue,
                  onChanged: (value){
                    setState(() {
                      sliderValue = value;
                    });
                  },
                )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_forward),
                      onPressed: (){
                      setState(() {
                        userInput = true;
                      });

                      }
                      ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
