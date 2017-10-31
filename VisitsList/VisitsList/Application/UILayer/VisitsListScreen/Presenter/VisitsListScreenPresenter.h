//
//  VisitsListScreenPresenter.h
//  VisitsList
//
//  Created by  mrhard on 29.10.2017.
//  Copyright © 2017 dirsha. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol VisitsListScreenUI;
@protocol VisitsListInteractor;
@protocol ErrorPresenter;

@interface VisitsListScreenPresenter : NSObject

- (instancetype)initWithUI:(id<VisitsListScreenUI>)ui interactor:(id<VisitsListInteractor>)interactor errorPresenter:(id<ErrorPresenter>)errorPresenter;

@end
