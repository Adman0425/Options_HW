clear;

T=2;
S0=50;
K=52;
r=0.05;
q=0;
sigma=0.3;
OptionType='p';
ExerciseType='e';


N_Steps=252;
Option_Value=zeros(N_Steps,1);

for i=1:N_Steps;
    NT=i
    Option_Value(i)=Binomial_BS(S0,K,r,q,sigma,T,OptionType,ExerciseType,NT)
end;

BS=BS(S0,K,r,q,sigma,T,OptionType);
BS_plot=BS*ones(N_Steps,1);
plot(1:N_Steps,Option_Value',1:N_Steps,BS_plot);
xlim([0,250]);