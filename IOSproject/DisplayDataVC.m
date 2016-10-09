//
//  DisplayDataVC.m
//  IOSproject
//
//  Created by my computer on 9/13/16.
//  Copyright © 2016 CreativeIos. All rights reserved.
//

#import "DisplayDataVC.h"

@interface DisplayDataVC ()
{
    NSMutableDictionary *currentDict;
    UIAlertController *alertController;
}
@end

@implementation DisplayDataVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSFontAttributeName: [UIFont fontWithName:@"Cochin-Italic" size:21], NSForegroundColorAttributeName: [UIColor whiteColor]};

    
    
    
    
    self.navigationItem.title = _btnTitle;
    
    _dictDM=@{@"syllabus":@"syl_dm",@"ref_book":@"booklist",@"academic":@"acad_plan_dm",@"study_material":@[@"syl_dm"],@"assignment":@"ass_dm",@"qpaper":@[@"dm_qp1",@"dm_qp2",@"dm_qp3",@"dm_qp4",@"dm_qp5"],@"timetable":@"timetable"}.mutableCopy;
    
     _dictINS=@{@"syllabus":@"syl_ins",@"ref_book":@"booklist",@"academic":@"acad_plan_ins",@"study_material":@[@"ins_ch01",@"ins_ch02",@"ins_ch03",@"ins_ch04",@"ins_ch05",],@"assignment":@"ass_ins",@"qpaper":@[@"160702_1",@"160702_2",@"160702_3",@"160702_4",@"160702_5"],@"timetable":@"timetable"}.mutableCopy;
    _dictCD=@{@"syllabus":@"syl_cd",@"ref_book":@"booklist",@"academic":@"acad_plan_cd",@"study_material":@[@"cd_1",@"cd_2"],@"assignment":@"ass_cd",@"qpaper":@[@"cd_1",@"cd_2",@"Reg_2012",@"Reg_2013",@"Reg_2014"],@"timetable":@"timetable"}.mutableCopy;
    _dictMCWC=@{@"syllabus":@"syl_mcwc",@"ref_book":@"booklist",@"academic":@"acad_plan_mcwc",@"study_material":@[@"MobileCompChap01L07_MobComputing"],@"assignment":@"ass_mcwc",@"qpaper":@[@"mcwc_qp1",@"mcwc_qp2",@"mcwc_qp3",@"mcwc_qp4",@"mcwc_qp5"],@"timetable":@"timetable"}.mutableCopy;
    
    NSLog(@"all dicts cd %@ wcmc %@ ins %@ dm %@",_dictCD,_dictMCWC,_dictINS,_dictDM);
    if ([_btnTitle isEqualToString:@"DM"]) {
        currentDict=_dictDM;
    }
    else if ([_btnTitle isEqualToString:@"MCWC"]) {
        currentDict=_dictMCWC;
    }
    else if ([_btnTitle isEqualToString:@"CD"]) {
        currentDict=_dictCD;
    }
    else if ([_btnTitle isEqualToString:@"INS"]) {
        currentDict=_dictINS;
    }
    
    
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

- (IBAction)btnRefBuks:(UIButton *)sender {
   
        NSURL *URL = [[NSBundle mainBundle] URLForResource:currentDict[@"ref_book"] withExtension:@"pdf"];
        
        if (URL) {
            // Initialize Document Interaction Controller
            self.documentInteractionController = [UIDocumentInteractionController interactionControllerWithURL:URL];
            self.documentInteractionController.name = @"Reference Books ";

            // Configure Document Interaction Controller
            [self.documentInteractionController setDelegate:self];
            
            // Preview PDF
            [self.documentInteractionController presentPreviewAnimated:YES];
        }
    
}

- (IBAction)btnAcdPlng:(UIButton *)sender {
    
    NSURL *URL = [[NSBundle mainBundle] URLForResource:currentDict[@"academic"] withExtension:@"pdf"];
    
    if (URL) {
        // Initialize Document Interaction Controller
        self.documentInteractionController = [UIDocumentInteractionController interactionControllerWithURL:URL];
        
        self.documentInteractionController.name = @"Academic Planing";

        
        // Configure Document Interaction Controller
        [self.documentInteractionController setDelegate:self];
        
        // Preview PDF
        [self.documentInteractionController presentPreviewAnimated:YES];
    }
    
}

