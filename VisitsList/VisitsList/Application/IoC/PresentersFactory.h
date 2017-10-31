//
//  PresentersFactory.h
//  VisitsList
//
//  Created by  mrhard on 30.10.2017.
//  Copyright © 2017 dirsha. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol VisitsListScreenUI;

@class ServicesContainer;
@class VisitsListScreenPresenter;
@protocol ErrorPresenter;

@interface PresentersFactory : NSObject

- (instancetype)initWithServicesContainer:(ServicesContainer *)servicesContainer;

- (VisitsListScreenPresenter *)makeVisitsListScreenPresenterWithUI:(id<VisitsListScreenUI>)ui errorPresenter:(id<ErrorPresenter>)errorPresenter;

@end
