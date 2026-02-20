What I Learned
Building a Real Music Player UI
Understanding Flutter’s Layout System

How Column, Row, and Padding shape the UI structure

Why Center and ConstrainedBox keep the layout visually balanced

How to create a responsive album art using MediaQuery

Using clamp() to prevent oversized widgets on large screens

The difference between fixed sizing and responsive sizing

Interactive Widgets and Gestures

How GestureDetector turns icons and containers into interactive buttons

How to build a custom circular play button with shadows and decoration

Understanding the difference between simple icons vs. wrapped touch targets

Avoiding mistakes like:

placing logic inside the wrong button

using StatelessWidget for interactive UI

forgetting to rebuild UI after changing playback state

Implementing Audio Playback

How to load and play an audio file with the just_audio package

Initializing the AudioPlayer in initState()

Properly disposing the player to avoid memory leaks

Using:

play()

pause()

seek()

setAsset()

Fixing common issues:

incorrect asset paths

assets not declared in pubspec.yaml

unsupported filenames on Flutter Web

assets requiring a full restart

Using Streams for Real-Time UI Updates

Understanding positionStream and how it updates the slider

Why StreamBuilder is required for continuous playback updates

How to convert a Duration into seconds for slider values

Synchronizing slider dragging with audio seeking

Avoiding common mistakes:

using setState for slider updates

defining variables outside the StreamBuilder

mismatched slider min/max values

Formatting Time & Displaying Progress

Building a reusable _formatTime() helper

Converting seconds to mm:ss format

Displaying current time vs. total duration

Keeping timestamps aligned using MainAxisAlignment.spaceBetween

Handling Assets Properly

Organizing a clean assets/ folder for images and audio

Understanding how Flutter bundles assets on Web

Ensuring correct indentation in pubspec.yaml

Avoiding:

special characters in filenames

nested asset paths (assets/assets/)

hot reload when adding new assets (requiring full restart)

Screen Structure & Clean Code Architecture

Keeping logic and UI inside a StatefulWidget where necessary

Placing audio initialization in initState()

Using helper methods for clarity (_loadAudio(), _formatTime())

Writing readable, maintainable Flutter UI code

Maintaining a clean, scalable file structure
