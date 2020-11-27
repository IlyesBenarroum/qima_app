import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qima/app/controllers/auction_controller.dart';
import 'package:qima/app/controllers/provider_controller.dart';
import 'package:qima/app/modules/add_auction/views/new_auction1_view.dart';

import '../add_auction_controller.dart';
import 'add_auction_drop_down_card_view.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({
    Key key,
  }) : super(key: key);

  // final ProviderController providerController;

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

final AuctionController auctionController = Get.put(AuctionController());

class ListItem {
  int value;
  String id;
  String flag;
  String name;

  ListItem(this.id, this.value, this.flag, this.name);
}

class ProviderListItem {
  int value;

  String name;
  String id;

  ProviderListItem(this.id, this.value, this.name);
}

class _CustomDropDownState extends State<CustomDropDown> {
  final AddAuctionController controller = Get.put(AddAuctionController());
  final ProviderController providerController = Get.put(ProviderController());
  List<ListItem> _dropdownItems = [];
  List<ProviderListItem> _providerdropdownItems = [];
  void fill() {
    for (int j = 0;
        j < providerController.providersList[0].carriers.length;
        j++) {
      // print(providerController.providersList[0].carriers[j].carrierName);
      _providerdropdownItems.add(ProviderListItem(
        providerController.providersList[0].carriers[j].carrierID,
        j,
        providerController.providersList[0].carriers[j].carrierName,
      ));
    }
    for (int i = 0; i < providerController.providersList.length; i++) {
      _dropdownItems.add(ListItem(
          providerController.providersList[i].countryID,
          i,
          providerController.providersList[i].flag,
          providerController.providersList[i].countryName));
    }
  }

  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  List<DropdownMenuItem<ProviderListItem>> _providerDropdownMenuItems;
  ListItem _selectedItem;
  ProviderListItem _providerSelectedItem;

  void initState() {
    super.initState();
    fill();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _providerDropdownMenuItems =
        buildProviderDropDownMenuItems(_providerdropdownItems);
    _selectedItem = _dropdownMenuItems[0].value;
    _providerSelectedItem = _providerDropdownMenuItems[0].value;
  }

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = List();
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Row(children: [
            Text(listItem.flag),
            Text(listItem.name),
          ]),
          value: listItem,
        ),
      );
    }
    return items;
  }

  List<DropdownMenuItem<ProviderListItem>> buildProviderDropDownMenuItems(
      List listItems) {
    List<DropdownMenuItem<ProviderListItem>> items = List();
    for (ProviderListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Row(children: [
            // Text(listItem.),
            Text(listItem.name),
          ]),
          value: listItem,
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    if (GetUtils.isNullOrBlank(auctionController.country))
      auctionController.setCountry(_dropdownMenuItems[0].value.id);
    if (GetUtils.isNullOrBlank(auctionController.serviceProvider))
      auctionController
          .setServiceProvider(_providerDropdownMenuItems[0].value.id);

    return Row(
      children: [
        AddAuctionDropDownCardView(
          title: "Country".tr,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<ListItem>(
                    value: _selectedItem,
                    items: _dropdownMenuItems,
                    onChanged: (value) {
                      // bool past = true; // print();
                      // print(value.value);
                      setState(() {
                        auctionController.setCountry(value.id);
                        _selectedItem = value;
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
        AddAuctionDropDownCardView(
          title: "Provider".tr,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<ProviderListItem>(
                    value: _providerSelectedItem,
                    items: _providerDropdownMenuItems,
                    onChanged: (value) {
                      // print();
                      // print(value.value);
                      setState(() {
                        // auctionController.auction.product.serviceProvider =
                        auctionController.setServiceProvider(value.id);

                        // value.id; // selectedCountry.value = value.value;
                        _providerSelectedItem = value;
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
