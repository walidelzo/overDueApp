//
//  AddTaskViewController.h
//  overDueApp
//
//  Created by walidelzo on 9/1/18.
//  Copyright © 2018 walidelzo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WETaskModel.h"

@protocol AddTaskViewControllerDelegate
-(void)DidSaveTask:(WETaskModel*)task;
-(void)DidCancelTask;
@end

@interface AddTaskViewController : UIViewController<UITextFieldDelegate,UITextViewDelegate>
@property (weak,nonatomic) id <AddTaskViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITextField *textNameTextFieldAddView;
@property (weak, nonatomic) IBOutlet UITextView *detailTaskTextViewAddView;
@property (weak, nonatomic) IBOutlet UIDatePicker *dateTaskDatePickerAddview;
- (IBAction)saveButtonBarAddView:(UIBarButtonItem *)sender;
- (IBAction)cancelBarButtonAddView:(UIBarButtonItem *)sender;
@property (strong,nonatomic) WETaskModel *task;
@end
