//
// Created by  mrhard on 30.10.2017.
// Copyright (c) 2017 dirsha. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MapUI;
@class Organization;

NS_ASSUME_NONNULL_BEGIN

@interface MapPresenter : NSObject

@property (nonatomic, strong, nullable) Organization *selectedOrganization;
@property (nonatomic, copy) void (^selectOrganizationHandler)(Organization * _Nullable organization);

@property (nonatomic, copy) NSArray<Organization *> *organizations;

- (instancetype)initWithUI:(id<MapUI>)ui;

@end

NS_ASSUME_NONNULL_END