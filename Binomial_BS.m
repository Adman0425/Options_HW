function Binomial_Value=Binomial_BS(S0,K,r,q,sigma,T,OptionType,ExerciseType,NT)



dt=T/NT;
u=exp(sigma*sqrt(dt));
d=1/u;
a=exp((r-q)*dt);
p=(a-d)/(u-d);

f=zeros(NT+1,NT+1);


% Option Prices at maturity
for j=0:NT;
    if(OptionType=='p')
        %put
        f(NT+1,j+1)=max(K-S0*(u^j)*(d^(NT-j)),0);
    else
 %call
        f(NT+1,j+1)=max(S0*(u^j)*(d^(NT-j))-K,0);
    end;
end;



% Backward Induction
for i=(NT-1):-1:0; 
for j = 0:i;
        if (OptionType=='p')
            if(ExerciseType=='a')
                % Put American 
                EV=max(K-S0*(u^j)*(d^(i-j)),0);
                f(i+1,j+1)=max(EV,exp(-r*dt)*(p*f(i+2,j+2)+(1-p)*f(i+2,j+1)));
            else
                % Put European
                EV=0;
                f(i+1,j+1)=max(EV,exp(-r*dt)*(p*f(i+2,j+2)+(1-p)*f(i+2,j+1)));
            end;
        else
            if(ExerciseType=='a')
                % Call American
                EV=max(S0*(u^j)*(d^(i-j))-K,0);
                f(i+1,j+1)=max(EV,exp(-r*dt)*(p*f(i+2,j+2)+(1-p)*f(i+2,j+1)));
            else
                % Call European
                EV=0;
                f(i+1,j+1)=max(EV,exp(-r*dt)*(p*f(i+2,j+2)+(1-p)*f(i+2,j+1)));
            end;
        end;
    end;
end;

Binomial_Value=f(1,1)