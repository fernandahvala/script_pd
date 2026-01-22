#############################################
#  SCRIPT - RENATA HENRIQUES   # FERNANDA - NHO
#############################################

#dimensionar valores econ?micos para entrada de ME constante; - nao precisa citar
set.seed(967);#inicializador, gerador de n?mero aleat?rio
seed=967

##parametros para curva de crescimento
AA=432 #peso adulto - ver se Fernanda forneceu   
k=0.0017 #constante de curva de crescimento (baseado na literatura)
BW=33 #peso ao nascimento do bezerro

#base producao de leite - nao citar (entra producao de leite, se for comercilizado)
MP=720 
dMP=0 #ganho com produÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ§ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ£o de leite # 3 litros/dia, 1 litro=1 kg; 
dA=0 #ganho peso adulto (+1) #*delta para peso a maturidade;
WWm= dMP/34    #*conversÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ£o extra milk to WWm = 1, sugestÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ£o ~34;

### Capacidade de carga
base_feed=4.6631+0.0030*AA+0.0127*(0.022*MP)  #EquaÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ§ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ£o consumo->nutrientes digestÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ­veis totais/dia #prever a capacidade de carga relativa com base na equa??o de Anderson et al. (JAS)
AA= AA+dA #peso adulto
MP=MP+dMP #producao de leite para consumo do bezerro
#ccap = 0.9
ccap= base_feed/(4.6631+0.0030*AA+0.0127*(0.022*MP))
#capacidade de carga Renata estipulou 1 cabeca/ha, ver se vai adaptar para 0,9 cab/ha

###Efeitos diretos no peso ao desmame;  
BASE = 197; WWd = 0;  #peso medio ao desmame nho = 187 kg
SV = 0.97;     #3% de mortalidade 0-1ano            - fornecido nho                                                             
SV1 = 0.99;    # demais categorias 1% de mortalidade *survival from calf to yrlg, and yrlg to 2yr-old; - fornecido nho

#*postweaning period para machos

sD1 = 100; sADG1 = 0.450; #*dry season; dias e gmd na seca
sD2 = 260; sADG2 = 0.838; #*rainy season;   dias e gmd nas aguas
#sD3 = 150; sADG3 = 1.523; #*dry season;
sD3 = 87; sADG3 = 1.523; #sD4 = 87; sADG4 = 1.523; # periodo de 87 dias em confinamento


#*and likewise for heifer calves;- periodo e gmd para novilhas no pos desmame
hD1 = 100; hADG1 = 0.300; 
hD2 = 260; hADG2 = 0.460; #*rainy season;   
#hD3 = 150; hADG3 = 1.523; #*dry season;
hD3 = 70; hADG3 = 1.294; #hD4 = 87; hADG4 = 1.523;



##### ParÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¢metros de carcaÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ§a;
DPh = 0.50; DPs = 0.54;   #*Rendimento de carcaÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ§a mÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ©dio por sexo;
CV_cwt = 0.06; CV_fat = 0.46; mu_fat = 2.5; r_cwtfat = 0.14;#dados de gordura na carcaca retirado PORTES
drea = 0.0;  #*deviation from mean EPD;
DPh = DPh + 0.0029*drea; # ajuste para rendimento de carcaÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ§a por ribeye area;
DPs = DPs + 0.0029*drea; #Baseado em USDA cutability formula;


#curva de crescimento para vacas de acordo com os perÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ­odos anuais;   
WTa = AA - (AA - BW)*exp(-k*365);
WTb = AA - (AA - BW)*exp(-k*730);
WTc = AA - (AA - BW)*exp(-k*1095);
WTd = AA - (AA - BW)*exp(-k*1460);
WTm = AA - (AA - BW)*exp(-k*1825); #aos 5 anos estabilizacao do peso adulto da vaca


######################################################################################
#### Matriz de Leslie #### 

# somente sÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ£o consideradas(sobrevivem) para a prÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ³xima etapa as vacas que tiveram sucesso reprodutivo
#SV_1= 0.781181095 para FF4=4069
#SV_1=0.8758628 para 15 anos
#SV_1=0.609211
SV_1=0.492075

