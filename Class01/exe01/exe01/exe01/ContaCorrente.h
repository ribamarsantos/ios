//
//  ContaCorrente.h
//  exe01
//
//  Created by Ribamar Marcos José dos Santos on 15/07/17.
//  Copyright © 2017 Ribamar Marcos José dos Santos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContaCorrente : NSObject

@property  (readonly) int numeroConta;
@property  (readonly) NSString *correntista;
@property  (readonly) double saldo;
@property  (readonly) NSDate * dataNascimento;
@property  (readonly) NSMutableArray * historico;


-(id)initConta: (int) numeroconta initSaldo:(double) saldo correntista: (NSString *) correntista initDate: (NSDate *) dataNascimento;

-(bool) deposita: (double)valor;
-(bool) saque:(double) valor;
-(bool) tranfere:(double) valor contaTransf:(ContaCorrente *) c2;
- (NSString * ) imprimirExtrato;
 

@end
