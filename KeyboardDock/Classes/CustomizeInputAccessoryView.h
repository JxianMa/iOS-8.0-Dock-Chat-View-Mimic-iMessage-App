//
//  customizeInputAccessoryView.h
//  KeyboardDock
//
//  Created by MaJixian on 9/10/15.
//  Copyright (c) 2015 MaJixian. All rights reserved.
//
//
//   This class is required, in order to pass create customized inputAccessoryView.

#import <UIKit/UIKit.h>
#import "DockBar.h"

@interface CustomizeInputAccessoryView : UIView

@property(strong,nonatomic) UITextView *dockBarTextView;
@property(strong,nonatomic) DockBar *dockBarView;
@property float bgTextViewGap;


@end
