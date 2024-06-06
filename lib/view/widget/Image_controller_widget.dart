import 'package:flutter/cupertino.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../constants/app_colors.dart';
import 'common_image_view_widget.dart';

class ImageController extends StatelessWidget {
  final String? url;

  const ImageController({super.key, this.url});

  @override
  Widget build(BuildContext context) {
    var mqh = MediaQuery.of(context).size.height;
    var mqw = MediaQuery.of(context).size.width;
    final PageController _pageController = PageController();
    return Column(
      children: [
        SizedBox(
          height: mqh * 0.19,
          width: mqw * 0.56,
          child: PageView(
            controller: _pageController,
            children: [
              Image(
                image: NetworkImage(url ??
                    "https://myeclapi.000webhostapp.com/images/Laglin-removebg-preview_optimized.png"),
                height: mqh * 0.19,
                width: mqw * 0.56,
              ),
              Image(
                image: NetworkImage(url ??
                    "https://myeclapi.000webhostapp.com/images/Laglin-removebg-preview_optimized.png"),
                height: mqh * 0.19,
                width: mqw * 0.56,
              ),
              Image(
                image: NetworkImage(url ??
                    "https://myeclapi.000webhostapp.com/images/Laglin-removebg-preview_optimized.png"),
                height: mqh * 0.19,
                width: mqw * 0.56,
              ),
              Image(
                image: NetworkImage(url ??
                        "https://myeclapi.000webhostapp.com/images/Laglin-removebg-preview_optimized.png"
                    //"http://10.0.2.2/add_product_api_practice/images/Laglin-removebg-preview_optimized.png"
                    ),
                height: mqh * 0.19,
                width: mqw * 0.56,
              )
              // CommonImageView(
              //   imagePath: "assets/images/Rectangle-removebg-preview.png",
              //   height: mqh * 0.19,
              //   width: mqw * 0.56,
              // ),
              // CommonImageView(
              //   imagePath: "assets/images/Rectangle-removebg-preview.png",
              //   height: mqh * 0.19,
              //   width: mqw * 0.56,
              // ),
              // CommonImageView(
              //   imagePath: "assets/images/Rectangle-removebg-preview.png",
              //   height: mqh * 0.19,
              //   width: mqw * 0.56,
              // ),
              // CommonImageView(
              //   imagePath: "assets/images/Rectangle-removebg-preview.png",
              //   height: mqh * 0.19,
              //   width: mqw * 0.56,
              // ),
            ],
          ),
        ),
        SizedBox(height: mqh * 0.01),
        SmoothPageIndicator(
          controller: _pageController,
          count: 4,
          effect: WormEffect(
            dotHeight: 8,
            dotWidth: 8,
            activeDotColor: kTextColor,
          ),
        ),
      ],
    );
  }
}
