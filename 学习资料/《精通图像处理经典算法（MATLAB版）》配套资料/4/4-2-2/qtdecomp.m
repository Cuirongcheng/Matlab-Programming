% 用qtdecomp函数实现四叉树分解
I=imread('cameraman.tif');               % 读入原始图像
S=qtdecomp(I,0.25);              % 四叉树分解，返回的四叉树结构稀疏矩阵S
blocks = repmat(uint8(0),size(S));       
for dim = [512 256 128 64 32 16 8 4 2 1]; % 定义新区域显示分块
  numblocks = length(find(S==dim));      % 各分块的可能维数
  if (numblocks > 0)                     % 找出分块的现有维数
    values = repmat(uint8(1),[dim dim numblocks]);
    values(2:dim,2:dim,:) = 0;
    blocks = qtsetblk(blocks,S,dim,values);
  end
end
blocks(end,1:end) = 1;
blocks(1:end,end) = 1;
subplot(1,2,1);imshow(I); title('原始图像');          % 显示原始图像
subplot(1,2,2), imshow(blocks,[]);title('分解后图像');% 显示四叉树分解后的图像
