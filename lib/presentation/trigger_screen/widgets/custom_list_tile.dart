import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.text,
    required this.isLineVisible,
  });

  final String text;
  final bool isLineVisible;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Visibility(
            visible: isLineVisible,
            child: Stack(
              // alignment: Alignment.topCenter,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 27, right: 10),
                  child: VerticalDivider(
                    color: Colors.red,
                    width: 1,
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 24,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 1, color: Colors.green),
                        ),
                      ),
                      const SizedBox(
                        width: 7,
                        child: Divider(
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListTile(
              shape: Border(
                top: BorderSide(),
              ),
              title: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(text),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
