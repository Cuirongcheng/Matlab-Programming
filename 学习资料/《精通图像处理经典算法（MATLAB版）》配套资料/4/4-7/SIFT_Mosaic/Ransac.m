function [corners1 corners2] = Ransac(m1,m2,Nmax,Dist)
foundNum = 0;count =0;
ptNum = size(m1,1);
foundFlag =  zeros(ptNum,1);
bestNum = 0;
for i=1:ptNum
    X1(1,i) = m1(i,1);%水平坐标
    X1(2,i) = m1(i,2);%垂直坐标
    X1(3,i) =  1 ;
end
while (count<Nmax)
    randIndex = ceil(randomMulti(ptNum));
    for i=1:4
        randPt1(1,i) = m1(randIndex(i),1);
        randPt1(2,i) = m1(randIndex(i),2);
        randPt2(1,i) = m2(randIndex(i),1);
        randPt2(2,i) = m2(randIndex(i),2);
    end
    H = cp2tform(randPt1' ,randPt2' ,'projective');
    X1_H = H.tdata.T'*X1;
    for  i=1:ptNum
        temp0 = X1_H(1,i)/X1_H(3,i) - m2(i,1);
        temp1 = X1_H(2,i)/X1_H(3,i) - m2(i,2);
        distn = sqrt(temp0^2 + temp1^2);
        if  distn < Dist
            foundNum = foundNum +1;
            foundFlag(i) = 1;
        end
    end
    if (foundNum> bestNum)
        bestNum = foundNum;
        bestFlag = foundFlag;
    end
    foundNum  = 0;
    foundFlag = zeros(ptNum,1);
    count     = count + 1;
end
i=1;
for k=1:ptNum
    if bestFlag(k) == 1
        corners1(i,1) = m1(k,1);%水平坐标
        corners1(i,2) = m1(k,2);%水平坐标
        corners2(i,1) = m2(k,1);%垂直坐标
        corners2(i,2) = m2(k,2);%垂直坐标
        i = i + 1;
    end
end

end

%%
%-------------------------------------------------------------------------    
function R = randomMulti(ptNum)
    R =randi(ptNum,1,4);
    while (R(1,1)==R(1,2)| R(1,1)==R(1,3)| R(1,1)==R(1,4)| R(1,2)==R(1,3)| R(1,2)==R(1,4)| R(1,3)==R(1,4) ...
            | R(1,1)==0 | R(1,2)== 0 | R(1,3)== 0 | R(1,4)== 0)
    %     R = round(ptNum*r);
    R =randi(ptNum,[1,4]);
    end
end

function matrix=randi(num,a,b)
vector=randsample(num,a*b);
matrix=reshape(vector,a,b);
end