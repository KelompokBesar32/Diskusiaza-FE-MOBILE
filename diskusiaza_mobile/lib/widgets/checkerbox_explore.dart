import 'package:flutter/material.dart';

class CheckerBox extends StatefulWidget {
  const CheckerBox({Key? key}) : super(key: key);

  @override
  State<CheckerBox> createState() => _CheckerBoxState();
}

class _CheckerBoxState extends State<CheckerBox> {
  final allChecked = CheckerBoxModal(title: 'Pilih semua');
  final checkerBoxList = [
    CheckerBoxModal(title: 'Hot Threads'),
    CheckerBoxModal(title: 'Rekomendasi Threads'),
    CheckerBoxModal(title: 'Threads Terbaru Minggu Ini'),
    CheckerBoxModal(title: 'Content Creator Ngetop')
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView(
        children: [
          ListTile(
            onTap: () => onAllClicked(allChecked),
            leading: Checkbox(
              value: allChecked.value,
              onChanged: (value) => onAllClicked(allChecked),
            ),
            title: Text(
              allChecked.title,
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          ...checkerBoxList.map(
            (item) => ListTile(
              onTap: () => onItemClicked(item),
              leading: Checkbox(
                value: item.value,
                onChanged: (value) => onItemClicked(item),
              ),
              title: Text(
                item.title,
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  onAllClicked(CheckerBoxModal ckbItem) {
    final newValue = !ckbItem.value;
    setState(() {
      ckbItem.value = newValue;
      checkerBoxList.forEach((element) {
        element.value = newValue;
      });
    });
  }

  onItemClicked(CheckerBoxModal ckbItem) {
    final newValue = !ckbItem.value;
    setState(() {
      ckbItem.value = newValue;

      if (!newValue) {
        allChecked.value = false;
      } else {
        final allListChecked = checkerBoxList.every((element) => element.value);
        allChecked.value = allListChecked;
      }
    });
  }
}

class CheckerBoxModal {
  String title;
  bool value;

  CheckerBoxModal({required this.title, this.value = false});
}
