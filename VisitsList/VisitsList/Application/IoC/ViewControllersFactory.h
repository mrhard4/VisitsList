//
//  ViewControllersFactory.h
//  VisitsList
//
//  Created by  mrhard on 30.10.2017.
//  Copyright © 2017 dirsha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class PresentersFactory;

@interface ViewControllersFactory : NSObject

- (instancetype)initWithPresentersFactory:(PresentersFactory *)presentersFactory;

- (UIViewController *)makeVisitsListViewController;

@end
