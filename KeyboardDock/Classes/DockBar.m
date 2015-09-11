//
//  DockView.m
//  KeyboardDock
//
//  Created by MaJixian on 9/10/15.
//  Copyright (c) 2015 MaJixian. All rights reserved.
//

#import "DockBar.h"

@implementation DockBar

- (id)initWithTextViewDelegateController:(id)delegateController
{
    /* You may want to customize your own dock view here */
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    self.inputTextView = [[UITextView alloc]initWithFrame:CGRectMake(8, 8, 300, 33)];
    [self.inputTextView.layer setBorderColor:[[[UIColor grayColor] colorWithAlphaComponent:0.5] CGColor]];
    [self.inputTextView.layer setBorderWidth:0.5f];
    self.inputTextView.layer.cornerRadius = 5;
    self.inputTextView.clipsToBounds = YES;
    [self.inputTextView setBackgroundColor:[UIColor whiteColor]];
    [self.inputTextView setFont:[UIFont systemFontOfSize:17.0f]];
    self.inputTextView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin;
    self.inputTextView.delegate = delegateController;
        
    self.inputSendBtn = [[UIButton alloc] initWithFrame:CGRectMake(321, 8, 46, 33)];
    [self.inputSendBtn setTitle:@"Send" forState:UIControlStateNormal];
    [self.inputSendBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.inputSendBtn.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    [self.inputSendBtn setBackgroundColor:[UIColor whiteColor]];
    
    DockBar *dockBar = [[DockBar alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(screen), 44.0f)];
    [dockBar setBackgroundColor:[UIColor whiteColor]];
    dockBar.layer.borderColor = [UIColor lightGrayColor].CGColor;
    dockBar.layer.borderWidth = 0.5f;
    [dockBar addSubview:self.inputTextView];
    [dockBar addSubview:self.inputSendBtn];
    
    self.bgTextViewGap = dockBar.frame.size.height - dockBar.frame.size.height;

    return dockBar;
}

@end
