//
//  VisitsListViewController.h
//  VisitsList
//
//  Created by  mrhard on 29.10.2017.
//  Copyright © 2017 dirsha. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VisitsListScreenPresenter;

@interface VisitsListViewController : UIViewController

- (instancetype)initWithRootView:(UIView *)rootView presenter:(VisitsListScreenPresenter *)presenter;

@end