SV2=0.975; # SobrevivÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂªncia incluindo culling at 2 yr
SV3=0.975; SV4=0.975; SV5= 0.8038; SV6= 0.6758; SV7=0.7518; SV8=0.7518;  
SV9=0.7518; SV10=0.7518; SV11=0.7518; SV12=0.7518; SV13=0.7518; SV14=0.7518;
# Age specific probability of producing female calf (only pregnant females enter the system, and hence, 
FF0 = 0.0; FF1 = 0.0; FF2 = 0.4; FF3=0.4; FF4=0.4; FF5=0.4; FF6=0.4; FF7=0.4; FF8=0.4; FF9=0.4; FF10=0.4; FF11=0.3; FF12=0.3; FF13=0.3; FF14=0.3;
#Age specific survival rates (on diagonal), and
#Age specific probability of producing female calf (on top row) 
A = matrix(c(FF0,FF1,FF2,FF3,FF4,FF5,FF6,FF7,FF8,FF9,FF10,
             SV_1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
             0, SV2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
             0, 0, SV3, 0, 0, 0, 0, 0, 0, 0, 0, 
             0, 0, 0, SV4, 0, 0, 0, 0, 0, 0, 0, 
             0, 0, 0, 0, SV5, 0, 0, 0, 0, 0, 0, 
             0, 0, 0, 0, 0, SV6, 0, 0, 0, 0, 0, 
             0, 0, 0, 0, 0, 0, SV7, 0, 0, 0, 0, 
             0, 0, 0, 0, 0, 0, 0, SV8, 0, 0, 0,
             0, 0, 0, 0, 0, 0, 0, 0, SV9, 0, 0, 
             0, 0, 0, 0, 0, 0, 0, 0, 0, SV10, 0), nr=11, byrow=TRUE)
A


### InventÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¡rio de heifer calves; 986374070
N1 = c(3370, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0); # note, equilibrium herd size scales with N1(1);
N1[1] = 3370*ccap;   #adjust initial number to account for relative feed reqt.;
N2=A
for (i in 2:500) N2=N2%*%A
N2 = N2%*%N1;  #e.g., 500 years;sum(N2)   #run for many cycles (500) of repro to get herd age distribution;
N2#total reproduction rate (i.e., double reproduction rate of females) also frst row of A;
R = 2*A[1,];
R
N2
calves1 = SV*(R*N2); #nÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂºmero de bezerros, by age class of dam;
calves1
cows =as.numeric(c(0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1))%*%N2; #*number of cows i.e., females 3 and older;
cows
calves = as.numeric(c(0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1))%*%calves1;  #*total number of calves produced, by age of dam;
calves

yrhf=round(c(0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0)%*%N2, 1);yrhf #yearling replacement heifers;

y2hf=round(c(0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0)%*%N2, 1);y2hf #*2-yr-old heifers;

#y3hf=round(c(0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,0,0,0,0)%*%N2, 1) #*3-yr-old heifers;
#y3hf
#y4hf=round(c(0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0,0,0,0,0)%*%N2, 1) #*4-yr-old heifers;first calve with 48 months
#y4hf
totalcows=round(c(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)%*%N2, 1)



yrst=round(SV1*calves/2, 1); yrst # *yearling steers held for harvest;
y2st=round(SV1*yrst, 1); y2st # *2-yr-old steers held for harvest;
#y3st=round(SV1*y2st, 1); y3st # *3-yr-old steers held for harvest;
#y4st=round(SV1*y3st, 1); y4st # *4-yr-old steers held for harvest;



yrhh=yrst-yrhf; yrhh # *yearling heifers held for harvest;
y2hh=round(SV1*(y2st-yrhf), 1); y2hh # *2-yr-old heifers held for harvest;
#y3hh=round(SV1*(y3st-y2hf), 1); y3hh # *3-yr-old heifers held for harvest;
#y4hh=round(SV1*(y4st-y3hf), 1); y4hh # *4-yr-old heifers held for harvest;

#compra de animais
compra=701
count= compra+cows+calves+yrhf+y2hf+yrst+yrhh+y2st+y2hh; count
MU_age = ((c(0, 0, 0, 0, 4, 5, 6, 7, 8, 9, 10))%*%N2)/cows; MU_age#*average age of cows;


