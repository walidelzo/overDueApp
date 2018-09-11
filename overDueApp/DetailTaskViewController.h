//
//  DetailTaskViewController.h
//  overDueApp
//
//  Created by walidelzo on 9/1/18.
//  Copyright © 2018 walidelzo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WETaskModel.h"
#import "EditTaskViewController.h"

@protocol DetailTaskViewControllerDeleget<NSObject>
-(void)taskSaveFromDetailVC:(WETaskModel*)task;
@end

@interface DetailTaskViewController : UIViewController<EditTaskViewControllerDelegete>
@property (weak,nonatomic) id<DetailTaskViewControllerDeleget> delegete;
@property (weak, nonatomic) IBOutlet UILabel *taskLabel;
@property (weak, nonatomic) IBOutlet UILabel *taskDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *taskDetailLabel;
@property (weak, nonatomic) IBOutlet UISwitch *taskSwitch;
@property (strong,nonatomic) WETaskModel *task;
- (IBAction)EditTaskButtonPressed:(UIButton *)sender;

@end
