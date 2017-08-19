//
//  PICTURE+CoreDataProperties.h
//  Exe_CoreData
//
//  Created by Treinamento on 19/08/17.
//  Copyright © 2017 Ribamar. All rights reserved.
//

#import "PICTURE+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface PICTURE (CoreDataProperties)

+ (NSFetchRequest<PICTURE *> *)fetchRequest;

@property (nullable, nonatomic, retain) NSData *data;
@property (nullable, nonatomic, copy) NSDate *date;
@property (nullable, nonatomic, copy) NSString *extension;
@property (nullable, nonatomic, retain) PRODUCT *product;

@end

NS_ASSUME_NONNULL_END
