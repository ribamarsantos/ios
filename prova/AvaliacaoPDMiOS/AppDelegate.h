//
//  AppDelegate.h
//  AvaliacaoPDMiOS
//
//  Created by Crystian Leão on 02/09/17.
//  Copyright © 2017 Ibratec. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