Nstay=as.numeric(c(0,0,0,0,0,1,1,1,1,1,1)%*%N2) #number of cows 5 and older;
stay = round(100*Nstay/cows,2); stay #stayability;
#carcass price grid information; - desconto na precificacao da carcaca ao estrapolar os limites
cw_lo = 550; cwp_lo = -30; # carcass wt below cw_lo is discounted by cwp_lo
cw_hi = 950; cwp_hi = -20; # carcass wt above cw_hi is discounted by cwp_hi
cw_vh = 1000; cwp_vh = -20; # carcass wt above cw_vh is discounted by cwp_vh




####################################################################################
#peso ao desmame, by sex and age of dam;
WW = BASE + WWd + WWm;
age_of_dam = c(0, 0, 0, 0.90, 0.95, 1, 1, 1, 1, 1, 1);
WWt = age_of_dam*WW;WWt
WWTs = 1.04*(WWt); WWTs #machos
WWTh = 0.97*(WWt);WWTh  #fÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂmeas

WWTs
###peso mÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ©dio ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ  desmama, by sex;
pc = calves1%*%solve(calves); #porcentagem de bezerros por ano
WTs0 = (WWTs)%*%pc;
WTh0 = (WWTh)%*%pc;


###crescimento pÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ³s desmama;
WTs1 = WTs0 + sD1*sADG1; 
WTs2 = WTs1 + sD2*sADG2; 
WTs3 = WTs2 + sD3*sADG3; 
#WTs4 = WTs3 + sD4*sADG4;######################## AtenÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ§ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ£o!!!
#WTs5 = WTs4 + sD5*sADG5; 
#WTs6 = WTs5 + sD6*sADG6; 
#WTs7 = WTs6 + sD7*sADG7; 
#WTs8 = WTs7 + sD8*sADG8;

WTh1 = WTh0 + hD1*hADG1; 
WTh2 = WTh1 + hD2*hADG2; 
WTh3 = WTh2 + hD3*hADG3;
#WTh4 = WTh3 + hD4*hADG4;#############
#WTh5 = WTh4 + hD5*hADG5; 
#WTh6 = WTh5 + hD6*hADG6; 
#WTh7 = WTh6 + hD7*hADG7; 
#WTh8 = WTh7 + hD8*hADG8;

####################################################################################
################  COMPUTANDO UNIDADES ANIMAL;
AU_cows = WTc%*%N2[4] + WTd%*%N2[5] + WTm%*%(N2[6]+N2[7]+N2[8]+N2[9]+N2[10]+N2[11]);
AU_cows = AU_cows/(N2[4]+N2[5]+N2[6]+N2[7]+N2[8]+N2[9]+N2[10]+N2[11]);
AU_cows = cows%*%AU_cows/450;
AU_cows


AU_hfrs = (yrhf+yrhh)*(((hD1/365)*0.5*(WTh0+WTh1)/450) + ((hD2/365)*0.5*(WTh1+WTh2)/450)) + 
  (y2hf+y2hh)*(((hD3/365)*0.5*(WTh2+WTh3)/450)) #+ ((hD4/365)*0.5*(WTh3+WTh4)/450));


AU_strs =  yrst*(((sD1/365)*0.5*(WTs0+WTs1)/450) + ((sD2/365)*0.5*(WTs1+WTs2)/450)) + 
  y2st*(((sD3/365)*0.5*(WTs2+WTs3)/450))# + ((sD4/365)*0.5*(WTs3+WTs4)/450));#+
# y3st*(((sD5/365)*0.5*(WTs4+WTs5)/450) + ((sD6/365)*0.5*(WTs5+WTs6)/450))+
#  y4st*(((sD7/365)*0.5*(WTs6+WTs7)/450) + ((sD8/365)*0.5*(WTs7+WTs8)/450));


#AU_compra=

Anim_units = AU_cows + AU_hfrs + AU_strs; Anim_units

######################
### Descarte
############ Vacas para venda;
cull_wt = AA + dA;
mu_cwt = DPh*cull_wt; sd_cwt = CV_cwt*mu_cwt; sd_fat = CV_fat*mu_fat

V = matrix(rep(0,4),2,2)
V
V[1,1] = sd_cwt^2;
V[1,2] = r_cwtfat*sd_cwt*sd_fat;
V[2,1] = V[1,2];
V[2,2] = sd_fat^2;
T = chol(V) # T= true is a logical vectors (Create or test for objects of type "logical", and the basic logical constants.)
#Chol = the choleski decomposition
ncull = round(0.5*y2hf, 1); ncull

