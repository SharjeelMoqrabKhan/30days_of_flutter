import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_30/model/catelog.dart';
import 'package:flutter_30/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 1));
    final catelogJson =
        await rootBundle.loadString('assets/files/catelog.json');
    final decodedData = jsonDecode(catelogJson);
    var productData = decodedData["products"];
    Catelog.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (Catelog.items != null && Catelog.items.isNotEmpty)
                CatelogList().expand()
              else
                Center(
                  child: CircularProgressIndicator(),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catelog App".text.xl5.bold.color(MyTheme.darkColor).make(),
        "Trending Products".text.xl2.color(MyTheme.darkColor).make(),
      ],
    );
  }
}

class CatelogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: Catelog.items.length,
      itemBuilder: (context, index) {
        final catelog = Catelog.items[index];
        return CatelogItem(
          catelog: catelog,
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
          CatelogImage(
            image: catelog.image,
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
                            shape: MaterialStateProperty.all(StadiumBorder())),
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

class CatelogImage extends StatelessWidget {
  final String image;

  const CatelogImage({Key key, @required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .p8
        .color(MyTheme.creamColor)
        .make()
        .p16()
        .w32(context);
  }
}
