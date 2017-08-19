//
//  PRODUCT+CoreDataProperties.m
//  Exe_CoreData
//
//  Created by Treinamento on 19/08/17.
//  Copyright © 2017 Ribamar. All rights reserved.
//

#import "PRODUCT+CoreDataProperties.h"

@implementation PRODUCT (CoreDataProperties)

+ (NSFetchRequest<PRODUCT *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"PRODUCT"];
}

@dynamic name;
@dynamic brand;
@dynamic quantity;
@dynamic pictures;

@end
