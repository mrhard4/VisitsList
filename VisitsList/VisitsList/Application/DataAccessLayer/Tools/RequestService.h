//
//  RequestService.h
//  VisitsList
//
//  Created by  mrhard on 29.10.2017.
//  Copyright © 2017 dirsha. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Visit;
@class Organization;

@protocol Request

- (void)cancel;

@end

@interface RequestService : NSObject

- (instancetype)initWithEndpoint:(NSString *)endPoint;

- (id<Request>)requestVisitsWithCompletion:(void (^)(NSArray<Visit *> *visits, NSError *error))completion;
- (id<Request>)requestOrganizationsWithCompletion:(void (^)(NSArray<Organization *> *organizations, NSError *error))completion;

@end
