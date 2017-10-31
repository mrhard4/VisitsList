//
// Created by  mrhard on 30.10.2017.
// Copyright (c) 2017 dirsha. All rights reserved.
//

#import "Organization.h"
#import "NSDictionary+Parse.h"


@implementation Organization

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];

    _title = [dictionary requiredStringForKey:@"title"];
    _organizationId = [dictionary requiredStringForKey:@"organizationId"];
    _latitude = [[dictionary requiredNumberForKey:@"latitude"] doubleValue];
    _longitude = [[dictionary requiredNumberForKey:@"longitude"] doubleValue];

    return self;
}

- (NSUInteger)hash
{
    return [_organizationId hash];
}

- (BOOL)isEqual:(id)object
{
    if (nil == object || ![object isMemberOfClass:[self class]])
    {
        return NO;
    }
    Organization *otherOrganization = object;
    return [self.organizationId isEqualToString:otherOrganization.organizationId];
}

+ (NSArray<Organization *> *)parse:(NSArray<NSDictionary *> *)visitsDict
{
    NSMutableArray *result = [NSMutableArray new];
    for (NSDictionary *visitDict in visitsDict)
    {
        Organization *organization = [[self alloc] initWithDictionary:visitDict];
        [result addObject:organization];
    }
    return [result copy];
}

@end