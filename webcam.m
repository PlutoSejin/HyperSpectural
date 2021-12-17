%명령창에 imaqhwinfo 를 쳐서 장치검색
%여기서 InstalledAdaptors: {'winvideo'}라고 뜨면
%명령창에 imaqhwinfo('winvideo')를 쳐서 DeviceIDs 확인
%여기서 DeviceIDs: {[1]  [2]}라고 나오면 vid = videoinput('winvideo', 2,'MJPG_1280x720'); 사용
% DeviceIDs: {[1]}라고 나오면 vid = videoinput('winvideo', 1,'MJPG_1280x720'); 사용
%장치가 지원하는 화질을 알고 싶으면 
%a=imaqhwinfo('winvideo',2)
%a.SupportedFormats 을 각각 명령창에 입력하면 지원하는 화질들이 나옴
imaqmex('feature','-limitPhysicalMemoryUsage',false);
vid = videoinput('winvideo', 2, 'MJPG_1280x720'); %화질을 바꾸고 싶으면 a.SupportedFormats 에서 지원하는 화질을 입력
video= VideoWriter('object.avi');%비디오 이름 바꾸고 싶으면 object 대신 다른걸로 바꾸기
video.FrameRate = 30; 
open(video);
set(vid,'FramesPerTrigger',2000);%시간 설정. 대략 40초에 2000이므로 이것을 생각해서 계산
start(vid);
while(vid.FramesAcquired<2000) % Stop after 2000 frames
    vid.FramesAcquired
    data = getdata(vid,1); 
    imshow(data)%카메라 화면 나오게 하는 코드, 없애고 싶으면 이 줄에 주석 달면 됨
    writeVideo(video,data);
end
stop(vid) 
close(video)
fprintf("CAM TO VIDEO\n");

v= VideoReader('object.avi');%위의 VideoWriter에서 사용한 이름과 동일하게 이름 맞추기
for i = 1 : v.FrameRate * v.Duration
    video = readFrame(v);
    Data3{i}=rgb2gray(video);
    P(:,:,i)=Data3{i};
end
P1 = permute(P,[2 3 1]);

szA = size(P)
szB = size(P1)
fprintf("PERMUTE FINISH\n");
save('webcam.mat')
whos('-file','webcam.mat')
fprintf("FILE FINISH\n");