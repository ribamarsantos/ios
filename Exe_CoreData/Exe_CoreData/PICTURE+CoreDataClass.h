//
//  PICTURE+CoreDataClass.h
//  Exe_CoreData
//
//  Created by Treinamento on 19/08/17.
//  Copyright © 2017 Ribamar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class PRODUCT;

NS_ASSUME_NONNULL_BEGIN

@interface PICTURE : NSManagedObject
+(PICTURE *)newPic:(NSDictionary *)elements;

@end

NS_ASSUME_NONNULL_END

#import "PICTURE+CoreDataProperties.h"
