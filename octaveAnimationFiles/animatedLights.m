l1=[-3 6 -2 ]';
l1end=[-3 7 2 ]';
l2=[3 6 2 ]';
l2end=[-3 4 -2 ]';
l3=[3 6 -2 ]';
l3end=[-1.5 5 -1]';
l4=[-3 6 2 ]';
l4end=[0 5 1]';

animLengthFrames=25
keyframes1=[l1,l1end]
keyframes2=[l2,l2end]
keyframes3=[l3,l3end]
keyframes4=[l4,l4end]
timeValues=[0,1]
frames=linspace(0,1,animLengthFrames)
keys1=interpAnimation(keyframes1,timeValues,frames)
keys2=interpAnimation(keyframes2,timeValues,frames)
keys3=interpAnimation(keyframes3,timeValues,frames)
keys4=interpAnimation(keyframes4,timeValues,frames)
inputFilePath='/Volumes/DISK2/developer/octaveAnimator/lights/';
outputFilePath='/Volumes/DISK2/developer/octaveAnimator/lights/animScenes/';


fn='lights' %.pbrt';
fileName=strcat(inputFilePath,[fn '.pbrt']);
textData=fileread(fileName);

for i=linspace(1,animLengthFrames,animLengthFrames)
i
%keyString=strcat(['[ ',num2str(keys(:,i)',6),' ]']);
	
keyString=strcat([num2str(keys1(:,i)',6)]); 
output=strrep(textData, '$anim$', keyString);

keyString=strcat([num2str(keys2(:,i)',6)]); 
output=strrep(output, '$anim1$', keyString);

keyString=strcat([num2str(keys3(:,i)',6)]); 
output=strrep(output, '$anim2$', keyString);

keyString=strcat([num2str(keys4(:,i)',6)]); 
output=strrep(output, '$anim3$', keyString);

%rename image
imgName=['_', sprintf("%03d",i)] 
output=strrep(output, '$frame$', imgName);
ofl=strcat([outputFilePath ,fn,imgName , '.pbrt']) 
output;
file_id = fopen(ofl, 'w');
fdisp(file_id,output);
fclose(file_id);
end
