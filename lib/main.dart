import 'package:eat_ziffy_task/ui/categories/bloc/categories_bloc.dart';
import 'package:eat_ziffy_task/ui/categories/data/api/categories_api.dart';
import 'package:eat_ziffy_task/ui/categories_products_details/ui/categories_products_details_ui.dart';
import 'package:eat_ziffy_task/ui/homepage/ui/homepage_ui.dart';
import 'package:eat_ziffy_task/ui/labels/bloc/labels_bloc.dart';
import 'package:eat_ziffy_task/ui/labels/data/api/label_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CategoriesBloc(
              respiratory: CategoriesApi(),
            ),
            child: HomePage(),
          ),
          BlocProvider(
            create: (context) => LabelBloc(
              respiratory: LabelApi(),
            ),
            child: CategoriesProductDetailUi(),
          ),
        ],
        child: HomePage(),
      ),
    );
  }
}
