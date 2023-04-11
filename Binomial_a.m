NT=252;
T=2;
S0=50;
K=52;
r=0.05;
q=0;
sigma=0.3;

dt=T/NT;
u=exp(sigma*sqrt(dt));
d=1/u;
a=exp((r-q)*dt);
p=(a-d)/(u-d);

ans=[u, d, p]