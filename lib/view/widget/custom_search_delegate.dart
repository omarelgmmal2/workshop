import 'package:flutter/material.dart';
import 'package:workshop_app/core/design/title_text.dart';
import 'package:workshop_app/core/utils/app_color.dart';
import 'package:workshop_app/core/utils/text_style_theme.dart';

class CustomSearchDelegate extends SearchDelegate {

  List<String> searchItems = [
    "High Quality Drilled ",
    "Generic NGK Japanese",
    "Car Air Filter",
    "Magnaflow Exhaust",
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for(var item in searchItems){
      if(item.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(item);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: CustomTextWidget(
              label: result,
            style: TextStyleTheme.textStyle13medium,
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for(var item in searchItems){
      if(item.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(item);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title:  CustomTextWidget(
            label: result,
            style: TextStyleTheme.textStyle13medium.copyWith(
              color: AppColor.black,
            ),
          ),
        );
      },
    );
  }
}