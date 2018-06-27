                      ####(SIMULACAO DE CIRCUITO)####
                      
function [t,E,vl,vc,i] = simulacao_circuito(r,l,c,t0,tn,v0,i0,h,N)
%        [retorno]     = nome da fc*       (entradas)
% *o nome da fc tem que se o mesmo do arquivo
  N=ceil((tn-t0)/h);

  E=zeros(N,1);

  for j=1:N
    if(j==1)
      t(j)=t0;
    else
      t(j)=t(j-1)+h;
    end
  end

  disp('A excitacao da fonte de tensao sera: ');
  disp('  1 - Degral')
  disp('  2 - Senoidal')
  disp('  3 - Pulso')
  escolha=input('');

  switch (escolha)%escolha do tipo de excitacao da fonte de tensao

    case 1
   
      disp('Degral');
      k=input('Informe o valor da amplitude K ');
      a=input('Informe o valor do atraso a ');

    for j=1:N
      if(j<a)
        E(j)=0.000;
      else
        E(j)=k;
      end
    end

    case 2  
    
      disp('Senoidal');
      k=input('Informe o valor da amplitude k ');
      w=input('Informe o valor da velocidade angular ');
      phi=input('Informe o valor da fase phi ');
      
    for j=1:N
       E(j)=k*sin(w*j+phi);
    endfor

    case 3
      
    disp('Pulso');
    k=input('Informe o valor da amplitude K ');
    a=input('Informe o valor do atraso a ');
    b=input('Informe o valor do atraso b ');

    for j=1:N
      if(j<a)
        E(j)=0.000;
      elseif(j>b)
        E(j)=0.000;
      else
        E(j)=k;
      endif
    endfor
   
    otherwise
      disp('Tente novamente');
  endswitch
  
  %criacao dos vetores vl vc e i
  i=zeros(N,1);
  vc=zeros(N,1);
  vl=zeros(N,1);
  i(1)=i0;
  vc(1)=v0;
  vl(1)=E(1)-r*i(1)-vc(1);

  A=[r 1 1;(-h/(2*c)) 1 0;1 0 (-h/(2*l))];
  
  %disp('Matriz Rede');
  %disp(A);

  for j=2:N
    
    b=[E(j) ; (vl(j-1)+(i(j-1)*(h/(2*c)))) ; (i(j-1)+(vc(j-1)*(h/(2*l))))];
    x=A\b;
    i(j)=x(1);
    vc(j)=x(2);
    vl(j)=x(3);
    
  endfor

endfunction 