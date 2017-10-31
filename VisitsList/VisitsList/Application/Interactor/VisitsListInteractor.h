//
//  VisitsListInteractor.h
//  VisitsList
//
//  Created by  mrhard on 30.10.2017.
//  Copyright © 2017 dirsha. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RequestService;
@class VisitItem;

NS_ASSUME_NONNULL_BEGIN

@protocol VisitsListInteractor

- (void)requestVisitsListWithCompletion:(void (^)(NSArray<VisitItem *> * _Nullable items, NSError * _Nullable error))completion;

@end

@interface VisitsListInteractorImpl : NSObject<VisitsListInteractor>

- (instancetype)initRequestService:(RequestService *)requestService;

@end

NS_ASSUME_NONNULL_END