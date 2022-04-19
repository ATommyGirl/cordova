//
//  PluginInjectorImpl.h
//  TestCustomCDV
//
//  Created by YYLittleCat on 2017/1/24.
//  Copyright © 2017年 YYLittleCat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cordova/CDV.h>

@interface PluginInjectorImpl : NSObject

- (void)injectJavascriptString:(NSString*)resource
                   intoWebView:(id<CDVWebViewEngineProtocol>)webViewEngine;

- (void)injectJavascriptFile:(NSString*)resource
                 intoWebView:(id<CDVWebViewEngineProtocol>)webViewEngine;

- (void)injectPluginsIntoWebView:(id<CDVWebViewEngineProtocol>)webViewEngine;

@end
