import 'package:flutter/material.dart';

import '../utilities/app_colors.dart';

class SizePicker extends StatefulWidget {
  const SizePicker({super.key, required this.sizes, required this.onSelected, required this.initialSelected});
  final List<String> sizes;
  final Function(int selectedIndex) onSelected;
  final int initialSelected;

  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {
  int _selectedSizeIndex = 0;
  @override
  void initState() {
    _selectedSizeIndex = widget.initialSelected;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: widget.sizes.length,
      itemBuilder: (context, index) {
        return InkWell(
          borderRadius: BorderRadius.circular(4),
          onTap: (){
            _selectedSizeIndex = index;
            widget.onSelected(index);
            if(mounted){
              setState(() {});
            }
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(4),
              color: _selectedSizeIndex == index ? AppColors.primaryColor : null,
            ),
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(widget.sizes[index], style: TextStyle(color: _selectedSizeIndex== index ? Colors.white : Colors.black54),),
            ),
          ),
        );
      }, separatorBuilder: (BuildContext context, int index) {
      return const SizedBox(width: 6);
    },
    );
  }
}