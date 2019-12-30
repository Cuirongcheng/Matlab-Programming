#include <stdio.h>
#include "engine.h"
#include <string.h> 
//��1�С���3�У�������C�������еı�Ҫ�ļ����ⲿ����MATLAB����������ͷ�ļ�engine.h 
int main()
{
	const int N=20;
	double x[N],y[N];//�������
	double z[256][256]; 
	//��7�С���9�У�������ʼ��������������Ҫ����ʵ���������������ά���ʹ�С
	for (int i=0;i<N; i++) 
	{
		x[i]=i+1;
		y[i]=x[i]*x[i];
	}
	//��12�С���16�У��õ�xƽ����20�������꣬����֮���ͼ
	Engine *ep;
	if (!(ep=engOpen(NULL)))  
	{
		printf("Cannot open MATLAB Engine.");
	}
	//��19�С���23�У�����MATLAB�ⲿ���������ָ�룬���ж�����ָ�봴���Ƿ�ɹ�
	mxArray *xx=mxCreateDoubleMatrix(1,N,mxREAL);//1��N��
	mxArray *yy=mxCreateDoubleMatrix(1,N,mxREAL);//1��N��
	mxArray *zz=mxCreateDoubleMatrix(256,256,mxREAL);//256��256��
	//��26����28�У�������Ҫ���ݸ�MATLAB��ʵ������ָ�룬���������洴���ĳ�ʼ������ָ����ָ���ά�Ⱥʹ�С
	memcpy(mxGetPr(xx),x,N*sizeof(double));
	memcpy(mxGetPr(yy),y,N*sizeof(double));
	memcpy(mxGetPr(zz),z,256*256*sizeof(double));
	//��31�С���33�У���MATLAB�ı���ָ��ָ���ʼ��������ַ
	engPutVariable(ep,"xx",xx);
	engPutVariable(ep,"yy",yy);
	engPutVariable(ep,"zz",zz);
	//��36�С���38�У�������д��MATLAB�ռ䣬��Ϊ����MATLAB�ռ�������
	//����MATLAB��plot��������������
	engEvalString(ep,"plot(xx,yy)"); 
	//����MATLAB�е�imread��������ȡһ��ͼƬ
	engEvalString(ep,"zz=imread('cameraman.tif')");	
	//����MATLAB�е�figure������imshow������ʾ����ͼƬ
	engEvalString(ep,"figure"); 
	engEvalString(ep,"imshow(zz)");
	printf("press any key to exit!");
	getchar();
	mxDestroyArray(xx); 
	mxDestroyArray(yy);
	mxDestroyArray(zz);
	engClose(ep);
	// ��52�С���55�У��ͷ��ڴ�ռ䣬���ر�MATLAB����
	return 0;
}
