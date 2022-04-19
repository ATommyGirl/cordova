//
//  PluginInjectorImpl.m
//  TestCustomCDV
//
//  Created by YYLittleCat on 2017/1/24.
//  Copyright © 2017年 YYLittleCat. All rights reserved.
//

#import "PluginInjectorImpl.h"
#import <Cordova/CDVWebViewEngineProtocol.h>

@implementation PluginInjectorImpl

- (void)injectJavascriptString:(NSString*)resource intoWebView:(id<CDVWebViewEngineProtocol>)webViewEngine {
    [webViewEngine evaluateJavaScript:resource completionHandler:^(id retObj, NSError *error) {
        
    }];
}

- (void)injectJavascriptFile:(NSString*)resource intoWebView:(id<CDVWebViewEngineProtocol>)webViewEngine {
    NSString *jsPath = [[NSBundle mainBundle] pathForResource:resource ofType:@"js"];
    NSString *jsStr = [NSString stringWithContentsOfFile:jsPath encoding:NSUTF8StringEncoding error:NULL];
    [self injectJavascriptString:jsStr intoWebView:webViewEngine];
}


- (NSArray*)parseCordovaPlugins{
    NSString *jsPath = [[NSBundle mainBundle] pathForResource:@"www/cordova_plugins" ofType:@"js"];
    NSString *js = [NSString stringWithContentsOfFile:jsPath encoding:NSUTF8StringEncoding error:NULL];
    NSScanner *scanner = [NSScanner scannerWithString:js];
    [scanner scanUpToString:@"[" intoString:nil];
    NSString *substring = nil;
    [scanner scanUpToString:@"];" intoString:&substring];
    substring = [NSString stringWithFormat:@"%@]", substring];

    NSError* localError;
    NSData* data = [substring dataUsingEncoding:NSUTF8StringEncoding];
    NSArray* pluginObjects = [NSJSONSerialization JSONObjectWithData:data options:0 error:&localError];
    return pluginObjects;
}

- (void)injectPluginsIntoWebView:(id<CDVWebViewEngineProtocol>)webViewEngine {

    NSArray* pluginObjects = [self parseCordovaPlugins];

    NSLog(@"injecting cordova %@", pluginObjects);

    [self injectJavascriptFile:@"www/cordova" intoWebView:webViewEngine];
    [self injectJavascriptFile:@"www/cordova_plugins" intoWebView:webViewEngine];

    for (NSDictionary* pluginParameters in pluginObjects) {
        NSString* file = pluginParameters[@"file"];
        NSString* path = [NSString stringWithFormat:@"www/%@", file];
        NSLog(@"Injecting %@", path);
        path = [path stringByDeletingPathExtension];
        [self injectJavascriptFile:path intoWebView:webViewEngine];
    }
}

@end
