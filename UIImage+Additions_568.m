//
//  UIImage+Additions_568.m
//  Qurate
//
//  Created by Igor Fedorov on 10/13/12.
//  Copyright (c) 2012 Igor Fedorov. All rights reserved.
//

#import "UIImage+Additions_568.h"
#import <objc/runtime.h>

#define kTallSuffix @"-568h@2x"

@implementation UIImage (Additions_568)

+ (UIImage *)imageNamed_patched:(NSString *)name {
    
    if ([name length] > 0 && UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        if ([name rangeOfString:kTallSuffix].location == NSNotFound && ([UIScreen mainScreen].bounds.size.height * [UIScreen mainScreen].scale) >= 1136.0f)
        {
            //Check if is there a path extension or not
            NSString *testName = name;
            if (testName.pathExtension.length > 0) {
                testName = [[[testName stringByDeletingPathExtension] stringByAppendingString:kTallSuffix] stringByAppendingPathExtension:[name pathExtension]];
            } else {
                testName = [testName stringByAppendingString:kTallSuffix @".png"];
            }
            
            UIImage *image = [UIImage imageNamed_patched:testName];
            if (image) {
                return [self imageWithCGImage:image.CGImage scale:2.0f orientation:image.imageOrientation];
            }
        }
    }
    
    return [self imageNamed_patched:name];
    
}

+ (void)patchImageNamedToSupport568Resources
{
    Method origMethod = class_getClassMethod([UIImage class], @selector(imageNamed:));
    Method newMethod = class_getClassMethod([UIImage class], @selector(imageNamed_patched:));
    method_exchangeImplementations(origMethod, newMethod);
}

@end
