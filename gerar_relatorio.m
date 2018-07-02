                       ####(GERAR RELATORIO)####

function gerar_relatorio(r,l,c,t0,tn,h,t,E,vc,vl,i,N)

  outp = "relatorio.txt";
  fid = fopen (outp, "w");
  fprintf(fid,"Resistencia: %.4f R \r\n",r);
  fprintf(fid,"Indutanciancia: %.4f H \r\n",l);
  fprintf(fid,"Capacitancia: %.4f F \r\n",c);
  fprintf(fid,"Instante inicial: %d s \r\n",t0);
  fprintf(fid,"Instante final: %d s \r\n",tn);
  fprintf(fid,"Tamanho do passo: %d s \r\n",h);
  fprintf(fid,"##################### Tabela de Valores ################### \r\n");
  for j=1:N
  fprintf(fid,"Instante: %d s, E: %.4f V, VC: %.4f V, VL: %.4f V, I: %.4f A \r\n",t(j),E(j),vc(j),vl(j),i(j));
  endfor
  

endfunction