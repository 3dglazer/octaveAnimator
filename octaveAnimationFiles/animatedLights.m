a=[0 0 0]'*0.1;
b=[0.2 0 -1]'*0.1;
c=[0.5 0 -1.5]'*0.1;

l1=[-3 6 -2 ]';
l2=[3 6 2 ]';
l3=[3 6 -2 ]';
l4=[-3 6 2 ]';

animLengthFrames=50
keyframes=[a,b,c]
timeValues=[0,1,2]
frames=linspace(0,2,animLengthFrames)
keys=interpAnimation(keyframes,timeValues,frames)
inputFilePath='/Volumes/DISK2/developer/octaveAnimator/bunny/';
outputFilePath='/Volumes/DISK2/developer/octaveAnimator/bunny/animScenes/';



fn='bunny' %.pbrt';
fileName=strcat(inputFilePath,[fn '.pbrt']);
textData=fileread(fileName);

for i=linspace(1,animLengthFrames,animLengthFrames)
nkeys=keys
i
%keyString=strcat(['[ ',num2str(keys(:,i)',6),' ]']);
keyString=strcat([num2str(nkeys(:,i)',6)]); 
output=strrep(textData, '$anim$', keyString);
%rename image
imgName=['_', sprintf("%03d",i)] 
output=strrep(output, '$frame$', imgName);
ofl=strcat([outputFilePath ,fn,imgName , '.pbrt']) 
output;
file_id = fopen(ofl, 'w');
fdisp(file_id,output);
fclose(file_id);
end
