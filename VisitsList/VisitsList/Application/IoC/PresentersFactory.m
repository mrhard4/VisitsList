//
//  PresentersFactory.m
//  VisitsList
//
//  Created by  mrhard on 30.10.2017.
//  Copyright © 2017 dirsha. All rights reserved.
//

#import "PresentersFactory.h"
#import "ServicesContainer.h"
#import "VisitsListScreenPresenter.h"
#import "ErrorPresenter.h"

@implementation PresentersFactory
{
    ServicesContainer *_servicesContainer;
}

- (instancetype)initWithServicesContainer:(ServicesContainer *)servicesContainer
{
    self = [super init];
    
    _servicesContainer = servicesContainer;
    
    return self;
}

- (VisitsListScreenPresenter *)makeVisitsListScreenPresenterWithUI:(id<VisitsListScreenUI>)ui errorPresenter:(id<ErrorPresenter>)errorPresenter
{
    return [[VisitsListScreenPresenter alloc] initWithUI:ui interactor:_servicesContainer.visitsListInteractor errorPresenter:errorPresenter];
}

@end
