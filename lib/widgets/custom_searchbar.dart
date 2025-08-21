import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final String hintText;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onFilterTap;

  const CustomSearchBar({
    super.key,
    this.hintText = "Search",
    this.onChanged,
    this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: const Icon(CupertinoIcons.search, color: Colors.grey),
          suffixIcon: GestureDetector(
            onTap: onFilterTap,
            child: const Padding(
              padding: EdgeInsets.all(4),
              child: CircleAvatar(
                backgroundColor: Colors.black,
                child: Icon(
                  CupertinoIcons.slider_horizontal_3,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          hintText: hintText,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    );
  }
}
