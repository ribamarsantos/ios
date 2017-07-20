//
//  Shape.h
//  exeShape
//
//  Created by Ribamar Marcos José dos Santos on 20/07/17.
//  Copyright © 2017 Ribamar Marcos José dos Santos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Shape : NSObject

@property double area;

-(void) calculateArea;
-(NSString *) printArea;

@end
