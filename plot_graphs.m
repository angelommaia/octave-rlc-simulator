                      ####(PLOTAGEM DE GRAFICOS)####


function plot_graphs(t,E,vl,vc,i)
  
  plot(t,E,'b');
  title('Grafico de t x E');

  figure;
  plot(t,vc,'g');
  title('Grafico de t x vc');

  figure;
  plot(t,vl,'r');
  title('Grafico de t x vl');

  figure;
  plot(t,i,'y');
  title('Grafico de t x i');

endfunction