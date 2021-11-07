# Reblaze example in Flutter

Demonstrates how to use the Reblaze Fluter plugin in your app.

In `pubspec.yaml` you can see how to specify dependency to local plugin. 
Please note that the plugin depends, in its turn, on the native Mobile SDK. 
The structure of the whole `libs` folder should not be changed:  

In `main.dart` you can see how to programmatically configure the reblaze SDK,
how to turn on mocking mode that allows to experiment with the SDK without
server connection, and how the `rbzsdk` header is applied to requests.