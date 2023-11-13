import 'package:flutter/material.dart';

class NationaltyWidget extends StatefulWidget {
  const NationaltyWidget({super.key});

  @override
  State<NationaltyWidget> createState() => _NationaltyWidgetState();
}

class _NationaltyWidgetState extends State<NationaltyWidget> {
  int value = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 15,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius:
        BorderRadius.all(Radius.circular(10)),
      ),
      child: DropdownButton(
          padding: const EdgeInsets.all(4),
          underline: const SizedBox(),
          hint: const Text('Select Nationality'),
          isExpanded: true,
          value: value,
          menuMaxHeight: MediaQuery.of(context).size.height / 3,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          items: const [
            DropdownMenuItem(
              value: 1,
              child: Text('Egyptian'),
            ),
            DropdownMenuItem(
              value: 2,
              child:  Text('Saudi'),
            ),
            DropdownMenuItem(
              value: 3,
              child:  Text('Kuwaiti'),
            ),
            DropdownMenuItem(
              value: 4,
              child:  Text('Emirati'),
            ),
            DropdownMenuItem(
              value: 5,
              child: Text('Bahraini'),
            ),
            DropdownMenuItem(
              value: 6,
              child:  Text('Omani'),
            ),
            DropdownMenuItem(
              value: 7,
              child:  Text('Qatari'),
            ),
            DropdownMenuItem(
              value: 8,
              child:  Text('Jordanian'),
            ),
            DropdownMenuItem(
              value: 9,
              child:  Text('Lebanese'),
            ),
            DropdownMenuItem(
              value: 10,
              child: Text('Syrian'),
            ),
            DropdownMenuItem(
              value: 11,
              child: Text('Palestinian'),
            ),
            DropdownMenuItem(
              value: 12,
              child: Text('Iraqi'),
            ),
            DropdownMenuItem(
              value: 13,
              child: Text('Yemeni'),
            ),
            DropdownMenuItem(
              value: 14,
              child: Text('Sudanese'),
            ),
            DropdownMenuItem(
              value: 15,
              child: Text('Somali'),
            ),
            DropdownMenuItem(
              value: 16,
              child: Text('Libyan'),
            ),
            DropdownMenuItem(
              value: 17,
              child: Text('Tunisian'),
            ),
            DropdownMenuItem(
              value: 18,
              child: Text('Algerian'),
            ),
            DropdownMenuItem(
              value: 19,
              child: Text('Mauritanian'),
            ),
            DropdownMenuItem(
              value: 20,
              child: Text('Moroccan'),
            ),
            DropdownMenuItem(
              value: 21,
              child: Text('Djiboutian'),
            ),
            DropdownMenuItem(
              value: 22,
              child: Text('Comorian'),
            ),
            DropdownMenuItem(
              value: 23,
              child: Text('Chadian'),
            ),
          ],
          onChanged: (v) {
            setState(() => value = v!);
          }),
    );
  }
}