####################################################################################
##### Para informar o n?mero de animais vendidos informado por Corr?a 2006 foi feito o seguinte ajuste:
sold=2905 # n?mero de animais vendidos

###  RETIRAR    ANIMAIS COMPRADOS ?
##
#### Adicionei os animais machos comprados

replacement_heifers=compra+y2hh+y2hf+y2st+ncull-sold; replacement_heifers
harvest_heifers=y2hh+y2hf- replacement_heifers; harvest_heifers



####################################################################################
### Arredondamento dos valores gerados ############################
count = round(count, 1.);  cows = round(cows, 1.);  MU_age = round(MU_age, 0.1); calves = round(calves, 1.)

N2 = round(N2, 1); calves1 = round(calves1, 1)
#WTa = round(WTa, 1); WTb = round(WTb, 1); WTc = round(WTc, 1); WTd = round(WTd, 1); WTm = round(WTm, 1)
#WTs0 = round(WTs0, 1); WTs1 = round(WTs1, 1); WTs2 = round(WTs2, 1); WTs3 = round(WTs3, 1); #WTs4 = round(WTs4, 1);# WTs5 = round(WTs5, 1); WTs6 = round(WTs6, 1); WTs7 = round(WTs7, 1); WTs8 = round(WTs8, 1);
#WTh0 = round(WTh0, 1); WTh1 = round(WTh1, 1); WTh2 = round(WTh2, 1); WTh3 = round(WTh3, 1); #WTh4 = round(WTh4, 1); #WTs5 = round(WTh5, 1); WTh6 = round(WTh6, 1); WTh7 = round(WTh7, 1); WTh8 = round(WTh8, 1);



###################################################################################

##                     Valor econ?mico                   ##

###################################################################################

#day_rent= 0.72 #valor retirado dos dados da tabela e aplicados na formula descrita na tese
valor_arroba = 251.09
cprice = valor_arroba/15;cprice;# receita por kilo



## Custos alimentares

# para separar o custo total alimentar por categorias
# 1 passo: foi fornecido pela fazenda o custo diario alimentar e a media em dias na fase de terminacao
# esses dados foram aplicados no volume de animais terminados em confinamento (bois, novilhas e compras)


#custo alimentar - fase TERMINACAO CONFINAMENTO - BOIS e NOVILHAS
cost_day_conf = 10.65 #custo da diaria alimentar no confinamento - fonecido pela fazenda

days_conf_m = 87 # media de dias de confinamento - fornecido pela fazenda 

cost_total_conf_y2st_compra = (cost_day_conf*days_conf_m)*(y2st+compra)

#custo alimentar de femeas terminadas
days_conf_f = 70 # media de dias de confinamento - fornecido pela fazenda 

cost_total_conf_y2hh  = (cost_day_conf*days_conf_f)*(y2hh)

cost_total_conf = cost_total_conf_y2st_compra+cost_total_conf_y2hh

cost_total_conf

#o custo total do confinamento foi travado na diaria 10,65

#custo alimentar - fase TERMINACAO PASTO - vacas descartes 

cost_day_past = 1.05 #custo da diaria alimentar a pastoo terminacao- fonecido pela fazenda
days_past = 80

cost_total_cowscull = (cost_day_past*days_past)*ncull



#geracao do custo total da fase de terminacao (confinamento + pasto)

cost_total_term = cost_total_cowscull + cost_total_conf

cost_total_term

#CUSTO ALIMENTAR - fase recria - machos e femeas de 0 a 12 e 12 a 24 m
custo_kg_m012 = 0.3253
custo_kg_m1224 = 0.6506
custo_kg_f012 = 0.3253
custo_kg_f1224 = 0.7049


custo_m_012 = ((WTs0+WTs1)/2)*custo_kg_m012
custo_total_m012 = custo_m_012*yrst

custo_f_012 = ((WTh0+WTh1)/2)*custo_kg_f012
custo_total_f012 = custo_f_012*(yrhh+yrhf)

custo_m_1224 = ((WTs1+WTs2)/2)*custo_kg_m1224
custo_total_m1224 = custo_m_1224*(y2st+compra)

custo_f_1224 = ((WTh1+WTh2)/2)*custo_kg_f1224
custo_total_f1224 = custo_f_1224*(y2hh+y2hf)

