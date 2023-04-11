
% The Black-Scholes Model
% Equation 15.20 & 15.21

function BS_Value = BS (S0,K,r,q,sigma,T,OptionType) 

d1=(log(S0/K)+(r-q+0.5*sigma*sigma)*T)/(sigma*sqrt(T));
d2=(log(S0/K)+(r-q-0.5*sigma*sigma)*T)/(sigma*sqrt(T));


if (OptionType=='p')
    BS_Value=K*exp(-r*T)*normcdf(-d2,0,1)-S0*exp(-q*T)*normcdf(-d1,0,1);
else
    BS_Value=S0*exp(-q*T)*normcdf(d1,0,1)-K*exp(-r*T)*normcdf(d2,0,1);
end;