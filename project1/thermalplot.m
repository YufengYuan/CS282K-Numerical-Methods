function thermalplot(x)
pcolor(x');
shading interp;
caxis([min(min(x)) max(max(x))]);
%caxis([1000000 1000000000]);
colorbar;
xlabel('X Axis');
ylabel('Y Axis');