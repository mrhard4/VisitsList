//
// Created by  mrhard on 30.10.2017.
// Copyright (c) 2017 dirsha. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Organization : NSObject

@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *organizationId;
@property (nonatomic, readonly) double latitude;
@property (nonatomic, readonly) double longitude;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

+ (NSArray<Organization *> *)parse:(NSArray<NSDictionary *> *)visitsDict;

@end