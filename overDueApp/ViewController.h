//
//  ViewController.h
//  overDueApp
//
//  Created by walidelzo on 9/1/18.
//  Copyright © 2018 walidelzo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddTaskViewController.h"
@interface ViewController : UIViewController<UITableViewDelegate,AddTaskViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)reOrderbarButtonAction:(UIBarButtonItem *)sender;
- (IBAction)addTaskBarButtonAction:(UIBarButtonItem *)sender;


@end

