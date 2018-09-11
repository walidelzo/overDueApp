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

#pragma  mark lazy instantiation

-(NSMutableArray *)AlltaskObjects{
    if (!_AlltaskObjects){
        _AlltaskObjects=[[NSMutableArray alloc] init];
    }
    return _AlltaskObjects;
}



- (void)viewDidLoad {
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    [super viewDidLoad];

     NSMutableArray *allTaskAsProperyList =[[NSUserDefaults standardUserDefaults] objectForKey:ALL_TASKS];
    for (NSDictionary *dic in allTaskAsProperyList) {
        [self.AlltaskObjects addObject:[self taskReturnPropertyFromPropertyList:dic]];
    }
    
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
    return [_AlltaskObjects count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[self.tableView dequeueReusableCellWithIdentifier:@"taskcellid"];
    WETaskModel *task=[self.AlltaskObjects objectAtIndex:indexPath.row];
    cell.textLabel.text=task.taskName;
    cell.detailTextLabel.text=[ self TaskReturnDateWithFormat:@"dd-MM-yyyy hh:mm" andDate:task.taskDate];
     if ([self taskTheDateIsGreaterThanToDay:task]==YES) cell.backgroundColor=[UIColor yellowColor];
     else cell.backgroundColor=[UIColor redColor];
     //cell.backgroundColor=[UIColor clearColor];
     if (task.isComplete==YES)cell.backgroundColor=[UIColor greenColor];
    return cell;
}

#pragma  mark  tableview delegete
-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    WETaskModel *movedtask=[self.AlltaskObjects objectAtIndex:sourceIndexPath.row];
    [self.AlltaskObjects removeObjectAtIndex:sourceIndexPath.row];
    [self.AlltaskObjects insertObject:movedtask atIndex:destinationIndexPath.row];
    [self taskSaveTaskInNSUserDefaults];
    
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return true;
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle==UITableViewCellEditingStyleDelete){
        [self.AlltaskObjects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self taskSaveTaskInNSUserDefaults];
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self taskIsComplet:indexPath];
}

#pragma  mark Add task delegate
-(void)DidSaveTask:(WETaskModel *)task{
    [self.AlltaskObjects addObject:task];
    NSMutableArray *propertyListsTasks=[[[NSUserDefaults standardUserDefaults] arrayForKey:ALL_TASKS] mutableCopy];
    if (!propertyListsTasks)propertyListsTasks=[[NSMutableArray alloc]init];
    [propertyListsTasks addObject: [self taskPropertList:task]];
    [[NSUserDefaults standardUserDefaults ] setObject:propertyListsTasks forKey:ALL_TASKS];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.tableView reloadData];
}
-(void)DidCancelTask{
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma  mark segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.destinationViewController isKindOfClass:[AddTaskViewController class]]){
        AddTaskViewController *addTaskVC=segue.destinationViewController;
        addTaskVC.delegate=self;
    }else if ([segue.destinationViewController isKindOfClass:[DetailTaskViewController class]]){
        DetailTaskViewController *detailVC=segue.destinationViewController;
        NSIndexPath *indexPath=sender;
        self.rowNumber=indexPath.row;
        detailVC.task=[self.AlltaskObjects objectAtIndex: indexPath.row];
        detailVC.delegete=self;
    }
    
    
}

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"toDetailVCSegue" sender:indexPath];
}


#pragma mark action Buttons
- (IBAction)reOrderbarButtonAction:(UIBarButtonItem *)sender
{
    if(self.tableView.editing==YES)self.tableView.editing=NO;
    else self.tableView.editing=YES;
}

- (IBAction)addTaskBarButtonAction:(UIBarButtonItem *)sender {
}

#pragma  mark Helper methods
-(NSDictionary*)taskPropertList :(WETaskModel*)task{
    NSDictionary *dic=@{TASK_NAME:task.taskName,TASK_DETAIAL:task.taskDetail,TASK_DATE:task.taskDate ,TASK_ISCOMPLETE:@(task.isComplete)};
    return dic;
}

-(WETaskModel*)taskReturnPropertyFromPropertyList :(NSDictionary*)dic{
    WETaskModel *task=[[WETaskModel alloc]initWithName:dic];
    return task;
}

-(void)taskIsComplet:(NSIndexPath*)indexPath{
    WETaskModel *task=[self.AlltaskObjects objectAtIndex:indexPath.row];
    [self.AlltaskObjects removeObjectAtIndex:indexPath.row];
    if (task.isComplete==YES)task.isComplete=NO ;
    else task.isComplete=YES;
    [self.AlltaskObjects insertObject:task atIndex:indexPath.row];
    [self taskSaveTaskInNSUserDefaults];
    [self.tableView reloadData];
    
}
-(void)taskSaveTaskInNSUserDefaults{
    NSMutableArray *newRows=[[NSMutableArray alloc]init];
    for (WETaskModel*task in _AlltaskObjects) {
        [newRows addObject:[self taskPropertList: task]];
    }
    [[NSUserDefaults standardUserDefaults] setObject:newRows forKey:ALL_TASKS];
    [self.tableView reloadData];
}
-(BOOL)taskTheDateIsGreaterThanToDay :(WETaskModel*)task{
    NSTimeInterval today=[[NSDate date] timeIntervalSince1970];
    NSTimeInterval taskDate=[task.taskDate timeIntervalSince1970 ];
    if (taskDate >today)return YES; else return NO;
}

-(NSString*)TaskReturnDateWithFormat :(NSString*)format andDate :(NSDate*)date {
    NSDateFormatter *formmatter=[[NSDateFormatter alloc]init];
    [formmatter setDateFormat:format];
    NSString *dateAsString=[formmatter stringFromDate:date];
    return dateAsString;
}
#pragma mark detail delegete
-(void)taskSaveFromDetailVC:(WETaskModel *)task{
    [self.AlltaskObjects removeObjectAtIndex:self.rowNumber];
    [self.AlltaskObjects insertObject:task atIndex:self.rowNumber];
    [self taskSaveTaskInNSUserDefaults];
    [self.tableView reloadData];
}


@end
