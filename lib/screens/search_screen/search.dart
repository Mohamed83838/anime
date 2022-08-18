import 'dart:ui';

import 'package:animation_list/animation_list.dart';
import 'package:chat_fraj/screens/search_screen/component/component.dart';
import 'package:chat_fraj/screens/search_screen/main_search_screen.dart';
import 'package:chat_fraj/screens/search_screen/recent_screen.dart';
import 'package:chat_fraj/screens/search_screen/result_screen.dart';
import 'package:chat_fraj/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class search_screen extends StatefulWidget {
  const search_screen({Key? key}) : super(key: key);

  @override
  State<search_screen> createState() => _search_screenState();
}

class _search_screenState extends State<search_screen> {
  void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  bool result = false;

  bool is_searching = false;
  final search_field = TextEditingController();
  void cancel_search() {
    search_field.clear();
    result=false;
    is_searching = false;

    hideKeyboard(context);
  }
  //* search bar section

  Widget build(BuildContext context) {
    return Container(
      decoration: !is_searching
          ? BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  colors: [Colors.black, Color.fromARGB(255, 52, 53, 54)]))
          : !result ? BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  colors: [Colors.black, Color.fromARGB(255, 58, 27, 107)]),
            ):BoxDecoration(
             color: Colors.black
            ),
      child: AnimationList(
        duration: 2000,
        reBounceDepth: 10,
        children: [
          Row(
            children: [
              Visibility(
                  visible: is_searching,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        cancel_search();
                      });
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  )),
              Container(
                margin: EdgeInsets.all(
                  screenWidth(context, dividedBy: 30),
                ),
                width: screenWidth(context, dividedBy: 7) * 5.5,
                height: screenHeight(context, dividedBy: 13),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black,
                    border: Border.all(
                      color: Colors.grey,
                      width: 0.5,
                    )),
                child: Row(
                  children: [
                    SizedBox(
                      width: screenWidth(context, dividedBy: 27),
                    ),
                    Visibility(
                        visible: !is_searching,
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                        )),
                    SizedBox(
                      width: screenWidth(context, dividedBy: 25),
                    ),
                    Container(
                      width: !is_searching
                          ? screenWidth(context, dividedBy: 7) * 4.4
                          : screenWidth(context, dividedBy: 7) * 4.7,
                      child: TextField(
                        controller: search_field,
                        style: TextStyle(color: Colors.white),
                        //!on editing complete


                        onEditingComplete: () {
                          setState(() {
                            FocusScope.of(context).requestFocus(FocusNode());
                            //is_searching = false;
                          });
                        },
                        //!on text changed
                        onChanged: (string) {
                       setState(() {
                        result=true;
                      
                       });
                        },
                        cursorColor: Colors.white,

                        //!on click search
                        onTap: () {
                          setState(() {
                            is_searching = true;
                          });
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelStyle: TextStyle(color: Colors.white),
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          alignLabelWithHint: false,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          suffixIcon: AnimatedOpacity(
                            // If the widget is visible, animate to 0.0 (invisible).
                            // If the widget is hidden, animate to 1.0 (fully visible).
                            opacity: is_searching ? 1.0 : 0.0,
                            duration: const Duration(milliseconds: 1000),
                            // The green box must be a child of the AnimatedOpacity widget.
                            //!cancel search 
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  cancel_search();
                                });
                              },
                              icon: Icon(
                                Icons.category,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          hintText: is_searching
                              ? "Movie & Tv Show & User"
                              : "Search",
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 17),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Visibility(
                  visible: !is_searching,
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.mic_none_rounded,
                        color: Colors.grey,
                        size: 30,
                      )))
            ],
          ),
          SizedBox(
            height: screenHeight(context, dividedBy: 25),
          ),
          //*body of search Section
          !is_searching ? main_search_screen() :!result ? recent_screen(): result_screen()
        ],
      ),
    );
  }
}
