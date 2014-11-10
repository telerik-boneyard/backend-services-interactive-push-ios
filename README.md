Interactive Push Notifications Sample with Telerik Backend Services
=====================================

This application is a basic example of using Interactive Push Notifications provided by Telerik Backend Services.

###Requirements

- Registration in Telerik Backend Services
- The certificates required for APNS (Apple Push Notifications Service)
	

###Install
- Download  the ZIP from this repo.
- Open the **SwiftNotifications.xcodeproj**  file in Xcode.
- Set the **EverliveAPIKey**  value in the **AppDelegate.swift** file. The API key  can be found in the API Keys section in your Telerik Backend Services account. 
- Enable Push Notifications in Telerik Backend Services. Go to your project settings and in the Push Notifications section activate the push providers.
- Deploy the project to a mobile device and run it. ***Please note that push notifications will not work in simulator***.
- Send push notification with category field set to **MY_CATEGORY**
