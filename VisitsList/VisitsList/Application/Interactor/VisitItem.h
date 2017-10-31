//
// Created by  mrhard on 30.10.2017.
// Copyright (c) 2017 dirsha. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Visit;
@class Organization;


@interface VisitItem : NSObject

@property (nonatomic, strong, readonly) Visit *visit;
@property (nonatomic, strong, readonly) Organization *organization;

- (instancetype)initWithVisit:(Visit *)visit organization:(Organization *)organization;

@end