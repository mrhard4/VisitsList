//
//  RequestService.m
//  VisitsList
//
//  Created by  mrhard on 29.10.2017.
//  Copyright © 2017 dirsha. All rights reserved.
//

#import "RequestService.h"
#import "Visit.h"
#import "Organization.h"
#import "NSObject+Cast.h"

@import AFNetworking;

@interface NSURLSessionDataTask (Request)<Request>

@end

@implementation NSURLSessionDataTask (Request)

@end

@implementation RequestService
{
    AFHTTPSessionManager *sessionManager;
}

- (instancetype)initWithEndpoint:(NSString *)endPoint
{
    self = [super init];
    
    sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:endPoint]];
    
    return self;
}

- (id<Request>)requestVisitsWithCompletion:(void (^)(NSArray<Visit *> *visits, NSError *error))completion
{
    return [self arrayGetRequestWithPath:@"getVisitsListTest" completion:^(NSArray<NSDictionary *> *result, NSError *error)
    {
        NSArray *visits = nil;
        if (nil != result)
        {
            visits = [Visit parse:result];
        }
        completion(visits, error);
    }];
}

- (id<Request>)requestOrganizationsWithCompletion:(void (^)(NSArray<Organization *> *organizations, NSError *error))completion
{
    return [self arrayGetRequestWithPath:@"getOrganizationListTest" completion:^(NSArray<NSDictionary *> *result, NSError *error)
    {
        NSArray *organizations = nil;
        if (nil != result)
        {
            organizations = [Organization parse:result];
        }
        completion(organizations, error);
    }];
}

- (id<Request>)arrayGetRequestWithPath:(NSString *)path completion:(void (^)(NSArray<NSDictionary *> *result, NSError *error))completion
{
    return [sessionManager GET:path
                    parameters:nil
                      progress:nil
                       success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
                       {
                           completion([NSArray requiredCast:responseObject], nil);

                       }
                       failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
                       {
                           completion(nil, error);
                       }];
}

@end
