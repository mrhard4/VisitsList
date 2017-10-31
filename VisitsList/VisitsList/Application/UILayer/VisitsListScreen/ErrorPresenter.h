//
// Created by  mrhard on 30.10.2017.
// Copyright (c) 2017 dirsha. All rights reserved.
//

#import <Foundation/Foundation.h>

@import UIKit;

@protocol ErrorPresenter

- (void)showErrorWithText:(NSString *)text okHandler:(void (^)(void))okHandler repeatHandler:(void (^)(void))repeatHandler;

@end

@interface ErrorPresenterImpl : NSObject<ErrorPresenter>

@property (nonatomic, weak) UIViewController *parentViewController;

- (instancetype)init;

@end