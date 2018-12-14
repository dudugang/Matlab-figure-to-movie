function fig2mov(list_num,str_head,str_tail)
% list_num choose the files with listed number to be read    
% str_head is the string before number in the file names
% str_tail is the string after the number in the file names

% also remember to set the [format of the numbers] and the [delay] below

delay = 60/length(list_num);   % set the delay, so that the movie lasts for 100 s

str_save_name = [str_head,'_xx_',str_tail,'.gif'];

for i=list_num
    str_num = num2str(i, '%d');        % may need to set the format of the number
    str = [str_head,str_num,str_tail];
    fprintf('Reading %s ... \n',str);
    
    A=imread(str);
    [I,map]=rgb2ind(A,256);
    if(i==list_num(1))
        imwrite(I,map,str_save_name,'DelayTime',delay,'LoopCount',Inf)
    else
        imwrite(I,map,str_save_name,'WriteMode','append','DelayTime',delay)  
    end
%     set(gcf,'outerposition',get(0,'screensize'));  % max the matlab window

end

fprintf('\nDone! Movie saved to %s.\n',str_save_name)

% Modified based on the code of Zhang Xiaofan
% If needed, check how to set the format in num2str by "doc num2str" in
% MATLAB.

% Example to use: if you want to load files as:

% laser800nm.png
% laser1000nm.png
% ......
% laser3000nm.png

% call the function like this:
% fig2mov([800:200:3000],'laser','nm.png')
