//
//  ServicesContainer.m
//  VisitsList
//
//  Created by  mrhard on 30.10.2017.
//  Copyright © 2017 dirsha. All rights reserved.
//

#import "ServicesContainer.h"
#import "RequestService.h"
#import "VisitsListInteractor.h"

@implementation ServicesContainer
{
    RequestService *_requestService;
}

- (instancetype)init
{
    self = [super init];
    
    _requestService = [[RequestService alloc] initWithEndpoint:@"http://demo3526062.mockable.io"];

    _visitsListInteractor = [[VisitsListInteractorImpl alloc] initRequestService:_requestService];
    
    return self;
}

@end
