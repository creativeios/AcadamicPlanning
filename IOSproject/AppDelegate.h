//
//  AppDelegate.h
//  IOSproject
//
//  Created by indianic on 13/09/16.
//  Copyright © 2016 CreativeIos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (strong,nonatomic) NSMutableArray *arrToDo;
+(AppDelegate *)sharedInstance;
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

