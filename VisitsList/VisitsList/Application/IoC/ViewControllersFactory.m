//
//  ViewControllersFactory.m
//  VisitsList
//
//  Created by  mrhard on 30.10.2017.
//  Copyright © 2017 dirsha. All rights reserved.
//

#import "ViewControllersFactory.h"
#import "VisitsListViewController.h"
#import "VisitsListView.h"
#import "VisitsListScreenPresenter.h"
#import "PresentersFactory.h"
#import "ErrorPresenter.h"

@implementation ViewControllersFactory
{
    PresentersFactory *_presentersFactory;
}

- (instancetype)initWithPresentersFactory:(PresentersFactory *)presentersFactory
{
    self = [super init];
    
    _presentersFactory = presentersFactory;
    
    return self;
}

- (UIViewController *)makeVisitsListViewController
{
    ErrorPresenterImpl *errorPresenter = [[ErrorPresenterImpl alloc] init];
    VisitsListView *ui = [[VisitsListView alloc] initWithFrame:UIScreen.mainScreen.bounds];
    VisitsListScreenPresenter *presenter = [_presentersFactory makeVisitsListScreenPresenterWithUI:ui errorPresenter:errorPresenter];
    VisitsListViewController *result = [[VisitsListViewController alloc] initWithRootView:ui presenter:presenter];
    errorPresenter.parentViewController = result;
    return result;
}

@end
