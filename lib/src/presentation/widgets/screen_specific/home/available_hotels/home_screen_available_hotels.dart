import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:moniepoint_flutter_assessment/src/core/extensions/screen_util/screen_util_extension.dart';
import 'package:moniepoint_flutter_assessment/src/core/extensions/string/string_to_color_extension.dart';
import 'package:moniepoint_flutter_assessment/src/presentation/screens/dashboard/home/home_viewmodel.dart';
import 'package:moniepoint_flutter_assessment/src/presentation/widgets/screen_specific/home/available_hotels/hotel_name/hotel_name_widget.dart';
import 'package:provider/provider.dart';

class HomeScreenAvailableHotels extends StatelessWidget {
  const HomeScreenAvailableHotels({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
        builder: (context, viewModel, _) => ValueListenableBuilder<bool>(
              valueListenable: viewModel.availableHotelsAnimationStarted,
              builder: (context, availableHotelsAnimationStarted, _) => Column(
                children: [
                  AnimatedSize(
                    duration: const Duration(seconds: 2),
                    onEnd: () {
                      viewModel.startDashboardBottomNavItemAnimation();
                      viewModel.startHotelNamesAnimation();
                    },
                    child: SizedBox(
                        height:
                            availableHotelsAnimationStarted ? 20.h : 0.5.sh),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                        color: "#FFFFFF".toColor,
                        borderRadius: BorderRadius.circular(20.r)),
                    child: StaggeredGrid.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.w,
                      crossAxisSpacing: 10.w,
                      children: List.generate(
                          viewModel.availableHotelsList.length,
                          (index) => StaggeredGridTile.count(
                                crossAxisCellCount: viewModel
                                    .getCrossAxisCellCountForAvailableHotels(
                                        index),
                                mainAxisCellCount: viewModel
                                    .getMainAxisCellCountForAvailableHotels(
                                        index),
                                child: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                        image: DecorationImage(
                                            image: AssetImage(viewModel
                                                .availableHotelsList[index]
                                                .hotelImagePath),
                                            fit: BoxFit.cover,
                                            filterQuality: FilterQuality.low)),
                                    child: HotelNameWidget(
                                        availableHotel: viewModel
                                            .availableHotelsList[index])),
                              )),
                    ),
                  ),
                  SizedBox(height: 100.h)
                ],
              ),
            ));
  }
}
