//
//  DisplayDataVC.h
//  IOSproject
//
//  Created by my computer on 9/13/16.
//  Copyright © 2016 CreativeIos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DisplayDataVC : UIViewController <UIDocumentInteractionControllerDelegate>
@property (nonatomic,strong) NSMutableDictionary *dictDM;
@property (nonatomic,strong) NSMutableDictionary *dictCD;
@property (nonatomic,strong) NSMutableDictionary *dictMCWC;
@property (nonatomic,strong) NSMutableDictionary *dictINS;
@property (nonatomic,strong) NSString *btnTitle;
@property (strong, nonatomic) UIDocumentInteractionController *documentInteractionController;
- (IBAction)btnRefBuks:(UIButton *)sender;
- (IBAction)btnAcdPlng:(UIButton *)sender;
- (IBAction)btnSyb:(UIButton *)sender;
- (IBAction)btnStyMat:(UIButton *)sender;
- (IBAction)btnAssng:(UIButton *)sender;
- (IBAction)btnTT:(UIButton *)sender;
- (IBAction)btnQP:(UIButton *)sender;
@end
