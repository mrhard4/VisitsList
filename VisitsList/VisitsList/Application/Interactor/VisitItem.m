//
// Created by  mrhard on 30.10.2017.
// Copyright (c) 2017 dirsha. All rights reserved.
//

#import "VisitItem.h"
#import "Visit.h"
#import "Organization.h"


@implementation VisitItem

- (instancetype)initWithVisit:(Visit *)visit organization:(Organization *)organization
{
    self = [super init];

    _visit = visit;
    _organization = organization;

    return  self;
}

@end