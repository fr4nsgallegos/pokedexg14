import 'package:flutter/material.dart';

class TypePokemonContainer extends StatelessWidget {
  String type;
  Color color;
  TypePokemonContainer({required this.type, required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(color: color, width: 2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Icon(Icons.energy_savings_leaf_sharp, color: color),
          SizedBox(width: 4),
          Text(type, style: TextStyle(color: color)),
        ],
      ),
    );
  }
}
