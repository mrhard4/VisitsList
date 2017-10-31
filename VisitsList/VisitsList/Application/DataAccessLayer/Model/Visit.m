//
// Created by  mrhard on 30.10.2017.
// Copyright (c) 2017 dirsha. All rights reserved.
//

#import "Visit.h"
#import "NSDictionary+Parse.h"

@implementation Visit

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];

    _title = [dictionary requiredStringForKey:@"title"];
    _organizationId = [dictionary requiredStringForKey:@"organizationId"];

    return self;
}

+ (NSArray<Visit *> *)parse:(NSArray<NSDictionary *> *)visitsDict
{
    NSMutableArray *result = [NSMutableArray new];
    for (NSDictionary *visitDict in visitsDict)
    {
        Visit *visit = [[self alloc] initWithDictionary:visitDict];
        [result addObject:visit];
    }
    return [result copy];
}

@end