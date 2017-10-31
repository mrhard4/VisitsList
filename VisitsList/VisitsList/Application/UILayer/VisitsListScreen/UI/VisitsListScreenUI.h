//
//  VisitsListScreenUI.h
//  VisitsList
//
//  Created by  mrhard on 29.10.2017.
//  Copyright © 2017 dirsha. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol VisitListUI;
@protocol MapUI;

@protocol VisitsListScreenUI

@property(nonatomic, strong, readonly) id<VisitListUI> listUI;
@property(nonatomic, strong, readonly) id<MapUI> mapUI;

@property(nonatomic, copy) void (^repeatHandler)(void);

- (void)setRepeatState;

@end
