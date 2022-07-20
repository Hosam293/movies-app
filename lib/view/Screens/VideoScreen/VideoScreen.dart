import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late YoutubePlayerController _controller;
  bool isMute = false;

//https://www.youtube.com/watch?v=ID_HERE
  @override
  void initState() {
    super.initState();
    String videoId='rYEDA3JcQqw';
    //YoutubePlayer.convertUrlToId(url)!
    String url = 'https://www.youtube.com/watch?v=$videoId';
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(url)!,
      flags: YoutubePlayerFlags(
        mute: false, // is video sound playing?
        loop: false,  // is same video repeated?
        autoPlay: true, // is video played when initialized?
      )
    )..addListener(() {
      if(mounted){
        setState(() {
          // m3na el method de en m3 kol t8yer fy el controller ysm3 fy el ui bta3k 3la el shasha
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('video player'),
      ),
      body: YoutubePlayerBuilder(
         player: YoutubePlayer(
           controller: _controller, // here we have to initial our controller up ,
           // we cane use controller in full screen mode by controller.togglefullScreenmode()
         ),builder: (context,player)
      {
        return ListView(
          children: [
            Stack(
              children: [
                player,
                IconButton(onPressed: ()

                {
                  setState(() {
                    isMute =! isMute;
                  });
                  if(isMute){
                    _controller.mute();

                  }else {
                    _controller.unMute();

                  }

                },icon: Icon(Icons.volume_mute_outlined,color: Colors.white,),),


              ],
            ),
            MaterialButton(onPressed: ()
            {
              if(_controller.value.isPlaying){
                _controller.pause();
              }else{
                _controller.play();
              }
              // _controller.mute();
              // _controller.unMute();
              // _controller.seekTo(Duration(seconds: 10));
            },
              color: Colors.red,
              child: (_controller.value.isPlaying)? Row(
                children: [
                  Text('pause'),
                  Spacer(),
                  IconButton(onPressed: ()

                  {
                    setState(() {
                      isMute =! isMute;
                    });
                    if(isMute){
                      _controller.mute();

                    }else {
                      _controller.unMute();

                    }

                  },icon: Icon(Icons.volume_mute_outlined,color: Colors.white,),),
                  // IconButton(onPressed: ()
                  // {
                  //   _controller.unMute();
                  // },icon: Icon(Icons.music_off_outlined,color: Colors.white,),)
                ],
              ):Text('play'), // 3lshan el controller ysm3 el 7agat el enta bt3mlha feh lazeem tdeef fo2 listenner

            ),
            Text(_controller.metadata.title),
            Text(_controller.metadata.author),
            Text('${_controller.metadata.duration}'),

          ],
        );
      }
      ),
    );
  }
}
