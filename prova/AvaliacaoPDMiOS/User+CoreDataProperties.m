//
//  User+CoreDataProperties.m
//  AvaliacaoPDMiOS
//
//  Created by Treinamento on 02/09/17.
//  Copyright © 2017 Ibratec. All rights reserved.
//

#import "User+CoreDataProperties.h"

@implementation User (CoreDataProperties)

+ (NSFetchRequest<User *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"User"];
}

@dynamic email;
@dynamic id;
@dynamic logado;
@dynamic senha;

@end
