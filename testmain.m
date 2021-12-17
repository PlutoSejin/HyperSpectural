load('test.mat');
image = P2;
wavelengthRange = [300 1200]; %스펙트럼 범위
numBands = 480; %비디오의 높이, 화질을 바꾸면 이부분도 바꿔줘야됨
wavelength = linspace(wavelengthRange(1),wavelengthRange(2),numBands);
hcube = hypercube(image,wavelength);
fprintf("HYPERCUBE\n");