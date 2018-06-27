                        ####(LEITURA DE DADOS)####
                        
function [f_r,f_l,f_c,f_t0,f_tn,f_v0,f_i0,f_h,f_N] = leitura_de_dados ()   
  
  disp('A Entrada dos valores iniciais sera:')
  disp('  1 - Manual')
  disp('  2 - Por arquivo')
  escolha=input('');       
  
  if escolha==1 %leitura manual

    f_r=input('Informe o valor da Resistencia ');
    f_l=input('Informe o valor da Indutancia ');
    f_c=input('Informe o valor da Capacitancia ');
    f_t0=input('Informe o valor inicial do Tempo ');
    f_tn=input('Informe o valor final do Tempo ');
    f_v0=input('Informe o valor inicial de tensao ');
    f_i0=input('Informe o valor inicial de corrente ');
    f_h=input('Informe o tamanho do passo h ');
    f_N=int8((f_tn-f_t0)/f_h);
    
  elseif escolha==2 %leitura via arquivo 
    
    valores=zeros(6,1);%"alocacao de memoria"
    arquivo=fopen('parametros.dat');%abertura de arquivo
    valores=fscanf(arquivo,'%*s %f\n');%leitura do arquivo formatada

    f_r=valores(1);
    f_l=valores(2);
    f_c=valores(3);
    f_t0=valores(4);
    f_tn=valores(5);
    f_v0=valores(6);
    f_i0=valores(7);
    f_h=valores(8);
    f_N=int8((f_tn-f_t0)/f_h);
  
  else
    disp('Tente novamente');
  endif

endfunction                        