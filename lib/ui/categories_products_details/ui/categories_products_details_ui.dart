import 'package:eat_ziffy_task/common/common_ui.dart';
import 'package:eat_ziffy_task/common/error_screen.dart';
import 'package:eat_ziffy_task/ui/labels/bloc/labels_bloc.dart';
import 'package:eat_ziffy_task/ui/labels/bloc/labels_event.dart';
import 'package:eat_ziffy_task/ui/labels/bloc/labels_state.dart';
import 'package:eat_ziffy_task/ui/labels/ui/labels_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class CategoriesProductDetailUi extends StatefulWidget {
  int categoryId;
  String title;
  CategoriesProductDetailUi({this.title, this.categoryId});
  @override
  _CategoriesProductDetailUiState createState() =>
      _CategoriesProductDetailUiState();
}

class _CategoriesProductDetailUiState extends State<CategoriesProductDetailUi> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<LabelBloc>(context)
        .add(FetchLabelData(categoryId: widget.categoryId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF8F8F8),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            commonContainer(
                check: false, title: widget.title, context: context),
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, top: 20.0, bottom: 0.0),
              child: Text(
                'Labels',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.25,
                  fontSize: 20.0,
                ),
              ),
            ),
            BlocBuilder<LabelBloc, LabelState>(builder: (context, state) {
              if (state is LoadingLabelState) {
                return buildShimmer();
              } else if (state is LoadedLabelState) {
                return buildUi(state.data, widget.categoryId, context);
              } else if (state is ErrorLabelState) {
                return ErrorScreen().buildErrorUi(state.errorMessage);
              } else {
                return Container();
              }
            }),
          ],
        ),
      ),
    );
  }

  buildShimmer() {
    return Shimmer.fromColors(
      baseColor: Color(0XFFEFF2FF),
      highlightColor: Colors.grey[300],
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: 4,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            //  height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width * 0.45,
            margin: EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.09),
                  spreadRadius: 5.0,
                  blurRadius: 5.0,
                ),
              ],
            ),
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 6.0,
          mainAxisSpacing: 15.0,
          childAspectRatio: 0.88,
        ),
      ),
    );
  }
}
// Container(
// height: MediaQuery.of(context).size.height * 0.048,
// width: MediaQuery.of(context).size.width * 0.99,
// margin: EdgeInsets.only(left: 20.0, top: 15.0),
// child: ListView.builder(
// shrinkWrap: true,
// scrollDirection: Axis.horizontal,
// itemCount: data.length,
// itemBuilder: (context, index) {
// return Container(
// width: 110.0,
// margin: EdgeInsets.only(right: 3.0),
// decoration: BoxDecoration(
// color: Color(0XFFFF903F),
// borderRadius: BorderRadius.circular(20.0),
// ),
// child: TabBar(
// labelColor: Colors.white,
// tabs: List<Widget>.generate(
// data.length,
// (index) => Tab(
// child: Center(
// child: Text(
// data[index].name,
// maxLines: 1,
// overflow: TextOverflow.ellipsis,
// style: TextStyle(
// letterSpacing: 0.25,
// ),
// ),
// ),
// ),
// ),
// ),
// );
// }),
// ),