- (IBAction)btnSyb:(UIButton *)sender {
    
    NSURL *URL = [[NSBundle mainBundle] URLForResource:currentDict[@"syllabus"] withExtension:@"pdf"];
    
    if (URL) {
        // Initialize Document Interaction Controller
        self.documentInteractionController = [UIDocumentInteractionController interactionControllerWithURL:URL];
        self.documentInteractionController.name = @"Syllabus";

        // Configure Document Interaction Controller
        [self.documentInteractionController setDelegate:self];
        
        // Preview PDF
        [self.documentInteractionController presentPreviewAnimated:YES];
    }

    
}

- (IBAction)btnStyMat:(UIButton *)sender {
    
    alertController=[UIAlertController alertControllerWithTitle:@"Study material" message:@"select one" preferredStyle:UIAlertControllerStyleActionSheet];
    for (int i=0; i< [currentDict[@"study_material"] count]; i++) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:[NSString stringWithFormat:@"Pdf %d",i+1] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"clicked a sheet ,executing action");

            NSURL *URL = [[NSBundle mainBundle] URLForResource:currentDict[@"study_material"][i] withExtension:@"pdf"];
            
            if (URL) {
                // Initialize Document Interaction Controller
                self.documentInteractionController = [UIDocumentInteractionController interactionControllerWithURL:URL];
                self.documentInteractionController.name = @"Study Material";
                
                // Configure Document Interaction Controller
                [self.documentInteractionController setDelegate:self];
                
                // Preview PDF
                [self.documentInteractionController presentPreviewAnimated:YES];
            }
        }];
        [alertController addAction:action];
    }
    UIAlertAction *actionCancel =[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDestructive handler:nil];
    [alertController addAction:actionCancel];
    
    [self presentViewController:alertController animated:true completion:nil];
}

- (IBAction)btnAssng:(UIButton *)sender {
    
    NSURL *URL = [[NSBundle mainBundle] URLForResource:currentDict[@"assignment"] withExtension:@"pdf"];
    
    if (URL) {
        // Initialize Document Interaction Controller
        self.documentInteractionController = [UIDocumentInteractionController interactionControllerWithURL:URL];
        
        // Configure Document Interaction Controller
        [self.documentInteractionController setDelegate:self];
        self.documentInteractionController.name = @"Assignment";

        // Preview PDF
        [self.documentInteractionController presentPreviewAnimated:YES];
    }
}

- (IBAction)btnTT:(UIButton *)sender {
    
    NSURL *URL = [[NSBundle mainBundle] URLForResource:currentDict[@"timetable"] withExtension:@"pdf"];
    
    if (URL) {
        // Initialize Document Interaction Controller
        self.documentInteractionController = [UIDocumentInteractionController interactionControllerWithURL:URL];
        
        // Configure Document Interaction Controller
        [self.documentInteractionController setDelegate:self];
        self.documentInteractionController.name = @"Timetable";

        // Preview PDF
        [self.documentInteractionController presentPreviewAnimated:YES];
    }
}

- (IBAction)btnQP:(UIButton *)sender {
    alertController=[UIAlertController alertControllerWithTitle:@"Question Paper" message:@"select one" preferredStyle:UIAlertControllerStyleActionSheet];
    for (int i=0; i< [currentDict[@"qpaper"] count]; i++) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:[NSString stringWithFormat:@"Pdf %d",i+1] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"clicked a sheet ,executing action");
            NSURL *URL = [[NSBundle mainBundle] URLForResource:currentDict[@"qpaper"][i] withExtension:@"pdf"];
            
            if (URL) {
                // Initialize Document Interaction Controller
                self.documentInteractionController = [UIDocumentInteractionController interactionControllerWithURL:URL];
                
                 self.documentInteractionController.name = @"Question Paper";
                
                // Configure Document Interaction Controller
                [self.documentInteractionController setDelegate:self];
                
                // Preview PDF
                [self.documentInteractionController presentPreviewAnimated:YES];
            }
        }];
        [alertController addAction:action];
    }
    UIAlertAction *actionCancel =[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDestructive handler:nil];
    [alertController addAction:actionCancel];
    
    [self presentViewController:alertController animated:true completion:nil];
    
}

#pragma mark -
#pragma mark Document Interaction Controller Delegate Methods
- (UIViewController *) documentInteractionControllerViewControllerForPreview: (UIDocumentInteractionController *) controller {
    return self;
}



#pragma mark-bar button itemAction

- (IBAction)btnback:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}





@end
