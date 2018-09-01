//
//  ViewController.m
//  overDueApp
//
//  Created by walidelzo on 9/1/18.
//  Copyright © 2018 walidelzo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma  mark -TableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[self.tableView dequeueReusableCellWithIdentifier:@"taskcellid"];
    cell.textLabel.text=[[NSUserDefaults standardUserDefaults] objectForKey:TASK_NAME];
    return cell;
}

#pragma  mark Add task delegate
-(void)DidSaveTask{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
-(void)DidCancelTask{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


#pragma  mark segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.destinationViewController isKindOfClass:[AddTaskViewController class]]){
        AddTaskViewController *addTaskVC=segue.destinationViewController;
        addTaskVC.delegate=self;
    }
}





- (IBAction)reOrderbarButtonAction:(UIBarButtonItem *)sender {
}

- (IBAction)addTaskBarButtonAction:(UIBarButtonItem *)sender {
}
@end
