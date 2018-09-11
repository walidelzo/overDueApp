//
//  DetailTaskViewController.m
//  overDueApp
//
//  Created by walidelzo on 9/1/18.
//  Copyright © 2018 walidelzo. All rights reserved.
//

#import "DetailTaskViewController.h"

@interface DetailTaskViewController ()

@end

@implementation DetailTaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _taskLabel.text=_task.taskName;
    NSDateFormatter *formmater=[[NSDateFormatter alloc] init];
    [formmater  setDateFormat:@"dd-MM-yyyy hh:mm"];
    _taskDateLabel.text=[formmater stringFromDate:_task.taskDate];
    _taskDetailLabel.text=_task.taskDetail;
    if (_task.isComplete==YES)[_taskSwitch setOn:YES];
    else [_taskSwitch setOn:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma  mark segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.destinationViewController isKindOfClass:[EditTaskViewController class]]){
        EditTaskViewController *editTaskVC=segue.destinationViewController;
        editTaskVC.task=self.task;
        editTaskVC.delegete=self;
    }
}

-(void)TaskDidSave:(WETaskModel*)task
{
    _taskLabel.text=task.taskName;
    _taskDetailLabel.text=task.taskDetail;
    _taskDateLabel.text=[self TaskReturnDateWithFormat:@"yyyy-MM-dd hh:mm" andDate:task.taskDate];
    [_taskSwitch setOn:task.isComplete];
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.delegete taskSaveFromDetailVC:task];
}
- (IBAction)EditTaskButtonPressed:(UIButton *)sender
{

    [self performSegueWithIdentifier:@"toEditViewController" sender:sender];
}
#pragma  mark helper methods


-(NSString*)TaskReturnDateWithFormat :(NSString*)format andDate :(NSDate*)date {
    NSDateFormatter *formmatter=[[NSDateFormatter alloc]init];
    [formmatter setDateFormat:format];
    NSString *dateAsString=[formmatter stringFromDate:date];
    return dateAsString;
}



@end
