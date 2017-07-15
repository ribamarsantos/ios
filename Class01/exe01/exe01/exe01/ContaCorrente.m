//
//  ContaCorrente.m
//  exe01
//
//  Created by Ribamar Marcos José dos Santos on 15/07/17.
//  Copyright © 2017 Ribamar Marcos José dos Santos. All rights reserved.
//

#import "ContaCorrente.h"

@implementation ContaCorrente


-(id)initConta:(int)numeroconta initSaldo:(double)saldo correntista:(NSString *)correntista;{
    _numeroConta = numeroconta;
    _saldo = saldo;
    _correntista = correntista;
    return self;
}

-(bool)deposita:(double)valor;{
    if( valor > 0){
        _saldo += valor;
        return true;
    }else{
        return false;
    }
}

-(bool)saque:(double)valor;{
    if( valor <= self.saldo){
        _saldo -= valor;
        return true;
    }else{
        return false;
    }
}

-(bool) tranfere:(double)valor contaTransf:(ContaCorrente *)c2;{
    if( valor <= self.saldo && c2 != nil){
        [self saque:valor];
        [c2 deposita:valor];
        return true;
    }else{
        return false;
    }
}

@end
