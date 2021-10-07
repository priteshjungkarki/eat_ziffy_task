import 'package:flutter/material.dart';

Container commonContainer({bool check, String title, context}) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.3,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Color(0XFFFF903F),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(45.0),
        bottomRight: Radius.circular(45.0),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //notification bell
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              check == true
                  ? Container()
                  : Text(
                      title,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                    ),
              Spacer(),
              Stack(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.notifications_none_outlined,
                      color: Colors.white,
                    ),
                  ),
                  check == true
                      ? Positioned(
                          right: 2.0,
                          child: ClipOval(
                            child: Container(
                              height: 8.0,
                              width: 8.0,
                              color: Color(0XFF2CF3A0),
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ],
          ),
          check == true
              ? SizedBox(
                  height: 15.0,
                )
              : Container(),
          check == true
              ? Text(
                  'Hi Jhon',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.0,
                    color: Colors.white,
                    letterSpacing: 1.5,
                  ),
                )
              : Container(),
          check == true
              ? SizedBox(
                  height: 6.0,
                )
              : Container(),
          check == true
              ? Text(
                  'Welcome Back !!!',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 22.0,
                    color: Colors.white,
                    letterSpacing: 1.5,
                  ),
                )
              : Container(),
          check == true
              ? SizedBox(
                  height: 45.0,
                )
              : SizedBox(
                  height: 110.0,
                ),
          //textformfield
          Container(
            height: 45.0,
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 0.0),
                  child: Icon(
                    Icons.search,
                    size: 30.0,
                    color: Colors.white,
                  ),
                ),
                hintText: 'What bookmarks are you searching for ?',
                hintStyle: TextStyle(
                  height: 3.1,
                  color: Colors.white,
                  fontSize: 15.0,
                  // fontWeight: FontWeight.w400,
                ),
                fillColor: Color(0XFFF8F8F8).withOpacity(0.4),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0XFFF8F8F8).withOpacity(0.4),
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0XFFF8F8F8).withOpacity(0.4),
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                ),

                // filled: true,
                // fillColor: Color(0XFFF8F8F8),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
