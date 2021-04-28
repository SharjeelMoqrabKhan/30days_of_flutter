import 'package:flutter/material.dart';
import 'package:flutter_30/model/catelog.dart';
import 'package:flutter_30/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePageDetails extends StatelessWidget {
  final Item catelog;

  const HomePageDetails({Key key, @required this.catelog})
      : assert(catelog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(),
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        buttonPadding: EdgeInsets.zero,
        children: [
          '\$ ${catelog.price}'.text.xl3.make(),
          ElevatedButton(
            onPressed: null,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(MyTheme.darkColor),
              shape: MaterialStateProperty.all(StadiumBorder()),
            ),
            child: Text(
              'Buy',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          )
        ],
      ).p16(),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: catelog.id.toString(),
              child: Image.network(catelog.image),
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 30,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  color: Colors.white,
                  width: context.screenWidth,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        catelog.name.text.xl4.color(MyTheme.darkColor).make(),
                        catelog.desc.text.xl
                            .textStyle(context.captionStyle)
                            .make(),
                        10.heightBox,
                        'Voluptua ipsum no labore ut gubergren sanctus justo eos est duo, sed eos dolor kasd voluptua no et labore. Kasd.'
                            .text
                            .textStyle(context.captionStyle)
                            .make()
                            .p16(),
                      ],
                    ).py64(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
