//
//  EditTaskViewController.m
//  overDueApp
//
//  Created by walidelzo on 9/1/18.
//  Copyright © 2018 walidelzo. All rights reserved.
//

#import "EditTaskViewController.h"

@interface EditTaskViewController ()

@end

@implementation EditTaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _taskTextField.text=_task.taskName;
    _taskTextView.text=_task.taskDetail;
    _tastDatePicker.date=_task.taskDate;
    [_taskIsCompletSwitch setOn:_task.isComplete];
    self.taskTextField.delegate=self;
    self.taskTextView.delegate=self;
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

#pragma mark textfield and textview delegete
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [_taskTextField resignFirstResponder];
    return YES;
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString: @"\n"]){
        [self.taskTextView resignFirstResponder];
        return NO;
    }else{
        return YES;
    }
}



-(WETaskModel*)returnEditedTask{
    WETaskModel*task=[[WETaskModel alloc]init];
    task.taskName=_taskTextField.text;
    task.taskDetail=_taskTextView.text;
    task.taskDate=_tastDatePicker.date;
    task.isComplete=_taskIsCompletSwitch.isOn;
    return task;
}

- (IBAction)saveEditButtonbarPressed:(UIBarButtonItem *)sender

{
    [self.delegete TaskDidSave:[self returnEditedTask]];

}
@end
