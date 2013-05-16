function interpKeys=interpAnimation (keyframes,times,querryFrames)
timeValues=times;
frames=querryFrames;
interpKeys=[interp1(timeValues,keyframes(1,:),frames);interp1(timeValues,keyframes(2,:),frames);interp1(timeValues,keyframes(3,:),frames)]
endfunction
