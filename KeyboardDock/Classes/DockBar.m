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
    
    self.inputTextView = [[UITextView alloc]initWithFrame:CGRectMake(8, 8, CGRectGetWidth(screen) - 60, 33)];
    [self.inputTextView.layer setBorderColor:[[[UIColor grayColor] colorWithAlphaComponent:0.5] CGColor]];
    [self.inputTextView.layer setBorderWidth:0.5f];
    self.inputTextView.layer.cornerRadius = 5;
    self.inputTextView.clipsToBounds = YES;
    [self.inputTextView setBackgroundColor:[UIColor whiteColor]];
    [self.inputTextView setFont:[UIFont systemFontOfSize:17.0f]];
    self.inputTextView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin;
    self.inputTextView.delegate = delegateController;
    
    self.inputSendBtn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetWidth(screen) - 46, 8, 46, 33)];
    [self.inputSendBtn setTitle:@"Send" forState:UIControlStateNormal];
    [self.inputSendBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.inputSendBtn.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    [self.inputSendBtn setBackgroundColor:[UIColor whiteColor]];
    [self.inputSendBtn addTarget:delegateController action:@selector(btnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.dockBar = [[DockBar alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(screen), 44.0f)];
    [self.dockBar setBackgroundColor:[UIColor whiteColor]];
    self.dockBar.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.dockBar.layer.borderWidth = 0.5f;
    [self.dockBar addSubview:self.inputTextView];
    [self.dockBar addSubview:self.inputSendBtn];
    
    self.bgTextViewGap = self.dockBar.frame.size.height - self.dockBar.frame.size.height;

    return self.dockBar;
}

- (void)btnOnClick:(id)sender
{
    NSLog(@"Btn clicked.");
}

@end
