  Exercício
  
  Crie uma classe chamada ContaCorrente com as seguintes especificações:​
Atributos da classe ContaCorrente: numeroConta (inteiro), correntista (NSString), saldo (double) ​
Implementar apenas um construtor recebendo valores para os atributos numeroConta e correntista da classe ContaCorrente.​
Todas as propriedades da classe devem ser readonly.​
Implementar o método boolean deposita(double valor) que deposita um valor na conta corrente. O método retorna verdadeiro se o depósito foi realizado com sucesso ou falso em caso contrário. OBS: Verificar se o valor informado é maior que zero. ​
Implementar o método boolean saque(double valor) que realiza um saque na conta corrente. O método retorna verdadeiro se o saque foi realizado com sucesso ou falso e caso contrário. OBS: Verificar se o valor informado é maior que zero e se há saldo suficiente para realizar o saque. ​
Implementar o método boolean transfere(double valor, ContaCorrente c2) que realiza uma transferência de um valor da conta corrente para a conta corrente c2. O método retorna verdadeiro se a transferência foi realizada com sucesso ou falso em caso contrário. OBS: Verificar se o valor informado é maior que zero, se o objeto c2 não é nulo e se há saldo suficiente para realizar a transferência.​
