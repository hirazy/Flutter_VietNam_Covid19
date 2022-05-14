import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vietnam_covid19/src/constant/theme.dart';
import 'package:flutter_vietnam_covid19/src/data/model/province_model.dart';
import 'package:tiengviet/tiengviet.dart';

class ProvinceDialog extends StatefulWidget {
  Province provinceSelected;
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

  onTapClear() {
    _textEditingController.clear();
  }

  onFilter(String? value) {
    lstFilterProvince.clear();

    if (value == null) {
      lstFilterProvince.addAll(widget.lstProvince);
    } else {
      String _searchEngine = TiengViet.parse(value.toLowerCase());
      lstFilterProvince = widget.lstProvince.where((element) {
        String _titleSearch = TiengViet.parse(element.title!.toLowerCase());
        if (_titleSearch.contains(_searchEngine)) {
          return true;
        }
        return false;
      }).toList();
    }

    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        insetPadding:
            const EdgeInsets.only(top: 10, bottom: 10, left: 25, right: 25),
        child: Stack(
          overflow: Overflow.visible,
          alignment: Alignment.topCenter,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 24, top: 40),
              height: MediaQuery.of(context).size.height * 0.75,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.white
              ),
              padding: const EdgeInsets.fromLTRB(10, 54, 10, 20),
              child: Column(
                children: [
                  SizedBox(
                    height: 54,
                    child: TextField(
                      controller: _textEditingController,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: const Icon(
                              Icons.clear,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              onTapClear();
                            },
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: ThemePrimary.primaryColor,
                          ),
                          labelText: "Tìm kiếm tỉnh thành",
                          isDense: true,
                          labelStyle: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: ThemePrimary.primaryColor)),
                    ),
                  ),
                  Expanded(
                      child: Container(
                          margin: EdgeInsets.only(left: 8, right: 8),
                          child: ListView(
                            children: lstFilterProvince.map((e) {
                              bool _isSelected =
                                  widget.provinceSelected.id == e.id;

                              return InkWell(
                                onTap: () {
                                  widget.provinceSelected = e;
                                  FocusScope.of(context).unfocus();
                                  Navigator.of(context)
                                      .pop(widget.provinceSelected);
                                },
                                child: Container(
                                  padding: EdgeInsets.only(top: 5, bottom: 5),
                                  decoration: BoxDecoration(
                                    border: Border(bottom:
                                      BorderSide(
                                        color: Colors.black,
                                        width: 1
                                      ),
                                    ),
                                    color: _isSelected ? ThemePrimary.primaryColor: Colors.white
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.location_city,
                                          color: _isSelected
                                              ? Colors.red
                                              : ThemePrimary.textPrimaryColor
                                              .withOpacity(0.5)),
                                      SizedBox(width: 20),
                                      Text(e.title ?? ""),
                                    ],
                                  ),
                                )
                              );
                            }).toList(),
                          ))),
                ],
              ),
            ),
            Positioned(
              child: Container(
                margin: EdgeInsets.only(right: 24),
                height: 80,
                width: 80,
                child: Center(
                    child: Icon(
                  Icons.location_city,
                  color: ThemePrimary.primaryColor,
                  size: 48,
                )),
              ),
              top: 0,
            ),
            Positioned(
                top: 0,
                right: 0,
                child: InkWell(
                  borderRadius: BorderRadius.circular(100),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Ink(
                    width: 40,
                    height: 40,
                    child: const Icon(
                      Icons.clear,
                      color: Colors.white,
                    ),
                    decoration: const BoxDecoration(color: Colors.red),
                  ),
                ))
          ],
        ));
  }
}
