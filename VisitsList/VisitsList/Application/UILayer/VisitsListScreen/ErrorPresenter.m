//
// Created by  mrhard on 30.10.2017.
// Copyright (c) 2017 dirsha. All rights reserved.
//

#import "ErrorPresenter.h"

@import UIKit;


@implementation ErrorPresenterImpl

- (instancetype)init
{
    self = [super init];

    return self;
}

- (void)showErrorWithText:(NSString *)text okHandler:(void (^)(void))okHandler repeatHandler:(void (^)(void))repeatHandler
{
    assert( nil != self.parentViewController );

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:text preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action)
    {
        okHandler();
    }]];
    UIAlertAction *repeatAction = [UIAlertAction actionWithTitle:@"Repeat" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
    {
        repeatHandler();
    }];
    [alertController addAction:repeatAction];
    alertController.preferredAction = repeatAction;

    [self.parentViewController presentViewController:alertController animated:YES completion:nil];
}

@end