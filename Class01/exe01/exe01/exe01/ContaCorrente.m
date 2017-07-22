//
//  ContaCorrente.m
//  exe01
//
//  Created by Ribamar Marcos José dos Santos on 15/07/17.
//  Copyright © 2017 Ribamar Marcos José dos Santos. All rights reserved.
//

#import "ContaCorrente.h"

@implementation ContaCorrente


-(id) initConta:(int)numeroconta initSaldo:(double)saldo correntista:(NSString *)correntista initDate:(NSDate *)dataNascimento{
    self = [super init];
    _numeroConta = numeroconta;
    _saldo = saldo;
    _correntista = correntista;
    _dataNascimento = dataNascimento;
    _historico = [NSMutableArray array];
    return self;
}

-(bool)deposita:(double)valor;{
    if( valor > 0){
        _saldo += valor;
        [self addHistorico:@"DEPOSITO" valorOp:valor];
        return true;
    }else{
        return false;
    }
}

-(bool)saque:(double)valor;{
    if( valor <= self.saldo){
        _saldo -= valor;
        [self addHistorico:@"SAQUE" valorOp:valor];
        return true;
    }else{
        return false;
    }
}

-(bool) tranfere:(double)valor contaTransf:(ContaCorrente *)c2;{
    if( valor <= self.saldo && c2 != nil){
        [self saque:valor];
        [c2 deposita:valor];
        [self addHistorico:@"TRANSFERENCIA" valorOp:valor];
        return true;
    }else{
        return false;
    }
}

-(void) addHistorico: (NSString *) operacao valorOp:(double) valor{
    
    NSDictionary *descOp = @{@"operacao":operacao, @"valor":[NSNumber numberWithDouble:valor], @"saldo": [NSNumber numberWithDouble:_saldo] };
    
    [_historico addObject:descOp];

    
}

- (NSString *) description {
    return [NSString stringWithFormat:@"%i - %@: R$ %f", self.numeroConta, self.correntista, self.saldo];
}

- ( NSString * ) imprimirExtrato{
    NSMutableString * list = [NSMutableString string];
    for( NSDictionary * extrato in _historico){
        [list appendString: [extrato description]];
    }
    return list ;
}
@end
