//
//  VisitsListViewController.m
//  VisitsList
//
//  Created by  mrhard on 29.10.2017.
//  Copyright © 2017 dirsha. All rights reserved.
//

#import "VisitsListViewController.h"

@interface VisitsListViewController ()

@end

@implementation VisitsListViewController
{
    UIView *_rootView;
    VisitsListScreenPresenter *_presenter;
}

- (instancetype)initWithRootView:(UIView *)rootView presenter:(VisitsListScreenPresenter *)presenter
{
    self = [super init];
    
    _rootView = rootView;
    _presenter = presenter;
    
    return self;
}

- (void)loadView
{
    self.view = _rootView;
}

@end
