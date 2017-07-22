//
//  main.m
//  exe01
//
//  Created by Ribamar Marcos José dos Santos on 15/07/17.
//  Copyright © 2017 Ribamar Marcos José dos Santos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ContaCorrente.h"
#import "ContaCorrente+ContaPoupanca.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Let's go! conta corrente");
        ContaCorrente *contaA = [[ContaCorrente alloc] initConta:01 initSaldo:400 correntista:@"Ribamar"];
        ContaCorrente *contaB = [[ContaCorrente alloc] initConta:02 initSaldo:100 correntista:@"Santos"];
        [contaA calculaRendimento];
        NSLog(@"%f", contaA.saldo);
        
        bool deucerto = [ contaA deposita:700];
        
        if( deucerto){
            NSLog(@"%f", contaA.saldo);
            NSLog(@"deposito realizado com sucesso!");
        }
        
        deucerto = [contaA saque:800];
        
        if( deucerto){
            NSLog(@"%f", contaA.saldo);
            NSLog(@"saque realizado com sucesso!");
        }else{
            NSLog(@"Saque insuficiente");
        }
        
        deucerto = [ contaA tranfere:300 contaTransf:contaB];
        if( deucerto){
            NSLog(@"Transferencia realizada saldo conta A: %f. Saldo conta B: %f", contaA.saldo, contaB.saldo);
        }
        
        
        
        
        
    }
    return 0;
}
