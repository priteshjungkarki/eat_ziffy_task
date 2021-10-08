import 'package:eat_ziffy_task/ui/labels/data/model/label_model.dart';
import 'package:eat_ziffy_task/ui/labels_data/labels_data_ui.dart';
import 'package:flutter/material.dart';

buildUi(List<LabelModel> data, int categoryId, context) {
  return DefaultTabController(
    length: data.length,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.045,
            width: MediaQuery.of(context).size.width * 0.99,
            margin: EdgeInsets.only(left: 20.0, top: 15.0),
            child: TabBar(
              physics: NeverScrollableScrollPhysics(),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Color(0XFFFF903F),
              ),
              tabs: List<Widget>.generate(
                data.length,
                (index) => Tab(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.042,
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                      color: Color(0XFFFF903F).withOpacity(0.35),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(
                      child: Text(
                        data[index].name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          // letterSpacing: 0.25,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 20.0),
              child: Text(
                'BookMarks',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.25,
                  fontSize: 20.0,
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 25.0, right: 20.0),
              child: Icon(
                Icons.height,
                color: Color(0XFFFDAA6D),
              ),
            ),
          ],
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          child: TabBarView(
            children: List.generate(
              data.length,
              (index) => LabelsDataUi(categoryId: categoryId),
            ),
          ),
        ),
      ],
    ),
  );
}
