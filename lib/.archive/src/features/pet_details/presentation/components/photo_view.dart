import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

//! TODO: Bug a barra preta está indo até o snackBar e a outra parte está completamente branca
//TODO: Quando retornar, devolver o valor que está na página agora, para que eu salte para essa página na anterior


/// Dá um zoom na imagem, permitindo visualização FullScreen
/// útil para visualizar fotos 9:16
class PhotoViewPage extends StatefulWidget {
  final List<String> photos;
  final PageController controller;

  const PhotoViewPage({
    Key? key,
    required this.photos, required this.controller,
  }) : super(key: key);

  @override
  State<PhotoViewPage> createState() => _PhotoViewPageState();
}

class _PhotoViewPageState extends State<PhotoViewPage> {

late final PageController pageController; 
@override
void initState() {
  super.initState();
  pageController = PageController(initialPage: widget.controller.page!.toInt());
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading:  IconButton(
          onPressed: ()=> Modular.to.pop(),
          icon: const Icon(Icons.close),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 68),
        child: PhotoViewGallery.builder(
          pageController: pageController,
          itemCount: widget.photos.length,
          builder: (context, index) =>
              PhotoViewGalleryPageOptions.customChild(
            child: CachedNetworkImage(
              imageUrl: widget.photos[index],
              placeholder: (context, url) => Container(
                color: Colors.grey,
              ),
              errorWidget: (context, url, error) => Container(
                color: Colors.red.shade400,
              ),
            ),
            minScale: PhotoViewComputedScale.covered,
            heroAttributes: PhotoViewHeroAttributes(tag: widget.photos[index]),
          ),
          enableRotation: true,
        ),
      ),
    );
  }
}

// class SliderPage extends StatefulWidget {
//   const SliderPage({
//     super.key,
//     required this.pet,
//   });

//   final Pet pet; // o pet terá todas as imagens daquele pet;

//   @override
//   State<SliderPage> createState() => _SliderPageState();
// }

// class _SliderPageState extends State<SliderPage> {
//   final PageController _pageController = PageController();

//   @override
//   void initState() {
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.portraitUp,
//     ]);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _pageController.dispose();
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.landscapeRight,
//       DeviceOrientation.landscapeLeft,
//       DeviceOrientation.portraitUp,
//       DeviceOrientation.portraitDown,
//     ]);
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: true,
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//       ),
//       extendBodyBehindAppBar: true,
//       body: PageView.builder(
//         controller: _pageController,
//         itemCount: widget.pet.images.length,
//         itemBuilder: (context, i) {
//           final cachedNetworkImage = CachedNetworkImage(
//             //TODO: Implement [progressIndicatorBuilder] com uma imagem embaçada e depois a imagem em si, se possível ir ganhando qualidade progressivamente

//             imageUrl: widget.pet.images[i],
//             fit: BoxFit.cover,
//             alignment: Alignment.bottomCenter,

//             errorWidget: (c, url, err) =>
//                 const Center(child: Icon(Icons.image_not_supported)),
//           );
//           Widget result = Container();
//           if (i > 1) {
//             result = cachedNetworkImage;
//           }
//           result = Hero(
//             tag: widget.pet.images[i],
//             child: cachedNetworkImage,
//           );

//           return Stack(
//             children: [
//               result,
//               const Align(
//                 alignment: Alignment.bottomCenter,
//                 //TODO: Arredondar esse botão
//                 child: ElevatedButton(
//                   onPressed: null,
//                   child: Text("Saiba mais"),
//                 ),
//               )
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

// class InteractiveGalleryScreen extends StatefulWidget {
//   const InteractiveGalleryScreen({super.key});

//   @override
//   State<InteractiveGalleryScreen> createState() =>
//       _InteractiveGalleryScreenState();
// }

// class _InteractiveGalleryScreenState extends State<InteractiveGalleryScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: SafeArea(
//         child: NinhadaPresentationScreen(
//           child: StoryScreen(),
//         ),
//       ),
//     );
//   }
// }

// class NinhadaPresentationScreen extends StatefulWidget {
//   const NinhadaPresentationScreen({
//     Key? key,
//     required this.child,
//   }) : super(key: key);

//   final Widget child;

//   @override
//   State<NinhadaPresentationScreen> createState() =>
//       _NinhadaPresentationScreenState();
// }

// class _NinhadaPresentationScreenState extends State<NinhadaPresentationScreen> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         widget.child,
//         Align(
//           alignment: Alignment.topRight,
//           child: IconButton(
//             onPressed: () => Navigator.pop(context),
//             icon: const Icon(Icons.close),
//           ),
//         ),
//         const Align(
//           alignment: Alignment.bottomCenter,
//           //TODO: Arredondar esse botão
//           child: ElevatedButton(
//             onPressed: null,
//             child: Text("Outros ângulos"),
//           ),
//         )
//       ],
//     );
//   }
// }

