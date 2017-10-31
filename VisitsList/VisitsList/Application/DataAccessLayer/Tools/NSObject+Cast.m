//
// Created by  mrhard on 30.10.2017.
// Copyright (c) 2017 dirsha. All rights reserved.
//

#import "NSObject+Cast.h"


@implementation NSObject (Cast)

+ (instancetype)requiredCast:(id)object
{
    assert( nil != object );
    if ([object isKindOfClass:[self class]])
    {
        return object;
    }
    assert(false);
    return nil;
}

@end