clear;

NT=252;
T=2;
S0=50;
K=52;
r=0.05;
q=0;
sigma=0.3;
OptionType='p';
ExerciseType='a';


N_Steps=252;
Option_Value=zeros(N_Steps,1);


Option_Value=Binomial_BS(S0,K,r,q,sigma,T,OptionType,ExerciseType,NT);
BS=BS(S0,K,r,q,sigma,T,OptionType);