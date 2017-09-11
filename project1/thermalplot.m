function thermalplot(x)
pcolor(x');
shading interp;
caxis([min(min(x)) max(max(x))]);
colorbar;
xlabel('X Axis');
ylabel('Y Axis');