//
//  VisitsListInteractor.m
//  VisitsList
//
//  Created by  mrhard on 30.10.2017.
//  Copyright © 2017 dirsha. All rights reserved.
//

#import "VisitsListInteractor.h"
#import "RequestService.h"
#import "VisitItem.h"
#import "Organization.h"
#import "Visit.h"

@implementation VisitsListInteractorImpl
{
    RequestService *_requestService;

    NSArray<Visit *> *_visits;
    NSArray<Organization *> *_organizations;

    id<Request> __weak _visitsRequest;
    id<Request> __weak _organizationsRequest;

    void (^_completion)(NSArray<VisitItem *> * _Nullable items, NSError * _Nullable error);
}

- (instancetype)initRequestService:(RequestService *)requestService
{
    self = [super init];

    _requestService = requestService;

    return self;
}

- (void)requestVisitsListWithCompletion:(void (^)(NSArray<VisitItem *> *items, NSError *error))completion
{
    _visits = nil;
    _organizations = nil;

    [self cancel];

    _completion = [completion copy];

    __typeof(self) __weak weakSelf = self;

    _visitsRequest = [_requestService requestVisitsWithCompletion:^(NSArray<Visit *> *visits, NSError *error)
    {
        [weakSelf didReceiveVisits:visits error:error];
    }];
    _organizationsRequest = [_requestService requestOrganizationsWithCompletion:^(NSArray<Organization *> *organizations, NSError *error)
    {
        [weakSelf didReceiveOrganizations:organizations error:error];
    }];
}

- (void)cancel
{
    _completion = nil;
    [_visitsRequest cancel];
    [_organizationsRequest cancel];
}

- (void)didReceiveVisits:(NSArray<Visit *> *)visits error:(NSError *)error
{
    _visits = visits;
    [self checkForResultWithError:error];
}

- (void)didReceiveOrganizations:(NSArray<Organization *> *)organizations error:(NSError *)error
{
    _organizations = organizations;
    [self checkForResultWithError:error];
}

- (void)checkForResultWithError:(NSError *)error
{
    if (nil == _completion)
    {
        return;
    }
    if (nil != error)
    {
        _completion(nil, error);
        [self cancel];
        return;
    }

    if(nil == _visits || nil == _organizations)
    {
        return;
    }

    _completion([self makeItems], nil);
}

- (NSArray<VisitItem *> *)makeItems
{
    NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity:_visits.count];

    for (Visit *visit in _visits)
    {
        Organization *organization = [self findOrganizationForVisit:visit];
        assert(nil != organization);
        if (nil != organization)
        {
            [result addObject:[[VisitItem alloc] initWithVisit:visit organization:organization]];
        }
    }

    return [result copy];
}

- (Organization *)findOrganizationForVisit:(Visit *)visit
{
    for (Organization *organization in _organizations)
    {
        if ([organization.organizationId isEqualToString:visit.organizationId])
        {
            return organization;
        }
    }
    return nil;
}

@end
