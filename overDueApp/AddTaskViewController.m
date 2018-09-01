//
//  AddTaskViewController.m
//  overDueApp
//
//  Created by walidelzo on 9/1/18.
//  Copyright © 2018 walidelzo. All rights reserved.
//

#import "AddTaskViewController.h"

@interface AddTaskViewController ()

@end

@implementation AddTaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)saveButtonBarAddView:(UIBarButtonItem *)sender {
    if ([_textNameTextFieldAddView.text isEqualToString:@"" ]|| [_textNameTextFieldAddView.text isEqualToString:@""])
    {
        UIAlertController *alert =[UIAlertController alertControllerWithTitle:@"Alert Message" message:@"you must fill task name and task detail" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action=[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
    }else{
        [[NSUserDefaults standardUserDefaults] setObject:_textNameTextFieldAddView.text forKey:TASK_NAME];
        [[NSUserDefaults standardUserDefaults]setObject:_detailTaskTextViewAddView.text forKey:TASK_DETAIAL];
        [[NSUserDefaults standardUserDefaults ] setObject:self.dateTaskDatePickerAddview.date forKey:TASK_DATE];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
    [self.delegate DidSaveTask];
    }
    
}

- (IBAction)cancelBarButtonAddView:(UIBarButtonItem *)sender {
    [self.delegate DidCancelTask];
    
}
@end