// class StoryScreen extends StatefulWidget {
//   const StoryScreen({super.key});

//   @override
//   State<StoryScreen> createState() => _StoryScreenState();
// }

// class _StoryScreenState extends State<StoryScreen>
//     with SingleTickerProviderStateMixin {
//   late PageController _pageController;
//   late AnimationController _animController;
//   int _currentIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController();

//     _animController = AnimationController(vsync: this);

//     _loadStory(animateToPage: false);

//     // _animController.addStatusListener((status) {
//     //   if (status == AnimationStatus.completed) {
//     //     _animController.stop();
//     //     _animController.reset();
//     //     setState(() {
//     //       if (_currentIndex + 1 < 5) {
//     //         _currentIndex += 1;
//     //         _loadStory();
//     //       } else {
//     //         // Out of bounds - loop story
//     //         // You can also Navigator.of(context).pop() here
//     //         _currentIndex = 0;
//     //         _loadStory();
//     //       }
//     //     });
//     //   }
//     // });
//   }

//   @override
//   void dispose() {
//     _pageController.dispose();
//     // _animController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         PageView.builder(
//             controller: _pageController,
//             // physics:const NeverScrollableScrollPhysics(),
//             itemCount: 5,
//             itemBuilder: (context, i) {
//               return const Placeholder();
//               // return CachedNetworkImage(
//               //   imageUrl: "",//TODO: Adicionar uma imgUrl
//               //   fit: BoxFit.cover,
//               // );
//             }),
//         Positioned(
//           top: 40.0,
//           left: 10.0,
//           right: 10.0,
//           child: Row(
//             children: //widget.stories
//                 []
//                     .asMap()
//                     .map((i, e) {
//                       return MapEntry(
//                         i,
//                         AnimatedBar(
//                           animController: _animController,
//                           position: i,
//                           currentIndex: _currentIndex,
//                         ),
//                       );
//                     })
//                     .values
//                     .toList(),
//           ),
//         ),
//       ],
//     );
//   }

//   void _onTapDown(TapDownDetails details) {
//     final double screenWidth = MediaQuery.of(context).size.width;
//     final double dx = details.globalPosition.dx;
//     if (dx < screenWidth / 3) {
//       setState(() {
//         if (_currentIndex - 1 >= 0) {
//           _currentIndex -= 1;
//           _loadStory();
//         }
//       });
//     } else if (dx > 2 * screenWidth / 3) {
//       setState(() {
//         if (_currentIndex + 1 < 5) {
//           _currentIndex += 1;
//           _loadStory();
//         } else {
//           // Out of bounds - loop story
//           // You can also Navigator.of(context).pop() here
//           _currentIndex = 0;
//           _loadStory();
//         }
//       });
//     }
//   }

//   void _loadStory({bool animateToPage = true}) {
//     _animController.stop();
//     _animController.reset();
//     _animController.duration = const Duration(seconds: 3);
//     _animController.forward();
//     if (animateToPage) {
//       _pageController.animateToPage(
//         _currentIndex,
//         duration: const Duration(milliseconds: 1),
//         curve: Curves.easeInOut,
//       );
//     }
//   }
// }

// class AnimatedBar extends StatelessWidget {
//   final AnimationController animController;
//   final int position;
//   final int currentIndex;

//   const AnimatedBar({
//     Key? key,
//     required this.animController,
//     required this.position,
//     required this.currentIndex,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Flexible(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 1.5),
//         child: LayoutBuilder(
//           builder: (context, constraints) {
//             return Stack(
//               children: <Widget>[
//                 _buildContainer(
//                   double.infinity,
//                   position < currentIndex
//                       ? Colors.red
//                       : Colors.red.withOpacity(0.5),
//                 ),
//                 position == currentIndex
//                     ? AnimatedBuilder(
//                         animation: animController,
//                         builder: (context, child) {
//                           return _buildContainer(
//                             constraints.maxWidth * animController.value,
//                             Colors.red,
//                           );
//                         },
//                       )
//                     : const SizedBox.shrink(),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }

//   Container _buildContainer(double width, Color color) {
//     return Container(
//       height: 5.0,
//       width: width,
//       decoration: BoxDecoration(
//         color: color,
//         border: Border.all(
//           color: Colors.black26,
//           width: 0.8,
//         ),
//         borderRadius: BorderRadius.circular(3.0),
//       ),
//     );
//   }
// }
