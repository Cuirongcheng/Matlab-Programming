% ����ŷʽ��������ж�
function D=Compute_ED(H)
Hm = [0.2907  0.0918  0.3613    0.9948    0.9970];
Hd = [ Hm; H];
D = pdist(Hd, 'euclidean');