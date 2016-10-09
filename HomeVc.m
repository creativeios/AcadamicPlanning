//
//  HomeVc.m
//  IOSproject
//
//  Created by my computer on 9/13/16.
//  Copyright © 2016 CreativeIos. All rights reserved.
//

#import "HomeVc.h"

@interface HomeVc ()

@end

@implementation HomeVc

- (void)viewDidLoad {
    [super viewDidLoad];
    
     //self.navigationItem.hidesBackButton = YES;
    
        // Do any additional setup after loading the view.
    
    
    
    
     self.navigationController.navigationBar.titleTextAttributes = @{NSFontAttributeName: [UIFont fontWithName:@"Cochin-Italic" size:21], NSForegroundColorAttributeName: [UIColor whiteColor]};
    
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

- (IBAction)btnDM:(UIButton *)sender {
    
    DisplayDataVC *objVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DisplayDataVC"];
    objVC.btnTitle = @"DM";

    [self.navigationController pushViewController:objVC animated:YES];
    
}

- (IBAction)btnCD:(UIButton *)sender {
    
    DisplayDataVC *objVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DisplayDataVC"];
    objVC.btnTitle = @"CD";
   [self.navigationController pushViewController:objVC animated:YES];
}

- (IBAction)btnWCMC:(UIButton *)sender {
    
    DisplayDataVC *objVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DisplayDataVC"];
    objVC.btnTitle = @"MCWC";

    [self.navigationController pushViewController:objVC animated:YES];
}

- (IBAction)btnINS:(UIButton *)sender {
    
    DisplayDataVC *objVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DisplayDataVC"];
    objVC.btnTitle = @"INS";

    [self.navigationController pushViewController:objVC animated:YES];}
@end
