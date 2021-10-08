import 'package:eat_ziffy_task/common/error_screen.dart';
import 'package:eat_ziffy_task/ui/item_delete/item_delete_api.dart';
import 'package:eat_ziffy_task/ui/labels_data/labels_data_api.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shimmer/shimmer.dart';

class LabelsDataUi extends StatefulWidget {
  int categoryId;
  LabelsDataUi({this.categoryId});

  @override
  _LabelsDataUiState createState() => _LabelsDataUiState();
}

class _LabelsDataUiState extends State<LabelsDataUi> {
  LabelsDataApi labelsDataApi = LabelsDataApi();
  DeleteItemApi deleteItemApi = DeleteItemApi();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: labelsDataApi.getLabelsDataApi(widget.categoryId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data.length == null || snapshot.data.isEmpty
                ? Padding(
                    padding: const EdgeInsets.only(top: 150.0, left: 100.0),
                    child: Text(
                      'No BookMarks Found',
                      style: TextStyle(
                        color: Colors.red,
                        letterSpacing: 0.25,
                        fontSize: 20.0,
                      ),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.12,
                        width: double.infinity,
                        margin: EdgeInsets.only(
                            left: 20.0, right: 20.0, bottom: 20.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                //image
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 12.0, left: 10.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15.0),
                                    child: Image.network(
                                      snapshot.data[index].image,
                                      fit: BoxFit.fill,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.09,
                                      width: MediaQuery.of(context).size.width *
                                          0.18,
                                      loadingBuilder: (BuildContext context,
                                          Widget child,
                                          ImageChunkEvent loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        } else {
                                          return Shimmer.fromColors(
                                            baseColor: Color(0XFFEFF2FF),
                                            highlightColor: Colors.grey[300],
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.09,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.18,
                                              color: Color(0XFFEFF2FF),
                                              //   //MediaQuery.of(context).size.height * 0.22,
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                ),
                                //title and icons
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //title
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, top: 15.0, bottom: 0.0),
                                      child: Text(
                                        snapshot.data[index].title,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          //letterSpacing: 0.25,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15.0,
                                    ),
                                    //icons
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        Icon(Icons.notifications,
                                            color: Color(0XFFFBDDC8)),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        Icon(Icons.star,
                                            color: Color(0XFFFBDDC8)),
                                      ],
                                    ),
                                  ],
                                ),
                                Spacer(),

                                BoxCircle(
                                  iconData: Icons.update_outlined,
                                  color: Color(0XFF2CF3A0),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    print("id : ${snapshot.data[index].id}");
                                    var response =
                                        await deleteItemApi.deleteItemsDataApi(
                                            snapshot.data[index].id);
                                    setState(() {
                                      response;
                                    });
                                    if (response) {
                                      return Scaffold.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            "Item Deleted Successfully",
                                            textAlign: TextAlign.center,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      );
                                    } else {
                                      SnackBar(
                                        content: Text(
                                          "Please try again",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      );
                                    }
                                  },
                                  child: BoxCircle(
                                    iconData: Icons.delete_outline,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    });
          } else if (snapshot.connectionState != ConnectionState.done) {
            return buildShimmer();
          } else if (snapshot.hasError) {
            return ErrorScreen().buildErrorUi(snapshot.error.toString());
          } else {
            return Container();
          }
        });
  }

  buildShimmer() {
    return Shimmer.fromColors(
      baseColor: Color(0XFFEFF2FF),
      highlightColor: Colors.grey[300],
      child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.12,
              width: double.infinity,
              margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
              ),
            );
          }),
    );
  }
}

class BoxCircle extends StatelessWidget {
  Color color;
  IconData iconData;
  BoxCircle({this.iconData, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.0,
      width: 45.0,
      margin: EdgeInsets.only(right: 8.0, top: 20.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Icon(
        iconData,
        color: Colors.white,
      ),
    );
  }
}
