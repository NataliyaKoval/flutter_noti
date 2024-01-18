import 'package:flutter/material.dart';

class CustomExpansionTile extends StatelessWidget {
  const CustomExpansionTile({
    super.key,
    required this.title,
    required this.children,
  });

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          height: 1.5,
          fontWeight: FontWeight.w700,
        ),
      ),
      controlAffinity: ListTileControlAffinity.leading,
      childrenPadding: EdgeInsets.only(left: 16),
      children: children,
    );

      // children: [
      //   Stack(
      //     children: [
      //       Positioned.fill(
      //         child: Container(
      //           alignment: Alignment.centerLeft,
      //           child: Stack(
      //             // alignment: Alignment.topCenter,
      //             children: [
      //               Padding(
      //                 padding: const EdgeInsets.symmetric(horizontal: 12),
      //                 child: VerticalDivider(
      //                   color: Colors.red,
      //                   width: 1,
      //                 ),
      //               ),
      //               Positioned(
      //                 top: 20,
      //                 left: 9,
      //                 child: Row(
      //                   crossAxisAlignment: CrossAxisAlignment.center,
      //                   children: [
      //                     Container(
      //                       width: 8,
      //                       height: 8,
      //                       decoration: BoxDecoration(
      //                         shape: BoxShape.circle,
      //                         border: Border.all(width: 1, color: Colors.green),
      //                       ),
      //                     ),
      //                     SizedBox(
      //                       width: 7,
      //                       child: Divider(
      //                         color: Colors.red,
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.only(left: 52),
      //         child: ExpansionTile(
      //           controlAffinity: ListTileControlAffinity.leading,
      //           tilePadding: EdgeInsets.symmetric(vertical: 16),
      //           title: Text(
      //               maxLines: 4,
      //               overflow: TextOverflow.ellipsis,
      //               'Some very long names of action with many symbols in two, Some very long names of action with many symbols in two, three, or four lines with text; the limit should be four lines.'),
      //           children: [
      //             Text('Biking'),
      //             Text('Running'),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ],

  }
}
