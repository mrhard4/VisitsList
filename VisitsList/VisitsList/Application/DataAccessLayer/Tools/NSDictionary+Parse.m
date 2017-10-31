//
// Created by  mrhard on 30.10.2017.
// Copyright (c) 2017 dirsha. All rights reserved.
//

#import "NSDictionary+Parse.h"
#import "NSObject+Cast.h"


@implementation NSDictionary (Parse)

- (NSString *)requiredStringForKey:(NSString *)key
{
    NSString *result = [NSString requiredCast:self[key]];
    return result == nil ? @"" : result;
}

- (NSNumber *)requiredNumberForKey:(NSString *)key
{
    NSNumber *result = [NSNumber requiredCast:self[key]];
    return result == nil ? @0 : result;
}

@end