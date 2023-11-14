import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hunter/constant.dart';
import 'package:video_player/video_player.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VideosView extends StatefulWidget {
  const VideosView({Key? key, required this.path}) : super(key: key);

  final String path;

  @override
  State<VideosView> createState() => _VideosViewState();
}

class _VideosViewState extends State<VideosView> {
  FlickManager? flickManager;
  bool isPlay = false;

  @override
  void initState() {
    super.initState();

    setState(() {
      flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.network(widget.path),
        autoPlay: false,
      );

      if (flickManager!.flickVideoManager!.isPlaying == true) {
        setState(() {
          flickManager!.flickControlManager!.pause();
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    flickManager!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: blackColor,
        body: Stack(
          children: [
            flickManager != null
                ? Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: 250.h,
                      child: FlickVideoPlayer(
                        flickManager: flickManager!,
                        preferredDeviceOrientation: [
                          DeviceOrientation.portraitUp,
                          DeviceOrientation.landscapeLeft,
                          DeviceOrientation.landscapeRight,
                        ],
                        flickVideoWithControlsFullscreen:
                            FlickVideoWithControls(
                          controls: Stack(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: GestureDetector(
                                  onTap: () {
                                    if (flickManager!
                                            .flickVideoManager!.isPlaying ==
                                        true) {
                                      setState(() {
                                        flickManager!.flickControlManager!
                                            .pause();
                                      });
                                    } else {
                                      setState(() {
                                        flickManager!.flickControlManager!
                                            .play();
                                      });
                                    }
                                  },
                                  child: Container(
                                    height: 49.h,
                                    width: 40.w,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: whiteColor.withOpacity(0.3)),
                                    child: Center(
                                      child: Icon(
                                        flickManager!.flickVideoManager!
                                                    .isPlaying ==
                                                true
                                            ? Icons.pause
                                            : Icons.play_arrow,
                                        color: whiteColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 20.h,
                                right: 20.w,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      flickManager!.flickControlManager!
                                          .exitFullscreen();
                                    });
                                  },
                                  child: Icon(
                                    Icons.fullscreen_exit,
                                    color: whiteColor,
                                  ),
                                ),
                              ),
                              Positioned(
                                  top: 40.h,
                                  left: 20.w,
                                  child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          flickManager!.flickControlManager!
                                              .exitFullscreen();
                                        });

                                        Navigator.pop(context);
                                      },
                                      child: Icon(
                                        Icons.close,
                                        color: whiteColor,
                                      )))
                            ],
                          ),
                        ),
                        flickVideoWithControls: FlickVideoWithControls(
                          controls: Stack(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: GestureDetector(
                                  onTap: () {
                                    if (flickManager!
                                            .flickVideoManager!.isPlaying ==
                                        true) {
                                      setState(() {
                                        flickManager!.flickControlManager!
                                            .pause();
                                      });
                                    } else {
                                      setState(() {
                                        flickManager!.flickControlManager!
                                            .play();
                                      });
                                    }
                                  },
                                  child: Container(
                                    height: 40.h,
                                    width: 40.w,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: whiteColor.withOpacity(0.3)),
                                    child: Center(
                                      child: Icon(
                                        flickManager!.flickVideoManager!
                                                        .isPlaying ==
                                                    false ||
                                                flickManager!.flickVideoManager!
                                                        .isVideoEnded ==
                                                    true
                                            ? Icons.play_arrow
                                            : Icons.pause,
                                        color: whiteColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 10.w,
                                child: GestureDetector(
                                  onTap: () {

                                      setState(() {
                                        flickManager!.flickControlManager!
                                            .enterFullscreen();
                                      });
                                  },
                                  child: Icon(
                                    Icons.fullscreen,
                                    color: whiteColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 250.h,
                      width: MediaQuery.of(context).size.width,
                      color: whiteColor,
                      child: Center(
                        child: SizedBox(
                            height: 30.h,
                            width: 30.w,
                            child: CircularProgressIndicator(
                              color: blackColor,
                            )),
                      ),
                    ),
                  ),
            Positioned(
                top: 60.h,
                left: 20.w,
                child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.close,
                      color: whiteColor,
                    )))
          ],
        ));
  }
}
