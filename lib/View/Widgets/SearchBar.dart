import 'package:flutter/material.dart';

import '../Static/Colors.dart';
class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return SearchBar(
      trailing: [
        IconButton(
          icon: const Icon(Icons.mic_none,color: AppColors.labelColor),
          onPressed: () {
            print('Use voice command');
          },
        ),
      ],
      leading: Icon(Icons.search,color: AppColors.labelColor,),
      shadowColor: MaterialStateProperty.all(Colors.white38),
      overlayColor: MaterialStateProperty.all(Colors.white),
      elevation: MaterialStateProperty.all(10.0),
      backgroundColor: MaterialStateProperty.all(Colors.white),
      constraints: BoxConstraints(
        maxHeight: 50,
        maxWidth: 334,
      ),
      textStyle: MaterialStateProperty.all(
          TextStyle(color:AppColors.labelColor, fontWeight: FontWeight.w500)
      ),
      hintText: 'Search Here...',
      hintStyle: MaterialStateProperty.all(TextStyle(color:AppColors.labelColor,fontWeight: FontWeight.w300,fontSize: 14)),
    );
  }
}
