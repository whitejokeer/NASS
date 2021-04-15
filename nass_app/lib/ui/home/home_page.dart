import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/circular_indicator.dart';
import '../widgets/soft_card.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> options = [
    {"logo": "assets/icons/image.png", "name": "Imagenes", "route": "/images"},
    {"logo": "assets/icons/videos.png", "name": "Videos", "route": "/videos"},
    {
      "logo": "assets/icons/Google_Docs.png",
      "name": "Documentos",
      "route": "/docs"
    },
    {
      "logo": "assets/icons/share.png",
      "name": "Compartido",
      "route": "/shared"
    },
  ];

  double storageUsed = 0.7;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "NASS",
          style: Theme.of(context).textTheme.headline1.copyWith(
                letterSpacing: 3.0,
              ),
        ),
        actions: [
          MaterialButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            child: Image.asset("assets/icons/logout_black_24dp.png"),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            sliver: SliverToBoxAdapter(
              child: SoftCard(
                height: 200,
                child: Row(
                  children: [
                    Flexible(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Espacio Disponible",
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  width: 51,
                                  child: Image.asset(
                                      'assets/icons/Cloud Folder.png'),
                                ),
                                SizedBox(
                                  width: 8.0,
                                ),
                                Text(
                                  "${(10 - storageUsed).toStringAsFixed(2)} Gb",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Flexible(
                      flex: 2,
                      child: CircularIndicator(
                        storage: storageUsed,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Carpetas',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 180,
                crossAxisCount: 2,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
              ),
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, options[index]['route']),
                  child: SoftCard(
                    height: 192,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(child: Image.asset(options[index]['logo'])),
                        SizedBox(
                          height: 16.0,
                        ),
                        Text(options[index]['name'])
                      ],
                    ),
                  ),
                );
              }, childCount: 4),
            ),
          )
        ],
      ),
    );
  }
}
