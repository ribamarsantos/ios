//
//  User+CoreDataProperties.h
//  AvaliacaoPDMiOS
//
//  Created by Treinamento on 02/09/17.
//  Copyright © 2017 Ibratec. All rights reserved.
//

#import "User+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface User (CoreDataProperties)

+ (NSFetchRequest<User *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *email;
@property (nullable, nonatomic, copy) NSNumber *id;
@property (nullable, nonatomic, copy) NSNumber *logado;
@property (nullable, nonatomic, copy) NSString *senha;

@end

NS_ASSUME_NONNULL_END
