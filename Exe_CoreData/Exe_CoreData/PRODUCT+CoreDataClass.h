//
//  PRODUCT+CoreDataClass.h
//  Exe_CoreData
//
//  Created by Treinamento on 19/08/17.
//  Copyright © 2017 Ribamar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class PICTURE;

NS_ASSUME_NONNULL_BEGIN

@interface PRODUCT : NSManagedObject

+(PRODUCT *)newProduto:(NSDictionary *)elements;
+(NSArray *) getAllProducts;

@end

NS_ASSUME_NONNULL_END

#import "PRODUCT+CoreDataProperties.h"
