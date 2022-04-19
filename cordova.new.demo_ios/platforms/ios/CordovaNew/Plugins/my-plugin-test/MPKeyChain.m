//
//  MPKeyChain.m
//  MobilePortal
//
//  Created by YYLittleCat on 2018/6/5.
//  Copyright © 2018年 YYLittleCat. All rights reserved.
//

#import "MPKeyChain.h"

@implementation MPKeyChain

- (void)getValueForKey:(CDVInvokedUrlCommand *)command {
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"zhengyt"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
