Year=[2009 2010 2011 2012 2013 2014 2015 2016 2017 2018];
DB11=[0.5 9.36 52 191 350 571 812 1207 1682 2135];
figure,plot(Year,DB11);
p2=polyfit(Year,DB11,2);
PB11=polyyal(p2,Year);
plot(Year,DB11,':or',Year,PB11,'-*b');
figure,plot(Year,DB11-PB11);
ployyal(p2,2019)