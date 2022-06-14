Social Media Sign In - Google, Facebook, Apple



################## Facebook Login ##################
plugin => flutter_login_facebook: ^1.4.1

Facebook SDK version, used in plugin => iOS: ^12.3 (CocoaPods)
Android: ^12.3 (Maven)


Minimum OS requirement => iOS 10.0 and higher.
Android 4.1 and newer (SDK 16).

/***************Android setup********************/
- go to[developer account](https://developers.facebook.com/) and create a project.
- [Go to Facebook Login for Android - Quickstart page](https://developers.facebook.com/docs/facebook-login/android?locale=en_US#1--select-an-app-or-create-a-new-app)
- Skip Step 2 (Download the Facebook App) and Step 3 (Integrate the Facebook SDK).
- Add below values to /android/app/src/main/res/values/strings.xml (create file if it doesn't exist). Add facebook_app_id and facebook_client_token.

  <string name="facebook_app_id">YOUR_APP_ID</string>
  <string name="facebook_client_token">YOUR_CLIENT_ACCESS_TOKEN</string>

- How to get your App Id and Client Access Token:
  Sign into your [developer account](https://developers.facebook.com/)
  On the Apps page, select an app to open the dashboard for that app.
  On the Dashboard, navigate to Settings > Advanced > Security > Client token.
  On the Dashboard, navigate to Settings > Basic > App Id.

- Add below meta data inside applicatio bloc in android/app/src/main/AndroidManifest.xml

    <meta-data android:name="com.facebook.sdk.ApplicationId" android:value="@string/facebook_app_id"/>
    <meta-data android:name="com.facebook.sdk.ClientToken" android:value="@string/facebook_client_token"/>

-[Associate Your Package Name and Default Class with Your App.](https://developers.facebook.com/docs/facebook-login/android?locale=en_US#5--associate-your-package-name-and-default-class-with-your-app)
1. Set Package Name - your package name for Android application (attribute package in AndroidManifest.xml).
2. Set Default Activity Class Name - your main activity class (with package). By default it would be com.yourcompany.yourapp.MainActivity.
3. Click "Save".

-[Provide the Development and Release Key Hashes for Your App.](https://developers.facebook.com/docs/facebook-login/android?locale=en_US#6--provide-the-development-and-release-key-hashes-for-your-app)

- And that's it for Android.

/**************IOS setup******************/
- Go to [Facebook Login for iOS - Quickstart](https://developers.facebook.com/docs/facebook-login/ios)
- [Select an App or Create a New App](https://developers.facebook.com/docs/facebook-login/ios?locale=en_US#). If you've created an app during an Android setup than use it.
- [Register and Configure Your App with Facebook](https://developers.facebook.com/docs/facebook-login/ios?locale=en_US#3--register-and-configure-your-app-with-facebook)

    1. Add your Bundle Identifier - set Bundle ID (you can find it in Xcode: Runner - Target Runner - General, section Identity, field Bundle Identifier) and click "Save".
    2. Enable Single Sign-On for Your App if you need it and click "Save".

-[Configure Info.plist](ios/Runner/Info.plist). Add below bloc of code in Info.plist file. See full Info.plist in [example](https://github.com/Innim/flutter_login_facebook/blob/master/example/ios/Runner/Info.plist)
<key>CFBundleURLTypes</key>
<array>
<dict>
<key>CFBundleURLSchemes</key>
<array>
<string>fb[APP_ID]</string>
</array>
</dict>
</array>
<key>FacebookAppID</key>
<string>[APP_ID]</string>
<key>FacebookClientToken</key>
<string>[CLIENT_TOKEN]</string>
<key>FacebookDisplayName</key>
<string>[APP_NAME]</string>
<key>LSApplicationQueriesSchemes</key>
<array>
<string>fbapi</string>
<string>fbapi20130214</string>
<string>fbapi20130410</string>
<string>fbapi20130702</string>
<string>fbapi20131010</string>
<string>fbapi20131219</string>
<string>fbapi20140410</string>
<string>fbapi20140116</string>
<string>fbapi20150313</string>
<string>fbapi20150629</string>
<string>fbapi20160328</string>
<string>fbauth</string>
<string>fb-messenger-share-api</string>
<string>fbauth2</string>
<string>fbshareextension</string>
</array>

- [NOTE] Check if you already have CFBundleURLTypes or LSApplicationQueriesSchemes keys in your Info.plist. If you have, you should merge their values, instead of adding a duplicate key.
- And that's it for iOS.



################## Google Login ##################
- [register android and ios application in firebase console project](https://console.firebase.google.com)
- Now add the android and ios app in that firebase project and download google-service.json and GoogleService-Info.plist from android app and ios app respectively.
- add support email in a certain android and ios app in firebase project
- Make sure you've filled out all required fields in the console for [OAuth consent screen](https://console.cloud.google.com/apis/credentials/consent). Otherwise, you may encounter APIException errors.


/***************Android setup********************/

- add google-service.json to [my_project]/android/app directory

/***************IOS setup********************/

- Open Xcode, then right-click on Runner directory and select Add Files to "Runner".
- Select GoogleService-Info.plist from the file manager.
- A dialog will show up and ask you to select the targets, select the Runner target.
- Add below bloc of code in the [my_project]/ios/Runner/Info.plist file
  <key>CFBundleURLTypes</key>
  <array>
  <dict>
  <key>CFBundleTypeRole</key>
  <string>Editor</string>
  <key>CFBundleURLSchemes</key>
  <array>
    <!-- TODO Replace this value: -->
    <!-- Copied from GoogleService-Info.plist key REVERSED_CLIENT_ID -->
  <string>com.googleusercontent.apps.861823949799-vc35cprkp249096uujjn0vvnmcvjppkn</string>
  </array>
  </dict>
  </array>
- [NOTE] Check if you already have CFBundleURLTypes key in your Info.plist. If you have, you should merge their values, instead of adding a duplicate key.




################## Apple Login ##################

/***************IOS setup********************/

- Register an App ID. If you don't have one yet, [create a new one at](https://developer.apple.com/account/resources/identifiers/list/bundleId) following these steps:

    * Click "Register an App ID"
    * In the wizard select "App IDs", click "Continue"
    * Set the Description and Bundle ID, and select the Sign In with Apple capability
      Usually the default setting of "Enable as a primary App ID" should suffice here. If you ship multiple apps that should all share the same Apple ID credentials for your users, please consult the Apple documentation on how to best set these up.
    * Click "Continue", and then click "Register" to finish the creation of the App ID

- In case you already have an existing App ID that you want to use with Sign in with Apple:

    * Open that App ID from the list
    * Check the "Sign in with Apple" capability
    * Click "Save"

- Now [go to profile section](https://developer.apple.com/account/resources/profiles/list)
- If you don't have any profile than create new one and select the App Id which you have created earlier.
- If you already have profile than click on edit button of that profile certificate and select App Id in it and save it.
- Now download this certificate into your system.
- Open [my-project]/ios/Runner.xcworkspace in Xcode
- Under Runner (file browser side bar) -> Targets -> Runner -> Signing & Capabilities set the "Bundle Identifier" ("App ID") you have created in the Apple Developer Portal earlier
- Ensure that "Sign in with Apple" is listed under the capabilities (if not, add it via the +)


/**************Create Service ID************************/[For android setup]
-Go to your apple developer page then [Identifiers](https://developer.apple.com/account/resources/identifiers/list)" and follow these steps:
-Next [go to](https://developer.apple.com/account/resources/identifiers/list/serviceId) and follow these steps:

* Click "Register an Services ID"
* Select "Services IDs", click "Continue"
* Set your "Description" and "Identifier"
* The "Identifier" will later be referred to as your clientID
* Click "Continue" and then "Register"
* Now that the service is created, we have to enable it to be used for Sign in with Apple:

- Select the service from the list of services
- Check the box next to "Sign in with Apple", then click "Configure"
- In the Domains and Subdomains add the domains of the websites on which you want to use Sign in with Apple, e.g. example.com. You have to enter at least one domain here, even if you don't intend to use Sign in with Apple on any website.
- In the Return URLs box add the full return URL you want to use, e.g. [https://example.com/callbacks/sign_in_with_apple]
- Click "Next" and then "Done" to close the settings dialog
- Click "Continue" and then "Save" to update the service
- In order to communicate with Apple's servers to verify the incoming authorization codes from your app clients, you need to create a key at https://developer.apple.com/account/resources/authkeys/list:
- Click "Create a key"
- Set the "Key Name" (E.g. "Sign in with Apple key")
- Check the box next to "Sign in with Apple", then click "Configure" on the same row
- Under "Primary App ID" select the App ID of the app you want to use (either the newly created one or an existing one)
- Click "Save" to leave the detail view
- Click "Continue" and then click "Register"
- Now you'll see a one-time-only screen where you must download the key by clicking the "Download" button
- Also note the "Key ID" which will be used later when configuring the server


/**************Server Setup************************/[For android setup]
- The server part is usually integrated into your existing backends, and there are existing packages for most existing programming languages and web frameworks out there.
- In order to show how to build a complete example, we set up a example project on Glitch which offers simple and free hosting of a HTTPS-enabled web API, which is exactly what's needed here.
- To get started with the Glitch-based example go to the project's page at https://glitch.com/~flutter-sign-in-with-apple-example and click "Remix this". Now you have your own copy of the sample server!
- First select the .env file in the file browser on the left and put in your credentials (these will not be public, but only shared with invited collaborators).
- Then click on the "Share" button next to your avatar in the upper left, select "Live App" and copy the entry page URL (e.g. https://some-random-identifier.glitch.me).
- Now update the services you created earlier at https://developer.apple.com/account/resources/identifiers/list/serviceId to include the following URL under Return URLs: https://[YOUR-PROJECT-NAME].glitch.me/callbacks/sign_in_with_apple (replacing the name inside the []).
- After this is done, you can now proceed to integrate Sign in with Apple into the code of your Flutter app.

/***************Android setup********************/

- In your android/app/src/main/AndroidManifest.xml inside <application> add below bloc of code

  <activity android:name="com.aboutyou.dart_packages.sign_in_with_apple.SignInWithAppleCallback"
  android:exported="true">
  <intent-filter>
  <action android:name="android.intent.action.VIEW" />
  <category android:name="android.intent.category.DEFAULT" />
  <category android:name="android.intent.category.BROWSABLE" />

        <data android:scheme="signinwithapple" />
        <data android:path="callback" />
        </intent-filter>
    </activity>

- On the Sign in with Apple callback on your sever (specified in WebAuthenticationOptions.redirectUri), redirect safely back to your Android app using the following URL:
  [intent://callback?${PARAMETERS FROM CALLBACK BODY}]
