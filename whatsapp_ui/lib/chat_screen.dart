import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff181818),

      // ---------------- APP BAR ----------------
      appBar: AppBar(
        backgroundColor: const Color(0xff181818),
        elevation: 0,
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Color(0xffFFFFFF),
          ),
        ),
        title: Row(
          children: [
            // profile picture
            // width 38 with radius 19 = a circle
            Container(
              width: 38,
              height: 38,
              alignment: const Alignment(0, 0),
              decoration: BoxDecoration(
                color: const Color(0xff232D36),
                borderRadius: BorderRadius.circular(19),
              ),
              child: const Icon(
                Icons.person,
                color: Color(0xffFFFFFF),
                size: 22,
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              'John Safwat',
              style: TextStyle(
                color: Color(0xff168C4B),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.call_outlined, color: Color(0xffFFFFFF)),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.videocam_outlined, color: Color(0xffFFFFFF)),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert, color: Color(0xffFFFFFF)),
          ),
        ],
      ),

      // ---------------- BODY ----------------
      body: Stack(
        children: [
          // layer 1 : the repeating pattern
          // after exporting the tile from figma this whole Column can be
          // replaced with:
          // Image.asset('assets/images/chat_pattern.png', repeat: ImageRepeat.repeat)
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.chat_bubble_outline,
                      color: Color(0x0AFFFFFF), size: 26),
                  Icon(Icons.favorite_border,
                      color: Color(0x0AFFFFFF), size: 26),
                  Icon(Icons.camera_alt_outlined,
                      color: Color(0x0AFFFFFF), size: 26),
                  Icon(Icons.music_note_outlined,
                      color: Color(0x0AFFFFFF), size: 26),
                  Icon(Icons.star_border, color: Color(0x0AFFFFFF), size: 26),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.local_cafe_outlined,
                      color: Color(0x0AFFFFFF), size: 26),
                  Icon(Icons.flight, color: Color(0x0AFFFFFF), size: 26),
                  Icon(Icons.emoji_emotions_outlined,
                      color: Color(0x0AFFFFFF), size: 26),
                  Icon(Icons.headphones_outlined,
                      color: Color(0x0AFFFFFF), size: 26),
                  Icon(Icons.pets, color: Color(0x0AFFFFFF), size: 26),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.lightbulb_outline,
                      color: Color(0x0AFFFFFF), size: 26),
                  Icon(Icons.sports_soccer, color: Color(0x0AFFFFFF), size: 26),
                  Icon(Icons.wb_sunny_outlined,
                      color: Color(0x0AFFFFFF), size: 26),
                  Icon(Icons.cake_outlined, color: Color(0x0AFFFFFF), size: 26),
                  Icon(Icons.directions_bike,
                      color: Color(0x0AFFFFFF), size: 26),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.favorite_border,
                      color: Color(0x0AFFFFFF), size: 26),
                  Icon(Icons.camera_alt_outlined,
                      color: Color(0x0AFFFFFF), size: 26),
                  Icon(Icons.chat_bubble_outline,
                      color: Color(0x0AFFFFFF), size: 26),
                  Icon(Icons.star_border, color: Color(0x0AFFFFFF), size: 26),
                  Icon(Icons.music_note_outlined,
                      color: Color(0x0AFFFFFF), size: 26),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.flight, color: Color(0x0AFFFFFF), size: 26),
                  Icon(Icons.pets, color: Color(0x0AFFFFFF), size: 26),
                  Icon(Icons.local_cafe_outlined,
                      color: Color(0x0AFFFFFF), size: 26),
                  Icon(Icons.sports_soccer, color: Color(0x0AFFFFFF), size: 26),
                  Icon(Icons.emoji_emotions_outlined,
                      color: Color(0x0AFFFFFF), size: 26),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.cake_outlined, color: Color(0x0AFFFFFF), size: 26),
                  Icon(Icons.headphones_outlined,
                      color: Color(0x0AFFFFFF), size: 26),
                  Icon(Icons.directions_bike,
                      color: Color(0x0AFFFFFF), size: 26),
                  Icon(Icons.lightbulb_outline,
                      color: Color(0x0AFFFFFF), size: 26),
                  Icon(Icons.wb_sunny_outlined,
                      color: Color(0x0AFFFFFF), size: 26),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.star_border, color: Color(0x0AFFFFFF), size: 26),
                  Icon(Icons.chat_bubble_outline,
                      color: Color(0x0AFFFFFF), size: 26),
                  Icon(Icons.favorite_border,
                      color: Color(0x0AFFFFFF), size: 26),
                  Icon(Icons.music_note_outlined,
                      color: Color(0x0AFFFFFF), size: 26),
                  Icon(Icons.camera_alt_outlined,
                      color: Color(0x0AFFFFFF), size: 26),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.pets, color: Color(0x0AFFFFFF), size: 26),
                  Icon(Icons.wb_sunny_outlined,
                      color: Color(0x0AFFFFFF), size: 26),
                  Icon(Icons.sports_soccer, color: Color(0x0AFFFFFF), size: 26),
                  Icon(Icons.local_cafe_outlined,
                      color: Color(0x0AFFFFFF), size: 26),
                  Icon(Icons.flight, color: Color(0x0AFFFFFF), size: 26),
                ],
              ),
            ],
          ),

          // layer 2 : the chat
          Padding(
            // the design asks for 16 on the horizontal axis only
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Expanded(
                  // Expanded gives the scroll view a height,
                  // without it the Column has no bounds and it crashes
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 12),

                        // ---------- message 1 : incoming ----------
                        Padding(
                          padding: const EdgeInsets.only(right: 70, bottom: 12),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 10),
                              decoration: const BoxDecoration(
                                color: Color(0xff168C4B),
                                // the square corner points at the sender
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.zero,
                                  topRight: Radius.circular(16),
                                  bottomLeft: Radius.circular(16),
                                  bottomRight: Radius.circular(16),
                                ),
                              ),
                              child: const Text(
                                'Hello !',
                                style: TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),

                        // ---------- message 2 : outgoing ----------
                        Padding(
                          padding: const EdgeInsets.only(left: 70, bottom: 12),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 10),
                              decoration: const BoxDecoration(
                                color: Color(0xff232D36),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.zero,
                                  bottomLeft: Radius.circular(16),
                                  bottomRight: Radius.circular(16),
                                ),
                              ),
                              child: const Text(
                                'Hello !',
                                style: TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),

                        // ---------- message 3 : long incoming ----------
                        Padding(
                          padding: const EdgeInsets.only(right: 70, bottom: 12),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 10),
                              decoration: const BoxDecoration(
                                color: Color(0xff168C4B),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.zero,
                                  topRight: Radius.circular(16),
                                  bottomLeft: Radius.circular(16),
                                  bottomRight: Radius.circular(16),
                                ),
                              ),
                              child: const Text(
                                'Hey! Have you ever thought about how random '
                                'moments can sometimes turn into the best '
                                'memories? It\u2019s like the universe loves '
                                'to surprise us when we least expect it!',
                                style: TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),

                        // ---------- message 4 : image ----------
                        Padding(
                          padding: const EdgeInsets.only(right: 70, bottom: 12),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 10),
                              decoration: const BoxDecoration(
                                color: Color(0xff168C4B),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.zero,
                                  topRight: Radius.circular(16),
                                  bottomLeft: Radius.circular(16),
                                  bottomRight: Radius.circular(16),
                                ),
                              ),
                              // replace this Container with
                              // Image.asset('assets/images/route_logo.png')
                              // after exporting it from figma
                              child: Container(
                                width: 200,
                                height: 110,
                                alignment: const Alignment(0, 0),
                                decoration: BoxDecoration(
                                  color: const Color(0xffFFFFFF),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Text(
                                  'Route',
                                  style: TextStyle(
                                    color: Color(0xff168C4B),
                                    fontSize: 34,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        // ---------- message 5 : outgoing ----------
                        Padding(
                          padding: const EdgeInsets.only(left: 70, bottom: 12),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 10),
                              decoration: const BoxDecoration(
                                color: Color(0xff232D36),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.zero,
                                  bottomLeft: Radius.circular(16),
                                  bottomRight: Radius.circular(16),
                                ),
                              ),
                              child: const Text(
                                'what a Great Content Tp learn Flutter',
                                style: TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // ---------------- INPUT BAR ----------------
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          style: const TextStyle(
                            color: Color(0xffFFFFFF),
                            fontSize: 14,
                          ),
                          cursorColor: const Color(0xff168C4B),
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 14),
                            hintText: 'Type a Message ...',
                            hintStyle: const TextStyle(
                              color: Color(0xffFFFFFF),
                              fontSize: 12,
                            ),
                            prefixIcon: const Icon(
                              Icons.camera_alt_outlined,
                              color: Color(0xffFFFFFF),
                              size: 22,
                            ),
                            suffixIcon: const Icon(
                              Icons.send,
                              color: Color(0xffFFFFFF),
                              size: 22,
                            ),
                            // the three states need the same border,
                            // otherwise it turns blue when you tap the field
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: const BorderSide(
                                color: Color(0xff168C4B),
                                width: 1,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: const BorderSide(
                                color: Color(0xff168C4B),
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: const BorderSide(
                                color: Color(0xff168C4B),
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      // the mic button
                      // width 48 with radius 24 = a circle
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: const Color(0xff168C4B),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.mic,
                            color: Color(0xffFFFFFF),
                            size: 22,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
