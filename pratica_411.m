                    ####(PRATICA 4 - LPAEE)####
clear;
home;

[r,l,c,t0,tn,v0,i0,h,N]=leitura_de_dados();

[t,E,vl,vc,i]=simulacao_circuito(r,l,c,t0,tn,v0,i0,h,N);

%plot_graphs(t,E,vl,vc,i);

gerar_relatorio(r,l,c,t0,tn,h,t,E,vc,vl,i,N);
