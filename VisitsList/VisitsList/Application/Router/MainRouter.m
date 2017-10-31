//
// Created by  mrhard on 31.10.2017.
// Copyright (c) 2017 dirsha. All rights reserved.
//

#import "MainRouter.h"
#import "ServicesContainer.h"
#import "PresentersFactory.h"
#import "ViewControllersFactory.h"

@import UIKit;


@implementation MainRouter
{
    UIWindow *_window;
    ViewControllersFactory *_viewControllersFactory;
}

- (instancetype)init
{
    self = [super init];

    ServicesContainer *servicesContainer = [[ServicesContainer alloc] init];
    PresentersFactory *presentersFactory = [[PresentersFactory alloc] initWithServicesContainer:servicesContainer];
    _viewControllersFactory = [[ViewControllersFactory alloc] initWithPresentersFactory:presentersFactory];

    return self;
}

- (void)activate
{
    _window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    _window.rootViewController = [_viewControllersFactory makeVisitsListViewController];
    [_window makeKeyAndVisible];
}

@end