//
//  DockView.h
//  KeyboardDock
//
//  Created by MaJixian on 9/10/15.
//  Copyright (c) 2015 MaJixian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DockBar : UIView

@property(strong,nonatomic) UITextView *inputTextView;
@property(strong,nonatomic) UIButton *inputSendBtn;
@property float bgTextViewGap;

- (id)initWithTextViewDelegateController:(id)delegateController;

@end
