%
%  Ising2.m
%  大作业
%
%  Created by Yuan Leiqi (袁磊祺) on 2021/6/19.
%

clear;clc;close all;
set(0,'defaultlinelinewidth',3)
set(0,'defaultaxeslinewidth',2);
set(0,'defaultaxesfontsize',28);
set(0,'defaulttextfontsize',28);
set(0,'DefaultLineMarkerSize',2);
set(0,'Defaultaxesfontname','Times New Roman');
% addpath('./circleData');
% set(gcf,'unit','centimeters','position',[20 20 20 20])
% figure(); box on;
% plot(x/D,W0_axi,'-');
% xlabel('$x/D$','interpreter','latex');
% ylabel('$U_0$','interpreter','latex');

% saveas(gcf,'Re_80_U0_axi','epsc')
%%

global J num sig dire T
num = 20;
N = 1e7;
J = 1;
sig = ones(num, num);
ave_sig = ones(6, 1);
Tn = 1;

for T = [0.1, 1, 2, 3, 4, 5]
    sig = ones(num, num);
    mean_sig = zeros(N, 1);
    disp(T);
    for i = 1 : N
        rand1 = randi(num);
        rand2 = randi(num);
        Add = ones(num, num);
        Add(rand1, rand2) = -1;
        dire = sig(rand1, rand2);
        Add = IfAddPoint(Add, rand1, rand2);
        sig = sig.*Add;
        mean_sig(i) = mean(mean(sig));

    end
    ave_sig(Tn) = mean(mean_sig(floor(0.2*N):N));
    Tn = Tn + 1;
    figure(); box on;
    plot(mean_sig);
    title(sprintf('$T= $ %0.2f', T),'interpreter','latex')
    xlabel('$N$','interpreter','latex');
    ylabel('$\sigma_i$','interpreter','latex');
    set(gcf,'unit','centimeters','position',[20 20 30 20])
    saveas(gcf,strcat('2D/meansig','T', num2str(T),'.eps'),'epsc')

end

figure(); box on;
plot([0.1, 1, 2, 3, 4, 5], abs(ave_sig));
title(sprintf('$N= $ %0.0f', N),'interpreter','latex')
xlabel('$T$','interpreter','latex');
ylabel('$<\sigma_i>$','interpreter','latex');
set(gcf,'unit','centimeters','position',[20 20 30 20])
saveas(gcf,'2D/avesig.eps','epsc')

save 2D/ave_sig.mat ave_sig


function [Add] = IfAddPoint(Add, rand1, rand2)
    global num sig dire T J
    for i = [-1, 1]
        new1 = mod(rand1+i-1, num)+1;
        if Add(new1, rand2) == 1
            if sig(new1, rand2) == dire 
                if rand() < 1 - exp(-2*J/T)
                    % if add, turn the point in Add to -1, so if Add times sig, it will change the direction of sig.
                    Add(new1, rand2) = -1;
                    Add = IfAddPoint(Add, new1, rand2);
                end
            end
        end
    end
    for j = [-1, 1]
        new2 = mod(rand2+j-1, num)+1;
        if Add(rand1, new2) == 1
            if sig(rand1, new2) == dire 
                if rand() < 1 - exp(-2*J/T)
                    % if add, turn the point in Add to -1, so if Add times sig, it will change the direction of sig.
                    Add(rand1, new2) = -1;
                    Add = IfAddPoint(Add, rand1, new2);
                end
            end
        end
    end 
end