custo_total_recria = custo_total_m012 +custo_total_f012 + custo_total_f1224 + custo_total_m1224

cost_feed_an = cost_total_term + custo_total_recria

#custo alimentar da fase de CRIA

# no sistema de producao da fazenda as vacas permanecem em pastos nativos do pantanal
# no pantanal, nao tem reforma de pastagem, portanto, sem gastos forrageiros
# o custo que seria alimentar para a cria seria o MINERAL

cost_total_feed_cows = 379128.50 #custo com mineral

cost_day_feed_per_cow = (cost_total_feed_cows/cows)/365

cost_day_feed_per_cow

cost_feed = cost_total_feed_cows + cost_feed_an

cost_feed

#geracao de custos nao alimentares
non_feed_cost = ccap*(21*cost_feed/79);     # 38% de custos alimentares e 62% de custos n?o alimentares segundo beef report

non_feed_cost

# *total cost;
variable_cost= cost_feed+non_feed_cost; variable_cost
custo_fixo = 1.30*count*365 #planilha de entrada forneceu

Total_cost = cost_feed + non_feed_cost + custo_fixo
Total_cost 

#esses custos foram lancados no excel

##economics for carcass end-point income;
#summary statistics initialized to zeros;
inc_hfr = 0.0; inc_str = 0.0; inc_cow = 0.0;
hf_arrobas = 0; st_arrobas = 0; cc_arrobas = 0;

#####################################################################################
#harvest surplus heifers;
mu_cwt = DPh*WTh3; 
sd_cwt = CV_cwt*mu_cwt; 
mu_fat
sd_fat = CV_fat*mu_fat;

V = matrix(rep(0,4),2,2)
V
V[1,1] = sd_cwt^2;
V[1,2] = r_cwtfat*sd_cwt*sd_fat;
V[2,1] = V[1,2];
V[2,2] = sd_fat^2;
T = chol(V);

for (i in 1:harvest_heifers) {
  flag=0
  while(flag==0) {
    r1=rnorm(1);
    r2=rnorm(1);
    # phenotypes for each heifer
    cwt = mu_cwt + T[1,1]*r1;
    fat = mu_fat + T[1,2]*r1 + T[2,2]*r2;
    #fat = round(fat, 1);
    #check for bad sample from random number generator
    if (((cwt>0)&(cwt<1250))
        & ((fat>0)&(fat<6))) flag = 1;
  }
  # Discrimina??o do pre?o da carca?a
  bonus = 0 #2/15;#ajuste do pre?o da carca?a de acordo com cwt=carcass weight e fat
  if(fat <= 1) bonus = 0;
  if(fat >= 5) bonus = 0;
  if(bonus==2/15){
    if(fat>=3 & fat<= 4) bonus= 0 #5/15
  }
  if(bonus==0){
    if(cwt<225) bonus = 0;
    if(cwt>390) bonus = 0;
    
    if(cwt>240 & cwt<330) bonus = 0
  }
  value = (cprice + bonus)%*%cwt;
  hf_arrobas = hf_arrobas + cwt/15;
  inc_hfr = inc_hfr + value
}
inc_hfr
hf_avg_wt = hf_arrobas/harvest_heifers
hf_avg_pr = (inc_hfr/harvest_heifers)/hf_avg_wt
hf_avg_pr

###################################################################################
### novilhos;
mu_cwt = DPs*WTs3; sd_cwt = CV_cwt*mu_cwt; sd_fat = CV_fat*mu_fat;
V = matrix(rep(0,4),2,2)
V
V[1,1] = sd_cwt^2;
V[1,2] = r_cwtfat*sd_cwt*sd_fat;
V[2,1] = V[1,2];
V[2,2] = sd_fat^2;
T = chol(V);
T

y2st_receita = (y2st-100)+(compra)
#foram debitados 100 reprodutores que entrarao na receita separadamente, e foram somados os animais comprados

