//
//  Generated file. Do not edit.
//

// clang-format off

#import "GeneratedPluginRegistrant.h"

#if __has_include(<appcheck/AppcheckPlugin.h>)
#import <appcheck/AppcheckPlugin.h>
#else
@import appcheck;
#endif

#if __has_include(<external_app_launcher/LaunchexternalappPlugin.h>)
#import <external_app_launcher/LaunchexternalappPlugin.h>
#else
@import external_app_launcher;
#endif

#if __has_include(<file_picker/FilePickerPlugin.h>)
#import <file_picker/FilePickerPlugin.h>
#else
@import file_picker;
#endif

#if __has_include(<flutter_archive/FlutterArchivePlugin.h>)
#import <flutter_archive/FlutterArchivePlugin.h>
#else
@import flutter_archive;
#endif

#if __has_include(<flutter_statusbarcolor_ns/FlutterStatusbarcolorPlugin.h>)
#import <flutter_statusbarcolor_ns/FlutterStatusbarcolorPlugin.h>
#else
@import flutter_statusbarcolor_ns;
#endif

#if __has_include(<image_picker_ios/FLTImagePickerPlugin.h>)
#import <image_picker_ios/FLTImagePickerPlugin.h>
#else
@import image_picker_ios;
#endif

#if __has_include(<path_provider_ios/FLTPathProviderPlugin.h>)
#import <path_provider_ios/FLTPathProviderPlugin.h>
#else
@import path_provider_ios;
#endif

#if __has_include(<receive_sharing_intent/ReceiveSharingIntentPlugin.h>)
#import <receive_sharing_intent/ReceiveSharingIntentPlugin.h>
#else
@import receive_sharing_intent;
#endif

#if __has_include(<receive_whatsapp_chat/ReceiveWhatsappChatPlugin.h>)
#import <receive_whatsapp_chat/ReceiveWhatsappChatPlugin.h>
#else
@import receive_whatsapp_chat;
#endif

#if __has_include(<shared_preferences_ios/FLTSharedPreferencesPlugin.h>)
#import <shared_preferences_ios/FLTSharedPreferencesPlugin.h>
#else
@import shared_preferences_ios;
#endif

#if __has_include(<url_launcher_ios/FLTURLLauncherPlugin.h>)
#import <url_launcher_ios/FLTURLLauncherPlugin.h>
#else
@import url_launcher_ios;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [AppcheckPlugin registerWithRegistrar:[registry registrarForPlugin:@"AppcheckPlugin"]];
  [LaunchexternalappPlugin registerWithRegistrar:[registry registrarForPlugin:@"LaunchexternalappPlugin"]];
  [FilePickerPlugin registerWithRegistrar:[registry registrarForPlugin:@"FilePickerPlugin"]];
  [FlutterArchivePlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterArchivePlugin"]];
  [FlutterStatusbarcolorPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterStatusbarcolorPlugin"]];
  [FLTImagePickerPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTImagePickerPlugin"]];
  [FLTPathProviderPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTPathProviderPlugin"]];
  [ReceiveSharingIntentPlugin registerWithRegistrar:[registry registrarForPlugin:@"ReceiveSharingIntentPlugin"]];
  [ReceiveWhatsappChatPlugin registerWithRegistrar:[registry registrarForPlugin:@"ReceiveWhatsappChatPlugin"]];
  [FLTSharedPreferencesPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTSharedPreferencesPlugin"]];
  [FLTURLLauncherPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTURLLauncherPlugin"]];
}

@end
