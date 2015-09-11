//
//  ViewController.m
//  KeyboardDock
//
//  Created by MaJixian on 9/10/15.
//  Copyright (c) 2015 MaJixian. All rights reserved.
//

#import "ViewController.h"

#define INPUTVIEW_ORIGINAL_HEIGHT 44.0f

@interface ViewController ()<UITextViewDelegate>

@end

@implementation ViewController
{
    DockBar *customizedDockBar;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /* Load the customized dock view and pass first responder to containerView(who has its own inputAccessoryView). Then set the delegate of textView inside dock view to be current view controller */
    
    customizedDockBar = [[DockBar alloc]initWithTextViewDelegateController:self];
    self.containerView.dockBarView = customizedDockBar;
    [self.containerView becomeFirstResponder];
    
    /* Add tap gesture recognizer to implement tap dismiss keyboard action */
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapToDismissKeyboard)];
    [self.tableView addGestureRecognizer:tap];
}

- (void)tapToDismissKeyboard
{
    [customizedDockBar.inputTextView resignFirstResponder];
}

- (void)textViewDidChange:(UITextView *)textView
{
    /* This text view delegate is for text view inside dock view. This step is to realize dock view and text view's growth with content inside. In iOS8.0, a private height constraint is set to inputAccessoryView, we cannot remove this constraint but we can change value of this constraint to adjust growing text view */
    
    CGRect frame = textView.frame;
    frame.size.height = textView.contentSize.height;
    
    NSLayoutConstraint *constraint = [[self.containerView.inputAccessoryView constraints] objectAtIndex:0];
    NSLog(@"constraint:%f",constraint.constant);
    CGRect viewFrame = customizedDockBar.frame;
    viewFrame.size.height = frame.size.height;
    if (viewFrame.size.height >= INPUTVIEW_ORIGINAL_HEIGHT)
    {
        [UIView animateWithDuration:0.2 animations:^{
            constraint.constant = viewFrame.size.height;
        } completion:^(BOOL finished) {
            customizedDockBar.frame = viewFrame;
            [self.containerView reloadInputViews];
        }];
    }
    else
    {
        viewFrame.size.height =  INPUTVIEW_ORIGINAL_HEIGHT;
        [UIView animateWithDuration:0.2 animations:^{
            constraint.constant = viewFrame.size.height;
        } completion:^(BOOL finished) {
            customizedDockBar.frame = viewFrame;
            [self.containerView reloadInputViews];
        }];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
