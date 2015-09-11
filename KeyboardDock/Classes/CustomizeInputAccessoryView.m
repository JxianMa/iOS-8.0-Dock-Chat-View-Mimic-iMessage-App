//
//  customizeInputAccessoryView.m
//  KeyboardDock
//
//  Created by MaJixian on 9/10/15.
//  Copyright (c) 2015 MaJixian. All rights reserved.
//

#import "CustomizeInputAccessoryView.h"

@implementation CustomizeInputAccessoryView

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (UIView *)inputAccessoryView
{
    return self.dockBarView;
}

@end
