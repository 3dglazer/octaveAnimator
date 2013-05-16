a=[1 2 3]';
b=[1 2 4]';
c=[2 2 4]';
keyframes=[a,b,c];
timeValues=[0,1,2];
frames=linspace(0,2,10);
keys=interpAnimation(keyframes,timeValues,frames);
inputFilePath='/Volumes/DISK2/developer/animatedScenes/bunny/';
outputFilePath='/Volumes/DISK2/developer/animatedScenes/bunny/animScenes/';
fn='bunny' %.pbrt';
fileName=strcat(inputFilePath,[fn '.pbrt']);
textData=fileread(fileName);

i=1;
keyString=strcat(['[ ',num2str(keys(:,i)',6),' ]']);
	
output=strrep(textData, '$anim$', keyString);
%rename image
imgName=['_', sprintf("%03d",i)] 
output=strrep(output, '$frame$', imgName);
ofl=strcat([outputFilePath ,fn,imgName , '.pbrt']) 
output;
file_id = fopen(ofl, 'w');
fdisp(file_id,output);
fclose(file_id);

