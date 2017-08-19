//
//  PRODUCT+CoreDataProperties.h
//  Exe_CoreData
//
//  Created by Treinamento on 19/08/17.
//  Copyright © 2017 Ribamar. All rights reserved.
//

#import "PRODUCT+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface PRODUCT (CoreDataProperties)

+ (NSFetchRequest<PRODUCT *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *brand;
@property (nullable, nonatomic, copy) NSNumber *quantity;
@property (nullable, nonatomic, retain) NSSet<PICTURE *> *pictures;

@end

@interface PRODUCT (CoreDataGeneratedAccessors)

- (void)addPicturesObject:(PICTURE *)value;
- (void)removePicturesObject:(PICTURE *)value;
- (void)addPictures:(NSSet<PICTURE *> *)values;
- (void)removePictures:(NSSet<PICTURE *> *)values;

@end

NS_ASSUME_NONNULL_END
