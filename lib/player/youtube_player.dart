import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class YoutubePlayer extends StatefulWidget {
  const YoutubePlayer({Key? key}) : super(key: key);

  @override
  State<YoutubePlayer> createState() => _YoutubePlayerState();
}

class _YoutubePlayerState extends State<YoutubePlayer> {
  @override
  Widget build(BuildContext context) {
    return InAppWebView(
      initialData: InAppWebViewInitialData(
        data: player,
        baseUrl: Uri.parse('https://www.youtube.com'),
        encoding: 'utf-8',
        mimeType: 'text/html',
      ),
      initialOptions: InAppWebViewGroupOptions(
        crossPlatform: InAppWebViewOptions(
          mediaPlaybackRequiresUserGesture: false,
          transparentBackground: true,
          disableContextMenu: true,
          supportZoom: false,
          disableHorizontalScroll: false,
          disableVerticalScroll: false,
          useShouldOverrideUrlLoading: true,
        ),
        ios: IOSInAppWebViewOptions(
          allowsInlineMediaPlayback: true,
          allowsAirPlayForMediaPlayback: true,
          allowsPictureInPictureMediaPlayback: true,
        ),
        android: AndroidInAppWebViewOptions(
          useWideViewPort: false,
        ),
      ),
    );
  }

  String get player => """
    <!DOCTYPE html>
    <html>
    <body>
        <div id="player"></div>
        <script>
            var tag = document.createElement('script');
            tag.src = "https://www.youtube.com/iframe_api";
            var firstScriptTag = document.getElementsByTagName('script')[0];
            firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
            var player;
            var timerId;
            function onYouTubeIframeAPIReady() {
                player = new YT.Player('player', {
                    height: '360',
                    width: '100%',
                    videoId: 'BBAyRBTfsOU',
                    playerVars: {
                      'autoplay': 1,
                      'fs': 0,
                      'loop': 1,
                      'modestbranding': 1,
                      'rel': 0
                    }
                });
            }
            
            function onPlayerReady(event) {
              event.target.playVideo();
            }
            var done = false;
            function onPlayerStateChange(event) {
              
            }
            function stopVideo() {
              player.stopVideo();
            }
        </script>
    </body>
    </html>
  """;
}
