//
//  AppDelegate.h
//  Projeto_IOS
//
//  Created by Rodrigo Nóbrega on 10/21/16.
//  Copyright © 2016 iesb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

