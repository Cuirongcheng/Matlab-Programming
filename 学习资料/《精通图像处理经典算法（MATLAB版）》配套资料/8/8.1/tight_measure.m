function TM=tight_measure(image_in)
A=minrectangle(image_in);
OArea=A(5);
RecArea=A(3)*A(4);
TM=OArea/RecArea;
