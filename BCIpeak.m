%process one file
A=dlmread('01-101F.txt');
B=A([2 4 8 16],[10 11]);%extract amplitude and latency from Fz, Cz, Pz, Oz (channel 1, 2, 4, 8 in Ccap)
csvwrite('peak.csv',B)
%loop through multiple files
files = dir('*.txt') ;    % in folder of txt files
N = length(files) ;   % total number of files  
for i = 1:N
    thisfile = files(i).name ;
    t = importdata(thisfile);
    B=t([2 4 8 16],[10 11]);
%     xlswrite(sprintf('peak_%s.xlsx',thisfile(1:end-4)),B);
save(sprintf('peak_%s.mat',thisfile(1:end-4)),'B');% using save, have to convert variable B into string
end
%combine .mat files into one file
d=dir('*.mat');
x=[];            % start w/ an empty array
for i=1:length(d)
x=[x; load(d(i).name)];   % read/concatenate into x
end
save('newfile.mat',x)