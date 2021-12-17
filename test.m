v= VideoReader('test.mp4'); %video파일 이름을 바꾸고 싶으면 test 부분을 동영상 이름으로 교체
vidWidth = v.Width; %동영상의 가로길이
vidHeight = v.Height; %동영상의 세로 길이

for i = 1 : v.FrameRate * v.Duration; 
    video = readFrame(v);
    %imwrite(video,strcat('0000',int2str(i),'.bmp'),'bmp');
    image_data{i}=video;
    Data{i}=rgb2gray(image_data{i});
end

for i = 1 : v.FrameRate * v.Duration; 
    P(:,:,i)=Data{i};
end
P1 = permute(P,[2 1 3]);
P2 = permute(P,[2 3 1]);
P3 = permute(P,[3 2 1]);
P4 = permute(P,[1 3 2]);
P5 = permute(P,[3 1 2]);
P(171,348,2)
P1(348,171,2)
szA = size(P)
szB = size(P1)
szA
szB
save('test.mat')
whos('-file','test.mat')



