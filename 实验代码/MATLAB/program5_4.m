% �ϻ�ʵ��5������
% ���ٳ� 2019.10.21
% ����countNumber����
head = input('������ͷ�ĸ�����');
foot = input('������ŵĸ�����');
countNumber(head, foot);
function [rabbit,chicken] = countNumber(head, foot)
    rabbit = foot/2 - head;
    chicken = 2 * head - foot / 2;
    fprintf('���ӵĸ�����%d\n' , rabbit);
    fprintf('���ĸ�����%d\n' , chicken);
end
