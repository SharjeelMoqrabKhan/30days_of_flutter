import 'package:flutter/material.dart';
import 'package:flutter_30/model/catelog.dart';
import 'package:flutter_30/pages/home_page_details.dart';
import 'package:flutter_30/widgets/home_widgets/catelog_image.dart';
import 'package:flutter_30/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class CatelogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: Catelog.items.length,
      itemBuilder: (context, index) {
        final catelog = Catelog.items[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePageDetails(catelog: catelog),
              ),
            );
          },
          child: CatelogItem(
            catelog: catelog,
          ),
        );
      },
    );
  }
}

class CatelogItem extends StatelessWidget {
  final Item catelog;

  const CatelogItem({Key key, @required this.catelog})
      : assert(catelog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: catelog.id.toString(),
            child: CatelogImage(
              image: catelog.image,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  catelog.name.text.lg.color(MyTheme.darkColor).make(),
                  catelog.desc.text.textStyle(context.captionStyle).make(),
                  10.heightBox,
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    buttonPadding: EdgeInsets.zero,
                    children: [
                      '\$ ${catelog.price}'.text.make(),
                      ElevatedButton(
                        onPressed: null,
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(MyTheme.darkColor),
                          shape: MaterialStateProperty.all(StadiumBorder()),
                        ),
                        child: Text(
                          'Buy',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ).pOnly(right: 8.0)
                ],
              ),
            ),
          )
        ],
      ),
    ).white.roundedLg.square(150).py16.make();
  }
}
