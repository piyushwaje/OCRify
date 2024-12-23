# OCRify

OCRify is a powerful mobile application that converts images to text using cutting-edge Optical Character Recognition (OCR) technology. With OCRify, you can capture text from photos taken directly from your camera or images selected from your gallery. This project leverages Google's ML Kit for high-performance text recognition.

## Features

- **Image to Text Conversion**: Extract text from images in real time.
- **Camera Integration**: Snap a photo and instantly process the text.
- **Gallery Support**: Select images from your gallery for OCR processing.
- **ML Kit Powered**: Utilize Google's ML Kit for fast and accurate text recognition.

## Installation

Follow these steps to set up and run OCRify:

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Android Studio](https://developer.android.com/studio) or [Xcode](https://developer.apple.com/xcode/) for development and testing
- Google Firebase account with ML Kit enabled

### Steps

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-username/OCRify.git
   cd OCRify
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Set up Firebase**:
   - Create a Firebase project.
   - Enable ML Kit under "Machine Learning" in Firebase.
   - Download and add the `google-services.json` (Android) or `GoogleService-Info.plist` (iOS) file to the respective platforms.

4. **Run the app**:
   ```bash
   flutter run
   ```

## Usage

1. Open OCRify on your device.
2. Choose between:
   - **Camera**: Take a photo to extract text.
   - **Gallery**: Select an image from your photo library.
3. View the extracted text on the screen and copy or save it for later use.

## Technologies Used

- **Flutter**: For cross-platform development
- **Firebase**: Backend support and ML Kit integration
- **ML Kit**: OCR functionality



![Camera Screen](path/to/camera-screenshot.png)
![Text Extraction](path/to/text-extraction-screenshot.png)

## Roadmap

- [ ] Add multi-language support for OCR
- [ ] Implement text-to-speech for extracted text
- [ ] Add dark mode support
- [ ] Export extracted text as a file (e.g., .txt, .pdf)

## Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository.
2. Create a new branch for your feature or bug fix:
   ```bash
   git checkout -b feature-name
   ```
3. Commit your changes:
   ```bash
   git commit -m "Add feature-name"
   ```
4. Push to your branch:
   ```bash
   git push origin feature-name
   ```
5. Open a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

