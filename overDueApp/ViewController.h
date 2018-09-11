//
//  ViewController.h
//  overDueApp
//
//  Created by walidelzo on 9/1/18.
//  Copyright © 2018 walidelzo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddTaskViewController.h"
#import "DetailTaskViewController.h"
@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,AddTaskViewControllerDelegate,DetailTaskViewControllerDeleget>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)reOrderbarButtonAction:(UIBarButtonItem *)sender;
- (IBAction)addTaskBarButtonAction:(UIBarButtonItem *)sender;
@property (strong,nonatomic) NSMutableArray* AlltaskObjects;
@property(nonatomic)NSInteger  rowNumber;
@end

