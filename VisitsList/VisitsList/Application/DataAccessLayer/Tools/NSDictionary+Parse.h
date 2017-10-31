//
// Created by  mrhard on 30.10.2017.
// Copyright (c) 2017 dirsha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Parse)

- (NSString *)requiredStringForKey:(NSString *)key;
- (NSNumber *)requiredNumberForKey:(NSString *)key;

@end