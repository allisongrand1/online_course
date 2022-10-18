// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../models/hotel.dart';
import '../style/style_text.dart';

class DetailInfoHotel extends StatelessWidget {
  final HotelUuid info;
  List<Widget> list = [];
  DetailInfoHotel({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    for (var item in info.photos) {
      list.add(Image.asset(
        'assets/images/$item',
        fit: BoxFit.fitWidth,
        width: 300,
      ));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider(items: list, options: CarouselOptions(height: 200)),
        CustomText(
          aboutInfo: 'Страна: ',
          information: info.address.country,
        ),
        CustomText(
          aboutInfo: 'Город: ',
          information: info.address.city,
        ),
        CustomText(
          aboutInfo: 'Улица: ',
          information: info.address.street,
        ),
        CustomText(
           aboutInfo:'Рейтинг: ',
          information: '${info.rating}',
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Header(
            header: 'Сервисы',
            size: 16,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Header(
                    header: 'Платные',
                    size: 14,
                  ),
                  for(var i in info.services.paid)CustomText(aboutInfo: i,),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Header(
                    header: 'Бесплатно',
                    size: 14,
                  ),
                  for(var i in info.services.free)CustomText(aboutInfo: i,),

                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
