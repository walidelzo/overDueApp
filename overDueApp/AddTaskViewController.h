//
//  AddTaskViewController.h
//  overDueApp
//
//  Created by walidelzo on 9/1/18.
//  Copyright © 2018 walidelzo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AddTaskViewControllerDelegate

-(void)DidSaveTask;
-(void)DidCancelTask;
@end

@interface AddTaskViewController : UIViewController
@property (weak,nonatomic) id <AddTaskViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITextField *textNameTextFieldAddView;
@property (weak, nonatomic) IBOutlet UITextView *detailTaskTextViewAddView;
@property (weak, nonatomic) IBOutlet UIDatePicker *dateTaskDatePickerAddview;

- (IBAction)saveButtonBarAddView:(UIBarButtonItem *)sender;

- (IBAction)cancelBarButtonAddView:(UIBarButtonItem *)sender;

@end
