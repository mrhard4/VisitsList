//
//  ServicesContainer.h
//  VisitsList
//
//  Created by  mrhard on 30.10.2017.
//  Copyright © 2017 dirsha. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol VisitsListInteractor;

@interface ServicesContainer : NSObject

@property (nonatomic, strong, readonly) id<VisitsListInteractor> visitsListInteractor;

- (instancetype)init;

@end
