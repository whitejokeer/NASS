import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controllers/provider_handler.dart';
import '../widgets/soft_card.dart';

class ImagesGridBuilder extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final imageBuilder = watch(imageDataProvider);
    return imageBuilder.when(
      data: (item) => item.isNotEmpty
          ? SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 180.0,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
              ),
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return SoftCard(
                  padding: EdgeInsets.zero,
                  child: Column(
                    children: [
                      Flexible(
                        flex: 5,
                        child: Container(
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16.0, horizontal: 8.0),
                                child: Center(
                                  child: FadeInImage.assetNetwork(
                                      placeholder: 'assets/gif/loading.gif',
                                      image: item[index].imageUrl),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 8.0, right: 8.0),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      item.removeAt(index);
                                      Navigator.pushReplacementNamed(
                                          context, '/images');
                                    },
                                    child: Container(
                                      width: 40.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey[300],
                                      ),
                                      child: Icon(
                                        Icons.delete,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.0,
                          ),
                          child: Text(
                            item[index].nombre,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                .copyWith(fontSize: 16),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }, childCount: item.length),
            )
          : SliverToBoxAdapter(
              child: Center(
                child: Text(
                  "Aun no has montado ninguna imagen a la nube.",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1.copyWith(),
                ),
              ),
            ),
      loading: () => SliverToBoxAdapter(
        child: Container(
          height: 80.0,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
      error: (e, s) => SliverToBoxAdapter(
        child: Center(
          child: Text("Ocurrio un error inesperado.\nVuelve a intentarlo."),
        ),
      ),
    );
  }
}
