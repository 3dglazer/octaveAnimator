function interpKeys=interpAnimation (kf,times,querryFrames)
keyframes=kf
timeValues=times
frames=querryFrames
x=interp1(timeValues,keyframes(1,:),frames)
y=interp1(timeValues,keyframes(2,:),frames)
z=interp1(timeValues,keyframes(3,:),frames)
interpKeys=[x;y;z]
endfunction
