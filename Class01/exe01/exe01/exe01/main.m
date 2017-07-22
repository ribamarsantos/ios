//
//  main.m
//  exe01
//
//  Created by Ribamar Marcos José dos Santos on 15/07/17.
//  Copyright © 2017 Ribamar Marcos José dos Santos. All rights reserved.


#import <Foundation/Foundation.h>
#import "ContaCorrente.h"
#import "ContaCorrente+ContaPoupanca.h"


NSMutableArray * contas;
ContaCorrente * contaUsuario;

void novaConta() {
    char buffer[500] = {0};
    int numeroConta = 0;
    NSDate * dataNascimento;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    NSString * dataNascimentoStr;
    
    NSLog(@"Informe seu nome: ");
    scanf(" %[^\n]s", buffer);
    NSString *name = [NSString stringWithUTF8String:buffer];
    NSLog(@"Digite o número da conta");
    scanf("%i", &numeroConta);
    NSLog(@"Informe sua data de nascimento: ");
    scanf(" %[^\n]s", buffer);
    dataNascimentoStr = [NSString stringWithUTF8String:buffer];
    dataNascimento = [dateFormatter dateFromString:dataNascimentoStr];
    ContaCorrente *contaA = [[ContaCorrente alloc] initConta:numeroConta initSaldo:0 correntista: name initDate:dataNascimento];
    [contas addObject:contaA];
}

ContaCorrente* buscarConta() {
    int numeroConta = 0;
   
    ContaCorrente * c;
    NSLog(@"Digite o número da conta");
    scanf("%i", &numeroConta);
    for( ContaCorrente * conta in contas){
        if( conta.numeroConta == numeroConta){
            c = conta;
            break;
        }
    }
    
    if ( c == nil){
        NSLog(@"Conta não encontrada!");
        return nil;
    }else{
        return c;
    }
}


void menuContaLogada(){
    int op = 0;
    double valor;
    ContaCorrente * c = buscarConta();
    if( c != nil){
        do{
            
            valor = 0;
            NSLog(@"0 - Sair");
            NSLog(@"1 - Saldo");
            NSLog(@"2 - Saque");
            NSLog(@"3 - Depósito");
            NSLog(@"4 - Transferência");
            NSLog(@"5 - Extrato");
            scanf("%i", &op);
            if (op == 1) {
                NSLog(@"%@", c);
            } else if (op == 2) {
                NSLog(@"Digite o valor desejado: ");
                scanf("%lf", &valor);
                if ([c saque:valor]) {
                    NSLog(@"Saque autorizado!");
                } else {
                    NSLog(@"Saque não autorizado!");
                }
            } else if (op == 3) {
                NSLog(@"Digite o valor desejado: ");
                scanf("%lf", &valor);
                if ([c deposita:valor]) {
                    NSLog(@"Depósito efetuado!");
                } else {
                    NSLog(@"Depósito não efetuado!");
                }
            } else if (op == 4) {
                NSLog(@"Digite o valor desejado: ");
                scanf("%lf", &valor);
                ContaCorrente* contaDestino = buscarConta();
                if([c tranfere:valor contaTransf:contaDestino]){
                    NSLog(@"Transferencia efetuada!");
                } else {
                    NSLog(@"Transferência não efetuada!");
                }
            } else if ( op == 5){
                NSLog(@"%@", [c imprimirExtrato]);
            }
        }while ( op != 0);
    }
    
}


int main(int argc, const char * argv[]) {
    contas = [NSMutableArray array];
    @autoreleasepool {
        
        int opcao = 0;
        
        do {
            // opcoes fora da conta
            NSLog(@"0 - Sair");
            NSLog(@"1 - Nova Conta");
            NSLog(@"2 - Consultar Conta");
            scanf("%i", &opcao);
            
            switch (opcao) {
                case 1:
                    novaConta();
                    break;
                case 2:
                    menuContaLogada();
                    break;
                default:
                    break;
            }
        } while ( opcao != 0);
    }
    return 0;
}

