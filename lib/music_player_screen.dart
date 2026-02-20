import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class MusicPlayerScreen extends StatefulWidget {
  const MusicPlayerScreen({super.key});

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  final AudioPlayer _player = AudioPlayer();

  // Hardcoded duration for now – we will replace this later
  final double _totalDuration = 215;

  String _formatTime(double seconds) {
    final int m = seconds ~/ 60;
    final int s = (seconds % 60).toInt();
    return "$m:${s.toString().padLeft(2, '0')}";
  }

  @override
  void initState() {
    super.initState();
    _loadAudio();
  }

  Future<void> _loadAudio() async {
    await _player.setAsset('assets/song.mp3');
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double artSize =
        (MediaQuery.of(context).size.width * 0.7).clamp(200, 350);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 380),
            child: Column(
              children: [
                // Album Art
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Container(
                    width: artSize,
                    height: artSize,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: AssetImage('assets/blood.jpeg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Song Title
                const Text(
                  "Blood (Alucard Rap)",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 6),

                // Artist
                const Text(
                  "Rustage, TOPHAMHAT-KYO",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 25),

                // Play Controls
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () async {
  if (_player.playing) {
    await _player.pause();
  } else {
    await _player.play();
  }
  setState(() {});
},

                      child: const Icon(
                        Icons.skip_previous,
                        size: 40,
                        color: Colors.black,
                      ),
                    ),

                    const SizedBox(width: 30),

                    GestureDetector(
                      onTap: () async {
                        if (_player.playing) {
                          await _player.pause();
                        } else {
                          await _player.play();
                        }
                        setState(() {});
                      },
                      child: Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Icon(
                          _player.playing ? Icons.pause : Icons.play_arrow,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),

                    const SizedBox(width: 30),

                    GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.skip_next,
                        size: 40,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                // Slider + Times
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: StreamBuilder<Duration>(
                    stream: _player.positionStream,
                    builder: (context, snapshot) {
                      final position = snapshot.data ?? Duration.zero;
                      final currentSeconds = position.inSeconds.toDouble();

                      return Column(
                        children: [
                          Slider(
                            value:
                                currentSeconds.clamp(0, _totalDuration),
                            min: 0,
                            max: _totalDuration,
                            onChanged: (value) {
                              _player.seek(
                                  Duration(seconds: value.toInt()));
                            },
                            activeColor: Colors.black,
                            inactiveColor: Colors.grey,
                          ),

                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _formatTime(currentSeconds),
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                _formatTime(_totalDuration),
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 50),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
