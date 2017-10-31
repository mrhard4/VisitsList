//
// Created by  mrhard on 30.10.2017.
// Copyright (c) 2017 dirsha. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol VisitListUI <NSObject>

@property(nonatomic, copy, nullable) NSString *selectedOrganizationId;

- (void)beginConstruction;
- (void)addItemWithTitle:(NSString *)title
                subtitle:(NSString *)subtitle
          organizationId:(NSString *)organizationId
      deselectionHandler:(void (^)(void))deselectionHandler
        selectionHandler:(void (^)(void))selectionHandler;
- (void)endConstruction;

@end

NS_ASSUME_NONNULL_END