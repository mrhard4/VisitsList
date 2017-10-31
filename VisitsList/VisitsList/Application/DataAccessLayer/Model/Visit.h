//
// Created by  mrhard on 30.10.2017.
// Copyright (c) 2017 dirsha. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Visit : NSObject

@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *organizationId;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

+ (NSArray<Visit *> *)parse:(NSArray<NSDictionary *> *)visitsDict;

@end