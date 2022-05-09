import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vietnam_covid19/src/data/model/province_model.dart';

class ProvinceDialog extends StatefulWidget {
  final Province provinceSelected;
  final List<Province> lstProvince;

  ProvinceDialog(
      {Key? key, required this.provinceSelected, required this.lstProvince})
      : super(key: key);

  @override
  ProvinceDialogState createState() {
    return ProvinceDialogState();
  }
}

class ProvinceDialogState extends State<ProvinceDialog> {
  List<Province> lstFilterProvince = [];

  late Province provinceSelected;

  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();

    lstFilterProvince.addAll(widget.lstProvince);
    _textEditingController = TextEditingController();

    _textEditingController.addListener(() {
      if (_textEditingController.text.isNotEmpty) {
        onFilter(_textEditingController.text);
      } else {
        onFilter(null);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Stack(
      overflow: Overflow.visible,
      children: [
        Container(
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(
                height: 54,
                child: TextField(
                  decoration: InputDecoration(),
                ),
              ),
              Expanded(
                  child: ListView(
                children: lstFilterProvince
                    .map((e) => InkWell(
                          onTap: () {
                            provinceSelected = e;
                            Navigator.of(context).pop(provinceSelected);
                          },
                          child: Text(e.title ?? ""),
                        ))
                    .toList(),
              ))
            ],
          ),
        )
      ],
    ));
  }

  onFilter(value) {
    lstFilterProvince.clear();

    if (value == null) {
      lstFilterProvince.addAll(widget.lstProvince);
    } else {
      String _searchEngine = _textEditingController.text.toLowerCase();

      lstFilterProvince = widget.lstProvince.where((element) {
        String titleSearch = element.title!.toLowerCase();
        return titleSearch.contains(_searchEngine);
      }).toList();
    }

    setState(() {});
  }
}
