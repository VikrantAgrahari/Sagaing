// import 'package:search_widget/search_widget.dart';
// import 'package:flutter/material.dart';


// class Search extends StatefulWidget {
//   @override
//   _SearchState createState() => _SearchState();
// }

// class _SearchState extends State<Search> {
//   @override
//   Widget build(BuildContext context) {
//     return SearchWidget<LeaderBoard>(
//    dataList: list,
//    hideSearchBoxWhenItemSelected: false,
//    listContainerHeight: MediaQuery.of(context).size.height / 4,
//    queryBuilder: (String query, List<LeaderBoard> list) {
//      return list.where((LeaderBoard item) => item.username.toLowerCase().contains(query.toLowerCase())).toList();
//    },
//    popupListItemBuilder: (LeaderBoard item) {
//      return PopupListItemWidget(item);
//    },
//    selectedItemBuilder: (LeaderBoard selectedItem, VoidCallback deleteSelectedItem) {
//      return SelectedItemWidget(selectedItem, deleteSelectedItem);
//    },
//    // widget customization
//    noItemsFoundWidget: NoItemsFound(),
//    textFieldBuilder: (TextEditingController controller, FocusNode focusNode) {
//      return MyTextField(controller, focusNode);
//    },
//  )
//   }
// }
