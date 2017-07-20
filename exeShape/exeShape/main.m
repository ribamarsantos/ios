//
//  main.m
//  exeShape
//
//  Created by Ribamar Marcos José dos Santos on 20/07/17.
//  Copyright © 2017 Ribamar Marcos José dos Santos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Shape.h"
#import "Square.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"Shape Exercise");
        Shape * shape;
        Shape * square;
        
        //Shape * rectangle;
        //Shape * circle;
        shape = [[Shape alloc] init];
        NSLog(@"%@", [shape printArea ]);
        square = [[Square alloc] initSquare: 15];
        NSLog(@"%@", [square printArea]);
        
        
        
    }
    return 0;
}
