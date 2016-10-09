//
//  ToDoViewController.h
//  IOSproject
//
//  Created by my computer on 9/14/16.
//  Copyright © 2016 CreativeIos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToDoViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableview;

@end
