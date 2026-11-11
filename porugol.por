
programa
{
  inclua biblioteca Util
  inclua biblioteca Texto
  funcao logico verificar(cadeia palpite[], cadeia senha[]) {
       inteiro acertos = 0
               para (inteiro i = 0; i< 4; i=i + 1) {
                se (palpite[i] == senha [i]) {
                  acertos = acertos + 1
                }
               }
              retorne acertos == 4
           
     }
  funcao inicio()
  {
       //vermelho, roxo, verde, laranja, amarelo, azul   
    cadeia opcoes[] = {"🔴", "🟣", "🟢", "🟠", "🟡", "🔵"}
    cadeia senha[4]

    para (inteiro i = 0; i < 4; i = i + 1) {
      senha[i] = opcoes[Util.sorteia(0, 5 )]
    }

    inteiro tentativas = 10
    cadeia palpites[10][4]
          logico acertou = falso

    escreva("===== JOGO SENHA =====\n\n")
    escreva("Cores disponíveis:\n")
          para (inteiro i = 0; i < 6; i=i + 1) {
            escreva(opcoes[i], " ")
          }
          escreva("\nDigite quatro cores para tentar descobrir a senha!\n")
          escreva("Para cada cor correta, você receberá um emoji preto (⚫) e para cada cor correta, mas na posição errada, você receberá um emoji branco (⚪).\n")

          enquanto (tentativas > 0 e nao acertou) {
            escreva("digite seu palpite:")
            cadeia palpite[4]
            cadeia palpitetodo
            leia(palpitetodo)
            para (inteiro i = 0; i < 4; i = i + 1){
              palpite[i] = Texto.extrair_subtexto(palpitetodo, i * 2, i * 2 + 2)
            }

               acertou = verificar(palpite, senha)

               limpa()
               se (acertou) {
                escreva("Parabéns! Você acertou!")
               } senao {  
                para (inteiro i = 0; i < 4; i = i + 1) {
                   palpites[10 - tentativas][i] = palpite[i]
                    }

                    escreva("Senha incorreta! Você tem ", tentativas - 1, " tentativas restantes\n")
                escreva("Cores disponíveis:\n")
                    para (inteiro i = 0; i < 6; i=i + 1) {
                      escreva(opcoes[i], " ")
                    }

                    para (inteiro i = 0; i < 11 - tentativas ; i = i + 1) {
                         inteiro posicao_correta = 0
                         inteiro posicao_incorreta = 0

                         logico usados[] = {falso, falso, falso, falso}

                          para (inteiro j = 0; j < 4; j = j + 1) {
                               se (palpites[i][j] == senha[j]) {
                                posicao_correta = posicao_correta + 1
                                usados[j] = verdadeiro 
                               }
                         }
                         para (inteiro j = 0; j < 4; j = j + 1) {
                              se (palpites [i][j] != senha[j]) {                         
                                   para (inteiro k = 0; k < 4; k = k + 1) {
                                        se (nao usados [k] e palpites[i][j] == senha[k]) {
                                          posicao_incorreta = posicao_incorreta + 1 
                                             usados[k] = verdadeiro                                 
                                        }
                                   }    
                              }
                         }

                         escreva("tentativa: ")
                         para (inteiro j = 0; j < 4; j = j + 1) {
                               escreva(palpites[i][j])
                         }
                         escreva(" | Dicas: ") 
                         para (inteiro j = 0; j < posicao_correta; j = j + 1) {
                              escreva ("⚫ ")
                         }     
                         escreva(" | Dicas: ") 
                         para (inteiro j = 0; j < posicao_incorreta; j = j + 1) {
                              escreva ("⚪ ")
                         }  
                         escreva("\n")
                    }
                tentativas = tentativas - 1
               }
          }
          se (nao acertou){
            limpa()
            escreva("cabou as tentativas, a senha era:\n")
            para(inteiro i = 0; i <  4; i = i + 1){
              escreva(senha[i])
            }

          }
  }
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 4266; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */