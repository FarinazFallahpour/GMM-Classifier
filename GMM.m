% Farinaz Fallahpour
% Date: 2011 
% https://github.com/FarinazFallahpour
function GMM()
clc;clear all;
[vehicle_data vehicle_label]=load_vehicle();vehicle_data=normalize(vehicle_data);
[heart_data heart_label]=load_heart();heart_data=normalize(heart_data);
[diabets_data diabets_label]=load_diabets();diabets_data=normalize(diabets_data);
err_heart=[,];err_diabets=[,];err_vehicle=[,];
component=33;
cv_size=10; %Cross Validaion Size cv_size=10 ==>ten-time-ten-fold
for k=1:2:component
    [train test]=GMM_Check(heart_data,heart_label,cv_size,k);
    err_heart=[err_heart;train test];    
    [train test]=GMM_Check(diabets_data,diabets_label,cv_size,k);
    err_diabets=[err_diabets;train test];    
    [train test]=GMM_Check(vehicle_data,vehicle_label,cv_size,k);
    err_vehicle=[err_vehicle;train test];
end

plot(1:2:component,err_heart(:,1),'b',1:2:component,err_heart(:,2),'r');
legend('Error Train','Error Test');ylabel('error');xlabel('components');title('Heart Dataset');figure;hold off;
plot(1:2:component,err_diabets(:,1),'b',1:2:component,err_diabets(:,2),'r');
legend('Error Train','Error Test');ylabel('error');xlabel('components');title('Diabetes Dataset');figure;hold off;
plot(1:2:component,err_vehicle(:,1),'b',1:2:component,err_vehicle(:,2),'r');
legend('Error Train','Error Test');ylabel('error');xlabel('components');title('Vehicle Dataset');

end

function [data label]=load_vehicle()
f=fopen('xaa.dat');temp=textscan(f,'%d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d  %s');fclose(f);
data=[temp{1} temp{2} temp{3} temp{4} temp{5} temp{6} temp{7} temp{8} temp{9} temp{10} temp{11} temp{12} temp{13} temp{14} temp{15} temp{16} temp{17} temp{18} ];
label=[temp{19}];
f=fopen('xab.dat');temp=textscan(f,'%d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d  %s');fclose(f);
data=[data; [temp{1} temp{2} temp{3} temp{4} temp{5} temp{6} temp{7} temp{8} temp{9} temp{10} temp{11} temp{12} temp{13} temp{14} temp{15} temp{16} temp{17} temp{18} ]];
label=[label; [temp{19}]];
f=fopen('xac.dat');temp=textscan(f,'%d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d  %s');fclose(f);
data=[data; [temp{1} temp{2} temp{3} temp{4} temp{5} temp{6} temp{7} temp{8} temp{9} temp{10} temp{11} temp{12} temp{13} temp{14} temp{15} temp{16} temp{17} temp{18} ]];
label=[label; [temp{19}]];
f=fopen('xad.dat');temp=textscan(f,'%d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d  %s');fclose(f);
data=[data; [temp{1} temp{2} temp{3} temp{4} temp{5} temp{6} temp{7} temp{8} temp{9} temp{10} temp{11} temp{12} temp{13} temp{14} temp{15} temp{16} temp{17} temp{18} ]];
label=[label; [temp{19}]];
f=fopen('xae.dat');temp=textscan(f,'%d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d  %s');fclose(f);
data=[data; [temp{1} temp{2} temp{3} temp{4} temp{5} temp{6} temp{7} temp{8} temp{9} temp{10} temp{11} temp{12} temp{13} temp{14} temp{15} temp{16} temp{17} temp{18} ]];
label=[label; [temp{19}]];
f=fopen('xaf.dat');temp=textscan(f,'%d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d  %s');fclose(f);
data=[data; [temp{1} temp{2} temp{3} temp{4} temp{5} temp{6} temp{7} temp{8} temp{9} temp{10} temp{11} temp{12} temp{13} temp{14} temp{15} temp{16} temp{17} temp{18} ]];
label=[label; [temp{19}]];
f=fopen('xag.dat');temp=textscan(f,'%d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d  %s');fclose(f);
data=[data; [temp{1} temp{2} temp{3} temp{4} temp{5} temp{6} temp{7} temp{8} temp{9} temp{10} temp{11} temp{12} temp{13} temp{14} temp{15} temp{16} temp{17} temp{18} ]];
label=[label; [temp{19}]];
f=fopen('xah.dat');temp=textscan(f,'%d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d  %s');fclose(f);
data=[data; [temp{1} temp{2} temp{3} temp{4} temp{5} temp{6} temp{7} temp{8} temp{9} temp{10} temp{11} temp{12} temp{13} temp{14} temp{15} temp{16} temp{17} temp{18} ]];
label=[label; [temp{19}]];
f=fopen('xai.dat');temp=textscan(f,'%d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d  %s');fclose(f);
data=[data; [temp{1} temp{2} temp{3} temp{4} temp{5} temp{6} temp{7} temp{8} temp{9} temp{10} temp{11} temp{12} temp{13} temp{14} temp{15} temp{16} temp{17} temp{18} ]];
label=[label; [temp{19}]];
temp=zeros(size(label,1),1);
for i=1:size(label,1)
    if strcmp(label(i,1),'van')==1
        temp(i,1)=1;
    elseif strcmp(label(i,1),'saab')==1
        temp(i,1)=2;
    elseif strcmp(label(i,1),'bus')==1
        temp(i,1)=3;
    elseif strcmp(label(i,1),'opel')==1
        temp(i,1)=4;
    end    
