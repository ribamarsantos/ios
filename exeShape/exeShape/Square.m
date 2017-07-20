//
//  Square.m
//  exeShape
//
//  Created by Ribamar Marcos José dos Santos on 20/07/17.
//  Copyright © 2017 Ribamar Marcos José dos Santos. All rights reserved.
//

#import "Square.h"

@implementation Square

-(id) initSquare:(int)pSide{
    self = [super init];
    _side = pSide;
    return self;
}

-(NSString *) printArea{
    [ self calculateArea];
    return [NSString stringWithFormat:@"Área do quadrado: %f", self.area];
}

-(void) calculateArea{
    self.area =  self.side * self.side;
}

@end
