//
//  ViewController.h
//  KeyboardDock
//
//  Created by MaJixian on 9/10/15.
//  Copyright (c) 2015 MaJixian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "customizeInputAccessoryView.h"
#import "DockBar.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet CustomizeInputAccessoryView *containerView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

