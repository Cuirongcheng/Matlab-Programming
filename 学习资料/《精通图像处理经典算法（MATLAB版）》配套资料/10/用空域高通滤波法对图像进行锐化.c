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
	// mxCreateDoubleMatrix函数生成矩阵	
	mxArray *I=mxCreateDoubleMatrix(256,256,mxREAL);//256行列
	mxArray *J=mxCreateDoubleMatrix(256,256,mxREAL);//256行列
	mxArray *A=mxCreateDoubleMatrix(256,256,mxREAL);//256行列
	mxArray *B=mxCreateDoubleMatrix(256,256,mxREAL);//256行列
	mxArray *C=mxCreateDoubleMatrix(256,256,mxREAL);//256行列
	engPutVariable(ep,"I",I);
	engPutVariable(ep,"J",J);
	engPutVariable(ep,"A",A);
	engPutVariable(ep,"B",B);
	engPutVariable(ep,"C",C);
	//下面通过MATLAB引擎调用MATLAB算法
	engEvalString(ep,"I=imread('cameraman.tif')");	
	engEvalString(ep,"J=im2double(I)");	
	engEvalString(ep,"subplot ( 2,2,1 ), imshow ( J, [ ] )");
	//采用的高通滤波方阵模板为h1、h2、h3
	engEvalString(ep,"h1=[ 0  -1   0,  -1   5  -1,  0  -1   0]");
	engEvalString(ep,"h2=[-1  -1  -1,  -1   9  -1, -1  -1  -1]");
	engEvalString(ep,"h3=[ 1  -2   1,  -2   5  -2,  1  -2   1]");
	engEvalString(ep,"A = conv2 (J,h1,'same')");
	engEvalString(ep,"subplot (2,2,2), imshow (A, [ ])");
	engEvalString(ep,"B= conv2 ( J, h2, 'same' )");
	engEvalString(ep,"subplot(2,2,3 ), imshow (B, [ ])");
	engEvalString(ep,"C = conv2 (J, h3, 'same' )");
	engEvalString(ep,"subplot (2,2,4), imshow (C, [ ])");
	printf("press any key to exit!");
	getchar();
	mxDestroyArray(I);
	mxDestroyArray(J);
	mxDestroyArray(A);
	mxDestroyArray(B);
	mxDestroyArray(C);
	engClose(ep);
	return 0;
}
