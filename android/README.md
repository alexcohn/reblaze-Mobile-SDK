# ReblazeExampleApp
Reblaze mobile clients example app uses Reblaze SDK.

## Installation

To install the library in your own project you can take the `.arr` file (**reblaze-release.arr**) from **app/libs** folder
into your project libs folder. In your app gradle script add the following line in dependencies section:

    implementation(name:'reblaze-release', ext:'aar')

make sure you have implementation `fileTree(dir: 'libs', include: ['*.jar'])` inside the dependencies.

## Using the library.

Library got a main starting point to activate the SDK :

    reblaze.start(this, 
    	"<YOUR-APP-DOMAIN-HERE>", 
    	"<YOUR-SECRET-HERE>", 
    	"UserName",
    	"test@123.io");

this = the activity.
url for the developer account server 
developer secret.
unique key name 
unique key value.

Best practce is to have it on Main Activity. Keep note that reblaze class is static so you can call it from 
everywhere in the app. 

To send custom event you can use: 

    reblaze.sendEvent("ButtonClick") 

with event name.

## Testing

You can do testing using the unit testing or record your own esspresso test's recording using android studio.
The esspresso test resides in **`app/src/androidTest/MainActivityTest2`.** 

## Some notes about the code

The Library work's with a thread sending all events gathered from app including custom events 
to reblaze servers every 12 seconds untill calling `reblaze.Destroy()` which will end the session
and thread. Best practice is to put it in hosting app `onDestroy()` method.
