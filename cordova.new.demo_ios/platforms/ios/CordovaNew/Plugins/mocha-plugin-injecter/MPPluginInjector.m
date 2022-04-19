//
//  MPPluginInjector.m
//  TestCustomCDV
//
//  Created by YYLittleCat on 2017/1/24.
//  Copyright © 2017年 YYLittleCat. All rights reserved.
//

#import "MPPluginInjector.h"
#import "PluginInjectorImpl.h"

@implementation MPPluginInjector {
    PluginInjectorImpl *injectorImpl;
}

- (void)pluginInitialize {
    [super pluginInitialize];


    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(fff)
                                                 name:CDVPageDidLoadNotification
                                               object:nil];

    injectorImpl = [[PluginInjectorImpl alloc] init];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)fff {
    [self doReset];
}

- (void)doReset {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [injectorImpl injectPluginsIntoWebView:self.webViewEngine];
    });
}

- (void)onReset {
//    [self doReset];
}

@end