end
label=temp;
end
function [data label]=load_heart()
ds=load('heart.dat');
data=ds(:,1:end-1);
label=ds(:,end);
end
function [data label]=load_diabets()
ds=load('diabets.dat');
data=ds(:,1:end-1);
label=ds(:,end)+1;
end
function ndata=normalize(data)
data=double(data);
ndata=data-(mean(data)'*ones(1,size(data,1)))';
ndata=ndata/norm(ndata);
ndata=ndata-(mean(ndata)'*ones(1,size(ndata,1)))';
%mean_val = mean(data(:)); 
%varian_val = var(data(:)); 
%ndata = (data-mean_val)/varian_val; 
end
function [train_data train_label test_data test_label]=split_data(data,label,percent)
[m n]=size(data);
indices=randperm(m);
test_data=data(1,:);test_label=label(1,:);
train_data=data(1,:);train_label=label(1,:);
for i=1:m
    if i/m<=percent
        train_data(i,:)=data(indices(i),:);
        train_label(i,:)=label(indices(i));
    else
        test_data(m-i+1,:)=data(indices(i),:);
        test_label(m-i+1,:)=label(indices(i),:);
    end
end
end
function [gmm_obj err_train]=GMM_Train(data,label,components)
data=double(data);
options = statset('Display','final');
gmm_obj=gmdistribution.fit(data,components,'Options',options, 'Regularize', 1e-5);

c_train=cluster(gmm_obj,data);
vote_train=zeros(components,max(label));
for i=1:size(label,1)
    vote_train(c_train(i),label(i))=vote_train(c_train(i),label(i))+1;
end
err_train=0;
for i=1:components
m=max(vote_train(i,:));
err_train=err_train+sum(vote_train(i,:))-m;
end
err_train=err_train/sum(sum(vote_train));
end
function [err_test]=GMM_Test(gmm_obj,data,label,components)
c_test=cluster(gmm_obj,data);
err_test=0;
vote_test=zeros(components,max(label));
for i=1:size(label,1)
    vote_test(c_test(i),label(i))=vote_test(c_test(i),label(i))+1;
end
for i=1:components
m=max(vote_test(i,:));
err_test=err_test+sum(vote_test(i,:))-m;
end
err_test=err_test/sum(sum(vote_test));
end
function [err_train err_test]=GMM_Check(data,label,cv,components)
err_train=0;err_test=0;data=double(data);
for iteration=1:cv
[d_train l_train d_test l_test]=split_data(data,label,(1-1/cv));
[gmm_obj err_train_temp]=GMM_Train(d_train,l_train,components);
err_test_temp=GMM_Test(gmm_obj,d_test,l_test,components);
err_train=err_train+err_train_temp;
err_test=err_test+err_test_temp;
end
err_test=err_test/cv;err_train=err_train/cv;
end
