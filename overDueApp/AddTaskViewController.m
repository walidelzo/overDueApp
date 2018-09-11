//
//  AddTaskViewController.m
//  overDueApp
//
//  Created by walidelzo on 9/1/18.
//  Copyright © 2018 walidelzo. All rights reserved.
//

#import "AddTaskViewController.h"

@interface AddTaskViewController ()<UITextViewDelegate>

@end

@implementation AddTaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.detailTaskTextViewAddView.delegate=self;
    self.detailTaskTextViewAddView.delegate=self;
    self.textNameTextFieldAddView.delegate=self;
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
#pragma  mark Action
- (IBAction)saveButtonBarAddView:(UIBarButtonItem *)sender {
    if ([_textNameTextFieldAddView.text isEqualToString:@"" ]|| [_textNameTextFieldAddView.text isEqualToString:@""])
    {
        UIAlertController *alert =[UIAlertController alertControllerWithTitle:@"Alert Message" message:@"you must fill task name and task detail" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action=[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
    }
    else
    {
        [self.delegate DidSaveTask:[self returnAPropertyFromiOutLet]];
    }
}


- (IBAction)cancelBarButtonAddView:(UIBarButtonItem *)sender {
    [self.delegate DidCancelTask];
}



#pragma mark Helping Methods
-(WETaskModel*)returnAPropertyFromiOutLet{
    WETaskModel *task=[[WETaskModel alloc ]init];
    task.taskName=_textNameTextFieldAddView.text;
    task.taskDetail=_detailTaskTextViewAddView.text;
    task.taskDate=_dateTaskDatePickerAddview.date;
    task.isComplete=NO;
    return task ;
}

#pragma  mark textview and textfield delegete
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [_textNameTextFieldAddView resignFirstResponder];
    return YES;
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString: @"\n"]){
        [self.detailTaskTextViewAddView resignFirstResponder];
        return NO;
    }else{
        return YES;
    }
    
    
}
@end
