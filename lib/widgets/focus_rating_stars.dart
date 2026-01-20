import 'package:flutter/material.dart';

class FocusRatingStars extends StatelessWidget {
  final int selected;
  final Function(int) onSelect;

  const FocusRatingStars({
    super.key,
    required this.selected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        final star = index + 1;
        return IconButton(
          icon: Icon(
            Icons.star,
            color: star <= selected ? Colors.amber : Colors.grey,
          ),
          onPressed: () => onSelect(star),
        );
      }),
    );
  }
}
