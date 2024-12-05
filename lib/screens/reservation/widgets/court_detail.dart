import 'package:flutter/material.dart';

import '../../../shared/widgets/widgets.dart';

import '../../../core/constants/color.constant.dart';
import '../../../core/models/court.dart';
import '../../../core/themes/app.styles.dart';

class CourtDetail extends StatelessWidget {
  final Court court;
  final String instructor;
  final bool showDrowpdown;
  final Function(String?)? onChangeDrowpdown;

  const CourtDetail({
    super.key,
    required this.court,
    this.onChangeDrowpdown,
    required this.instructor,
    required this.showDrowpdown,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:
            const EdgeInsets.only(left: 32, right: 31, top: 24, bottom: 22),
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                court.courtName,
                style: AppStyle.txtPoppinsSemiBold20Black,
              ),
              Text(
                '\$${court.cost}',
                style: AppStyle.txtPoppinsSemiBold20Blue,
              )
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Cancha Tipo ${court.type}',
                style: AppStyle.txtPoppinsRegular12Black,
              ),
              Text(
                'Por hora',
                style: AppStyle.txtPoppinsRegular12Gray,
              )
            ],
          ),
          const SizedBox(height: 12),
          Row(children: [
            Row(
              children: [
                Text(
                  'Disponible',
                  style: AppStyle.txtPoppinsRegular12Black,
                ),
                const SizedBox(width: 8),
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                      color: ColorConstant.blue34,
                      borderRadius: BorderRadius.circular(50)),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.schedule_outlined, size: 12),
                const SizedBox(width: 4),
                Text(
                  court.availableSchedule,
                  style: AppStyle.txtPoppinsRegular12Black,
                )
              ],
            ),
            Expanded(
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                CustomIcon(
                  icon: 'rainy_icon',
                  color: ColorConstant.blue34,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text('${court.rainy} %')
              ]),
            )
          ]),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.location_on_outlined),
              const SizedBox(width: 4),
              Text(
                'Vía Av. Caracas y Av. P.º Caroni',
                style: AppStyle.txtPoppinsRegular12Black,
              )
            ],
          ),
          if (showDrowpdown)
            Padding(
              padding: const EdgeInsets.only(top: 24, bottom: 22),
              child: _SelectInstructor(
                value: instructor,
                onChange: onChangeDrowpdown,
              ),
            ),
        ]));
  }
}

class _SelectInstructor extends StatelessWidget {
  final String value;
  final Function(String?)? onChange;

  const _SelectInstructor({
    super.key,
    this.onChange,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> dropdownList = [
      {
        'label': 'Agregar instructor',
        'value': '',
      },
      {
        'label': 'Mark Gonzales',
        'value': 'Mark Gonzales',
      },
      {
        'label': 'Andres Perez',
        'value': 'Andres Perez',
      },
    ];
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 180, maxHeight: 60),
      child: DropdownButtonFormField(
          onChanged: onChange,
          value: value,
          icon: const Icon(Icons.keyboard_arrow_down_outlined),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: ColorConstant.black3D, width: 1.0),
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
          style: AppStyle.txtPoppinsRegular14Black,
          items: List.generate(
              dropdownList.length,
              (index) => DropdownMenuItem(
                    value: dropdownList[index]['value'],
                    child: Text(
                      dropdownList[index]['label']!,
                      style: AppStyle.txtPoppinsRegular14Black,
                    ),
                  )).toList()),
    );
  }
}