for (i in 1:y2st_receita) {
  flag=0
  while(flag==0) {
    r1=rnorm(1);
    r2=rnorm(1);
    # phenotypes for each heifer
    cwt = mu_cwt + T[1,1]*r1;
    fat = mu_fat + T[1,2]*r1 + T[2,2]*r2;
    #fat = round(fat, 1);
    #check for bad sample from random number generator
    if (((cwt>0)&(cwt<1250))
        & ((fat>0)&(fat<6))) flag = 1;
  }
  # Discrimina??o do pre?o de cada carca?a
  bonus = 0;#ajuste do pre?o da carca?a de acordo com cwt=carcass weight e fat
  if(fat <= 1) bonus = 0;
  if(fat >= 5) bonus = 0;
  if(fat>=3 & fat<= 4) bonus=0
  
  if(bonus==2/15){
    if(cwt<225) bonus = 0;
    if(cwt>390) bonus = 0;
    if(cwt>240 & cwt<330) bonus=0
  }
  value = (cprice + bonus)%*%cwt;
  st_arrobas = st_arrobas + cwt/15;
  inc_str = inc_str + value
}

st_avg_wt = st_arrobas/y2st_receita;
st_avg_pr = (inc_str/y2st_receita)/st_avg_wt



####################################################################################
############ harvest cull cows;
cull_wt = AA + dA;
mu_cwt = DPh*cull_wt; sd_cwt = CV_cwt*mu_cwt; sd_fat = CV_fat*mu_fat

V = matrix(rep(0,4),2,2)
V
V[1,1] = sd_cwt^2;
V[1,2] = r_cwtfat*sd_cwt*sd_fat;
V[2,1] = V[1,2];
V[2,2] = sd_fat^2;
T = chol(V) # T= true is a logical vectors (Create or test for objects of type "logical", and the basic logical constants.)
#Chol = the choleski decomposition
#ncull = round(0.5*y2hf, 1); ncull

for (i in 1:ncull) {
  flag=0
  while(flag==0) {
    r1=rnorm(1);
    r2=rnorm(1);
    # phenotypes for each heifer
    cwt = mu_cwt + T[1,1]*r1;
    fat = mu_fat + T[1,2]*r1 + T[2,2]*r2;
    #fat = round(fat, 1);
    #check for bad sample from random number generator
    if (((cwt>0)&(cwt<1250))
        & ((fat>0)&(fat<6))) flag = 1;
  }
  # Discrimina??o do pre?o de cada carca?a
  bonus = 0;#ajuste do pre?o da carca?a de acordo com cwt=carcass weight e fat
  if(fat <= 1) bonus = 0;
  if(fat >= 5) bonus = 0;
  if(cwt<180) bonus=0;
  
  if(bonus==0){
    if(cwt>165 & fat==2) bonus=0
  }
  value = 0.90*(cprice + bonus)%*%cwt;
  cc_arrobas = cc_arrobas + cwt;
  inc_cow = inc_cow + value
}

cc_arrobas = cc_arrobas/15;
cc_avg_wt = cc_arrobas/ncull;
cc_avg_pr = (inc_cow/ncull)/cc_avg_wt
compra_bezerros= 909195
####################
venda_reprodutores=100*8978.27
repro_arrobas = venda_reprodutores/valor_arroba

#########################################################################################
arrobas = hf_arrobas + st_arrobas + cc_arrobas + repro_arrobas;arrobas

Income = inc_hfr + inc_str + inc_cow + venda_reprodutores;Income
Profit = Income - (Total_cost+compra_bezerros);Profit
AUnits = AU_cows+AU_hfrs+AU_strs;AUnits
Income_per_AU = Income/AUnits;Income_per_AU
Income_per_arrobas = Income/arrobas;Income_per_arrobas
Expense_per_AU = (Total_cost+compra_bezerros)/AUnits;Expense_per_AU
Expense_per_arrobas = (Total_cost+compra_bezerros)/arrobas;Expense_per_arrobas
Profit_per_AU = Profit/AUnits;Profit_per_AU
Profit_per_arrobas = Profit/arrobas;Profit_per_arrobas

######################################################################
###   Arredondamento
#Income = round(Income, 0.01); cost_feed = round(cost_feed, 0.01); Total_cost = round(Total_cost, 0.01); Profit = round(Profit, 0.01)

#hf_avg_wt = round(hf_avg_wt, .1);  hf_avg_pr = round(hf_avg_pr, .01) 
#st_avg_wt = round(st_avg_wt, .1);  st_avg_pr = round(st_avg_pr, .01)
#cc_avg_wt = round(cc_avg_wt, .1);  cc_avg_pr = round(cc_avg_pr, .01)

