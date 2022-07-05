import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../additional/constants.dart';

class FilterData extends StatefulWidget {
  final String reload;

  const FilterData({
    Key? key,
    // required this.title,
    required this.reload,
  }) : super(key: key);

  @override
  _FilterDataState createState() => _FilterDataState();
}

class _FilterDataState extends State<FilterData> {
  bool valuePending = false;
  bool valueUpdated = false;
  bool valueRejected = false;

  DateTime dateFrom = DateTime.now();
  DateTime dateTo = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(
              left: Constants.padding,
              top: Constants.padding,
              right: Constants.padding,
              bottom: Constants.padding),
          // margin: const EdgeInsets.only(top: Constants.avatarRadius),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(Constants.padding),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                "Filter",
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Date From'),
                        Text('Date To'),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton.icon(
                        // style: ButtonStyle(
                        //   side: MaterialStateProperty.all(
                        //     BorderSide(width: 2),
                        //   ),
                        // ),
                        /////////////////
                        style: TextButton.styleFrom(
                          primary: HexColor('#E6BF00'),
                        ),
                        icon: const Icon(Icons.calendar_month),
                        label: Text(
                            '${dateFrom.year}/${dateFrom.month}/${dateFrom.day}'),
                        onPressed: () async {
                          DateTime? newDate = await showDatePicker(
                            context: context,
                            initialDate: dateFrom,
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                          );
                          if (newDate == null) return;
                          setState(() => dateFrom = newDate);
                        },
                      ),
                      // const SizedBox(
                      //   height: 15,
                      // ),
                      TextButton.icon(
                        style: TextButton.styleFrom(
                          primary: HexColor('#E6BF00'),
                        ),
                        icon: const Icon(Icons.calendar_month),
                        label: Text(
                            '${dateTo.year}/${dateTo.month}/${dateTo.day}'),
                        onPressed: () async {
                          DateTime? newDate = await showDatePicker(
                            context: context,
                            initialDate: dateTo,
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                          );
                          if (newDate == null) return;
                          setState(() => dateTo = newDate);
                        },
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Wrap(
                children: [
                  Row(
                    children: [
                      Checkbox(
                        activeColor: HexColor('#E6BF00'),
                        value: valuePending,
                        onChanged: (bool? value) {
                          setState(() {
                            valuePending = value!;
                          });
                        },
                      ),
                      const Text('Pending'),
                    ],
                  ),
                  //updated checkbox
                  Row(
                    children: [
                      Checkbox(
                        activeColor: HexColor('#E6BF00'),
                        value: valueUpdated,
                        onChanged: (bool? value) {
                          setState(() {
                            valueUpdated = value!;
                          });
                        },
                      ),
                      const Text('Updated'),
                    ],
                  ),
                  //Rejected checkbox
                  Row(
                    children: [
                      Checkbox(
                        activeColor: HexColor('#E6BF00'),
                        value: valueRejected,
                        onChanged: (bool? value) {
                          setState(() {
                            valueRejected = value!;
                          });
                        },
                      ),
                      const Text('Rejected'),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(8.0),
                        backgroundColor: HexColor('#E6BF00'),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        widget.reload,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
