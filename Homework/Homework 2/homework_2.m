clear;
clc;

%% problem 2
n=10;
Aout=zeros(1,8);
for k=1:n
    j=1;
    for i=0:0.25:1.75
        Aout(j)=0.5 + 0.5*sin(i*pi);
        j=j+1;
    end
    if k==1
        out=Aout;
    else
        out=[out Aout];
    end
end
t=[0:0.001:0.008*n-0.001];

%figure;
%scatter(t,out,'.')



figure;
stairs(t,(0.5+0.5*sin(t*pi*250))*3.3,'LineWidth',1)
grid on;
set(gca,'FontSize',7);
ylim([-0.1 3.5]);
xlim([0 0.08]);
xlabel('T(s)');
ylabel('Voltages(v)');
title('Output Signal');
set(gca,'XTick',0:0.005:0.08); 
set(gca,'YTick',-0.1:0.2:3.5);
saveas(gca,'2.pdf');
%% problem 3－1
clear;

% t=[1:11];
% u=[ 1 1 0 1 0 0 0 1 1 0 1 ];

%{
figure;
stairs(t,u,'b','LineWidth',2);
ylim([-1 2])
hold on;
stairs(t(1:2),u(1:2),'r','LineWidth',2);
hold on;
stairs(t(10:11),u(10:11),'r','LineWidth',2);
%}



clear;

t=[1:12];
u=[ 1 1 1 0 0 0 1 0 1 1 1 1];


%{
figure;
stairs(t,u,'b','LineWidth',2);
ylim([-1 2])
hold on;
stairs(t(1:2),u(1:2),'r','LineWidth',2);
hold on;
stairs(t(10:11),u(10:11),'r','LineWidth',2);
%}

[u,t]=prosess(u,t);
t=[t(2)-1.6666 t(2)-1.3333 t(2)-0.3333 t(2:length(t)-1)];
t=t+0.5;
t=[0 t];
u=[1 1 0 0 u(2:length(u)-1)];

figure;
plot(t,u,'LineWidth',1.5);
ylim([-0.5 1.5]);
xlim([-0 12])
set(gca,'XTick',0:0.5:12); 
set(gca,'YTick',0:0.2:1);
set(gca,'FontSize',7);
xlabel('T(s)');
ylabel('Waveform of pin9');
title('Output waveform of pin9');
grid on;
saveas(gca,'3-1.pdf');


%% problem 3－2

c=[0.5:15.5];
C=[0 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0];
[C,c]=prosess(C,c);

C=[0 0 C 0 0 1 1 0 0];
c=[c(1)-0.3333 c(1) c(2)-0.3333 c(2:length(c)-1) c(length(c))-0.3333 c(length(c)) c(length(c))+0.3333 c(length(c))+0.3333*2 c(length(c))+0.3333*4 c(length(c))+0.3333*5 c(length(c))+0.3333*6];


t=[1:18];
s=[0 1 1 0 0 1 1 0 0 0 0 0 0 1 1 1 1 0];
[s,t]=prosess(s,t);
s=[0 0 s(2:length(s)) 0];
t=[t(1) t(1)+0.3333 t(2:length(t)-1) t(length(t))-0.3333 t(length(t))];
t=t-(t(6)-c(7));


figure;
subplot(2,1,1);
plot(t,s,'LineWidth',1.5);
ylim([-0.5 1.5]);
xlim([-1 19]);
set(gca,'XTick',0:1:19); 
set(gca,'YTick',0:0.2:1);
set(gca,'FontSize',7);
xlabel('T(s)');
ylabel('Waveform of pin11');
title('Output waveform of pin11');
grid on;


subplot(2,1,2);
plot(c,C,'LineWidth',1.5);
ylim([-0.5 1.5]);
xlim([-1 19]);
set(gca,'XTick',0:1:19); 
set(gca,'YTick',0:0.2:1);
set(gca,'FontSize',7);
xlabel('T(s)');
ylabel('Waveform of pin13');
title('Output waveform of pin13');
grid on;

saveas(gca,'3-2.pdf');


figure;
plot(t,s,'LineWidth',1.5);
hold on;
plot(c,C,'LineWidth',0.8);
ylim([-0.5 1.5]);
xlim([-1 19]);
set(gca,'XTick',0:1:19); 
set(gca,'YTick',0:0.5:1);
set(gca,'FontSize',7);
xlabel('T(s)');
ylabel('Waveform');
title('Output waveform of pin11&pin13');
grid on;


%% problem 4
p5=[0 1 0 0];
t5=[0 0.73 0.97 2];

l1=[1 0 1 0 1 0 1 0 1 0 0];
t1=[0 0.2 0.4 0.6 0.8 1.0 1.2 1.4 1.6 1.8 2];


l2=[0 1 0 0];
t2=[0 1.03 1.53 2];


l3=[0 1 0 0];
t3=[0 0.73 0.8 2];


figure;
subplot(4,1,1);
stairs(t5,p5,'Color',[0.8 0.2 0.2],'LineWidth',1);
ylim([-0.2 1.2]);
xlim([-0.1 2.1]);
set(gca,'FontSize',7);
set(gca,'XTick',0:0.1:2); 
set(gca,'YTick',0:0.5:1);
title('Input waveform of p5');
xlabel('T(s)');
ylabel('Waveform');
grid on;


subplot(4,1,2);
stairs(t1,l1,'Color',[0.1 0.43 0.7],'LineWidth',1);
ylim([-0.2 1.2]);
xlim([-0.1 2.1]);
set(gca,'FontSize',7);
set(gca,'XTick',0:0.1:2); 
set(gca,'YTick',0:0.5:1);
title('Output waveform of pin LED1');
xlabel('T(s)');
ylabel('Waveform');
grid on;

subplot(4,1,3);
stairs(t2,l2,'Color',[0.1 0.43 0.7],'LineWidth',1);
ylim([-0.2 1.2]);
xlim([-0.1 2.1]);
set(gca,'FontSize',7);
set(gca,'XTick',0:0.1:2); 
set(gca,'YTick',0:0.5:1);
title('Output waveform of pin LED2');
xlabel('T(s)');
ylabel('Waveform');
grid on;

subplot(4,1,4);
stairs(t3,l3,'Color',[0.1 0.43 0.7],'LineWidth',1);
ylim([-0.2 1.2]);
xlim([-0.1 2.1]);
set(gca,'FontSize',7);
set(gca,'XTick',0:0.1:2); 
set(gca,'YTick',0:0.5:1);
title('Output waveform of pin LED3');
xlabel('T(s)');
ylabel('Waveform');
grid on;
saveas(gca,'4.pdf');

