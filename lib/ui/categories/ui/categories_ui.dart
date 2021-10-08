import 'package:eat_ziffy_task/ui/categories/data/model/categories_model.dart';
import 'package:eat_ziffy_task/ui/categories_products_details/ui/categories_products_details_ui.dart';
import 'package:eat_ziffy_task/ui/labels/bloc/labels_bloc.dart';
import 'package:eat_ziffy_task/ui/labels/data/api/label_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

buildUi(List<CategoriesModel> data, context) {
  return GridView.builder(
    shrinkWrap: true,
    itemCount: data.length,
    physics: NeverScrollableScrollPhysics(),
    itemBuilder: (context, index) {
      return GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => LabelBloc(
                respiratory: LabelApi(),
              ),
              child: CategoriesProductDetailUi(
                categoryId: data[index].id,
                title: data[index].category,
              ),
            ),
          ),
        ),
        child: Container(
          margin: EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
          decoration: BoxDecoration(
            color: Color(0XFFCFEBFB),
            borderRadius: BorderRadius.circular(20.0),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.black.withOpacity(0.09),
            //     spreadRadius: 5.0,
            //     blurRadius: 5.0,
            //   ),
            // ],
          ),
          child: Column(
            children: [
              SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child: Image.network(
                    "https://png.pngtree.com/element_our/png/20180930/food-icon-design-vector-png_120564.jpg",
                    fit: BoxFit.fill,
                    height: 120.0,
                    //   //MediaQuery.of(context).size.height * 0.22,
                    width: 120.0,

                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return Shimmer.fromColors(
                          baseColor: Color(0XFFEFF2FF),
                          highlightColor: Colors.grey[300],
                          child: Container(
                            height: 150.0,
                            color: Color(0XFFEFF2FF),
                            //   //MediaQuery.of(context).size.height * 0.22,
                            width: 160.0,
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 3.0,
              ),
              Text(
                data[index].category,
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w800,
                ),
              ),
              // SizedBox(
              //   height: 10.0,
              // ),
            ],
          ),
        ),
      );
    },
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 6.0,
      mainAxisSpacing: 15.0,
      childAspectRatio: 0.95,
    ),
  );
}
