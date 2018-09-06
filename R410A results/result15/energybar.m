function [dEnergy] = energybar(mat_file,datetext)

load(mat_file)
eng = EATNetKwh(1:1080);
hourly_energy = max(reshape(eng-eng(1),60,18));
dEnergy = diff(hourly_energy);
t = round(hhminsec(1)*24)+1:round(hhminsec(1)*24)+length(dEnergy);
bar(t,dEnergy)
set(gca,'xlim',[0.5,23.5],'fontsize',14)
xlabel('Number of hours')
ylabel('Hourly electrical energy, Kwh')
title(['Hourly Electrical Energy / ' datetext])
set(gca,'ygrid','on','xgrid','off')