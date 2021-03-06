import 'package:eat_ziffy_task/common/common_ui.dart';
import 'package:eat_ziffy_task/common/error_screen.dart';
import 'package:eat_ziffy_task/ui/categories/bloc/categories_bloc.dart';
import 'package:eat_ziffy_task/ui/categories/bloc/categories_event.dart';
import 'package:eat_ziffy_task/ui/categories/bloc/categories_state.dart';
import 'package:eat_ziffy_task/ui/categories/data/api/categories_api.dart';
import 'package:eat_ziffy_task/ui/categories/data/model/categories_model.dart';
import 'package:eat_ziffy_task/ui/categories/ui/categories_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  bool check;
  HomePage({this.check});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<CategoriesBloc>(context).add(FetchCategoriesData());
    // getData();
  }

  // CategoriesApi categoriesApi = CategoriesApi();
  // List<CategoriesModel> data;
  // getData() async {
  //   await categoriesApi.getCategoriesApiData();
  //   setState(() {
  //     data = categoriesApi.loadedData;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF8F8F8),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            commonContainer(check: true, context: context),
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, top: 20.0, bottom: 0.0),
              child: Text(
                'Categories',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.25,
                  fontSize: 20.0,
                ),
              ),
            ),
            BlocBuilder<CategoriesBloc, CategoriesState>(
                builder: (context, state) {
              if (state is LoadingState) {
                return buildShimmer();
              } else if (state is LoadedState) {
                return buildUi(state.data, context);
              } else if (state is ErrorState) {
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
          childAspectRatio: 0.95,
        ),
      ),
    );
  }
}
