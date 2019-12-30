#include <stdio.h>
#include "engine.h"
#include <string.h> 
int main()
{
	Engine *ep;
	if (!(ep=engOpen(NULL)))  
	{
		printf("Cannot open MATLAB Engine.");
	}
	// mxCreateDoubleMatrix�������ɾ��󣬱���������Ҫ����3��256x256�ľ���
	mxArray *I=mxCreateDoubleMatrix(256,256,mxREAL);//256����
	mxArray *J=mxCreateDoubleMatrix(256,256,mxREAL);//256����
	mxArray *H=mxCreateDoubleMatrix(256,256,mxREAL);//256����
	//����ͨ��MATLAB�������MATLAB�㷨
	engPutVariable(ep,"I",I);
	engPutVariable(ep,"J",J);
	engPutVariable(ep,"H",H);
	//��18�С���20�У�����������д��MATLAB�ռ䣬��Ϊ����MATLAB�ռ�������
	engEvalString(ep,"I=imread('cameraman.tif')");	
	engEvalString(ep,"J=double(I)");	
	//���ж����任
	engEvalString(ep,"J=40*(log(J+1))");
	engEvalString(ep,"H=uint8(J)");
	engEvalString(ep,"subplot(1,2,1), imshow(I)");
	engEvalString(ep,"subplot(1,2,2), imshow(H)");
	printf("press any key to exit!");
	getchar();
	mxDestroyArray(I);
	mxDestroyArray(J);
	mxDestroyArray(H);
	engClose(ep);
	return 0;
}
