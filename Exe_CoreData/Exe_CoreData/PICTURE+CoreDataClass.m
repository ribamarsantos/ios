//
//  PICTURE+CoreDataClass.m
//  Exe_CoreData
//
//  Created by Treinamento on 19/08/17.
//  Copyright © 2017 Ribamar. All rights reserved.
//

#import "PICTURE+CoreDataClass.h"
#import "PRODUCT+CoreDataClass.h"
#import "AppDelegate.h"
@implementation PICTURE

- (void) fillWithAttributes: (NSDictionary *) attributes {
    id t;
    
    t = [attributes valueForKeyPath:@"imagem"];
    if (t != nil && ![t isKindOfClass:[NSNull class]])
        self.data = UIImageJPEGRepresentation((UIImage *)t, 1.0);
    
    t = [attributes valueForKeyPath:@"produto"];
    if (t != nil && ![t isKindOfClass:[NSNull class]])
        self.product = t;
    
    self.date = [NSDate date];
    
    self.extension = @"jpeg";
    
}


+(PICTURE *)newPic:(NSDictionary *)elements{
    AppDelegate *appDelegate = (AppDelegate *)UIApplication.sharedApplication.delegate;
    PICTURE *pic = [NSEntityDescription
                    insertNewObjectForEntityForName:@"PICTURE"
                    inManagedObjectContext:appDelegate.persistentContainer.viewContext];
    [pic fillWithAttributes:elements];
    
    NSError *saveError = nil;
    [appDelegate.persistentContainer.viewContext save:&saveError];
    return pic;
}

@end
