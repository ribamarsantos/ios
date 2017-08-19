//
//  PRODUCT+CoreDataClass.m
//  Exe_CoreData
//
//  Created by Treinamento on 19/08/17.
//  Copyright © 2017 Ribamar. All rights reserved.
//

#import "PRODUCT+CoreDataClass.h"
#import "PICTURE+CoreDataClass.h"
#import "AppDelegate.h"

@implementation PRODUCT


- (void) fillWithAttributes: (NSDictionary *) attributes {
    id t;
    
    t = [attributes valueForKeyPath:@"name"];
    if (t != nil && ![t isKindOfClass:[NSNull class]])
        self.name = [t description];
    
    t = [attributes valueForKeyPath:@"brand"];
    if (t != nil && ![t isKindOfClass:[NSNull class]])
        self.brand = [t description];
    
    t = [attributes valueForKeyPath:@"quantity"];
    if (t != nil && ![t isKindOfClass:[NSNull class]])
        self.quantity = @([t integerValue]);
    
}


+(PRODUCT *)newProduto:(NSDictionary *)elements{
    AppDelegate *appDelegate = (AppDelegate *)UIApplication.sharedApplication.delegate;
    PRODUCT *prod = [NSEntityDescription
                      insertNewObjectForEntityForName:@"PRODUCT"
                      inManagedObjectContext:appDelegate.persistentContainer.viewContext];
    [prod fillWithAttributes:elements];
    
    NSError *saveError = nil;
    [appDelegate.persistentContainer.viewContext save:&saveError];
    return prod;
}

+(NSArray *) getAllProducts {
    
    AppDelegate *appDelegate = (AppDelegate *)UIApplication.sharedApplication.delegate;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"PRODUCT"];
    NSError *error;
    NSArray *produtos = [appDelegate.persistentContainer.viewContext executeFetchRequest:request error:&error];
    return produtos ;
}

@end
