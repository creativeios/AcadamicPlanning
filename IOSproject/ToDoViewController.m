//
//  ToDoViewController.m
//  IOSproject
//
//  Created by my computer on 9/14/16.
//  Copyright © 2016 CreativeIos. All rights reserved.
//

#import "ToDoViewController.h"
#import "AppDelegate.h"
@interface ToDoViewController ()
{
    NSUserDefaults *userDefaults;
    NSMutableArray *arr;
}
@property (weak, nonatomic) IBOutlet UITableView *tableTODO;





@end

@implementation ToDoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
     userDefaults= [NSUserDefaults standardUserDefaults];
    arr= (NSMutableArray *)[userDefaults objectForKey:@"arr"];
    
    if (arr!=nil) {
        [AppDelegate sharedInstance].arrToDo=arr.mutableCopy;
    }
    else if (arr==nil){
        [userDefaults setObject:[AppDelegate sharedInstance].arrToDo forKey:@"arr"];
        [userDefaults synchronize];
    }
    
    
    
    
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSFontAttributeName: [UIFont fontWithName:@"Cochin-Italic" size:21], NSForegroundColorAttributeName: [UIColor whiteColor]};

    
    
    [self.tableview setEditing:YES animated:YES];

}

-(void)viewDidAppear:(BOOL)animated{
    ///trying to add button to the navigation item
    
//    UIBarButtonItem *addItem =[[UIBarButtonItem alloc] initWithTitle:@"add" style:UIBarButtonItemStyleDone target:self action:@selector(btnadd:)];
//    [self.navigationItem setRightBarButtonItem:addItem animated:YES];
    
}
-(void)viewWillDisappear:(BOOL)animated{
//    [self.navigationItem setRightBarButtonItem:nil animated:YES];
    [userDefaults setObject:[AppDelegate sharedInstance].arrToDo forKey:@"arr"];
    [userDefaults synchronize];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -tableview delegates


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[AppDelegate sharedInstance].arrToDo count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *aCell =[tableView dequeueReusableCellWithIdentifier:@"Cell1"];
    aCell.textLabel.text=[AppDelegate sharedInstance].arrToDo[indexPath.row][@"title"];
    aCell.detailTextLabel.text=[AppDelegate sharedInstance].arrToDo[indexPath.row][@"detail"];
    
    return aCell;
}

//-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
//    return  true;
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnAdd:(UIBarButtonItem *)sender {
    //setting up an alert
    UIAlertController *alert =[UIAlertController alertControllerWithTitle:@"New ToDo" message:@"fill details of todo" preferredStyle:UIAlertControllerStyleAlert];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder=@"title";
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder=@"detail";
    }];
    UIAlertAction *actionCancel =[UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleDestructive handler:nil];
    UIAlertAction *actionAdd=[UIAlertAction actionWithTitle:@"add" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"added %@ %@",[[alert textFields][0] text],[[alert textFields][1] text]);
        
        [[AppDelegate sharedInstance].arrToDo addObject:@{@"title":[[alert textFields][0] text],@"detail":[[alert textFields][1] text]}];
        
        [_tableTODO reloadData];
        
        
        
    }];
    [alert addAction:actionCancel];
    [alert addAction:actionAdd];
    [self presentViewController:alert animated:true completion:nil];


}













- (void)setEditing:(BOOL)editing animated:(BOOL)animated { //Implement this method
    [super setEditing:editing animated:animated];
    [self.tableview setEditing:editing animated:animated];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath { //implement the delegate method
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Update data source array here, something like [array removeObjectAtIndex:indexPath.row];
//        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [[AppDelegate sharedInstance].arrToDo removeObjectAtIndex:indexPath.row];
        [tableView reloadData];
    }   
}

@end
