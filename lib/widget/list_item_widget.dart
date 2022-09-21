import 'package:flutter/material.dart';

class ListItemWidget extends StatelessWidget {
  final String item;
  final Animation<double> animation;
  final VoidCallback? onClicked;
  const ListItemWidget(
      {Key? key, required this.item, required this.animation, this.onClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) =>
      SizeTransition(sizeFactor: animation, child: buildItem());

  Widget buildItem() => Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color.fromARGB(255, 218, 216, 216)),
        child: ListTile(
          contentPadding: const EdgeInsets.all(16),
          title: Text(
            item,
            style: const TextStyle(fontSize: 20, color: Colors.black),
          ),
          trailing: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
                size: 25,
              )),
        ),
      );
}
