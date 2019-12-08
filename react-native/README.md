# react-native-reblaze-sdk

## Getting started

### Manual installation

#### ios

download all files from repository follow to manual linking from here : https://facebook.github.io/react-native/docs/linking-libraries-ios

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNReblazeReactNativeSdkPackage;` to the imports at the top of the file
  - Add `new RNReblazeReactNativeSdkPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:

    include ':reblaze-sdk'
    project(':react-native-reblaze-react-native-sdk').projectDir = new File(
      rootProject.projectDir,   
      '../node_modules/react-native-reblaze-react-native-sdk/android')

 
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:

    compile project(':react-native-reblaze-react-native-sdk') 
  	include ':react-native-reblaze-react-native-sdk'
  	project(':react-native-reblaze-react-native-sdk').projectDir = new File(
      rootProject.projectDir, 	
      '../node_modules/react-native-reblaze-react-native-sdk/android')
 
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:

    compile project(':re-sdk') 

4. Also add those lines to `android/app/build.gradle`:

    allprojects {
    repositories {
        mavenLocal()
        google()
        jcenter()
        maven {
            // All of React Native (JS, Obj-C sources, Android binaries) is installed from npm
            url "$rootDir/../node_modules/react-native/android"
        }
        flatDir {
            dirs project(':reblaze-sdk').file('reblaze-release') // Reblaze Added line for grafle to find the compiled library
        }
     } }
  
5. in the javascript file index.js (app) add this line : 

```javascript
  AppRegistry.registerComponent('RNReblazeReactNativeSDK', () => App);
```

## Usage
```javascript
  import reblaze from 'reblaze-sdk';
```
to start the SDK :

```javascript
  reblaze.start("<YOUR-APP-DOMAIN-HERE>/", "<YOUR-SECRET-HERE>", "UserName","test@123.io");
```

to send any event : 

```javascript
  reblaze.sendEvent("ButtonClick");
```
