//
//  ContaCorrente+ContaPoupanca.m
//  exe01
//
//  Created by Ribamar Marcos José dos Santos on 22/07/17.
//  Copyright © 2017 Ribamar Marcos José dos Santos. All rights reserved.
//

#import "ContaCorrente+ContaPoupanca.h"

@implementation ContaCorrente (ContaPoupanca)

- (void) calculaRendimento{
    [self deposita: self.saldo * 0.01];
};

@end
