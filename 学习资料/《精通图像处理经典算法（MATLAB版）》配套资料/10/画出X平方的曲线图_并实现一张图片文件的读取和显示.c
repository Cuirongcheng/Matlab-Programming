#include <stdio.h>
#include "engine.h"
#include <string.h> 
//第1行—第3行：包含了C语言运行的必要文件和外部调用MATLAB函数的引擎头文件engine.h 
int main()
{
	const int N=20;
	double x[N],y[N];//定义变量
	double z[256][256]; 
	//第7行—第9行：创建初始化变量，这里需要根据实际情况给出变量的维数和大小
	for (int i=0;i<N; i++) 
	{
		x[i]=i+1;
		y[i]=x[i]*x[i];
	}
	//第12行—第16行：得到x平方的20个点坐标，用于之后绘图
	Engine *ep;
	if (!(ep=engOpen(NULL)))  
	{
		printf("Cannot open MATLAB Engine.");
	}
	//第19行—第23行：定义MATLAB外部调用引擎的指针，并判定引擎指针创建是否成功
	mxArray *xx=mxCreateDoubleMatrix(1,N,mxREAL);//1行N列
	mxArray *yy=mxCreateDoubleMatrix(1,N,mxREAL);//1行N列
	mxArray *zz=mxCreateDoubleMatrix(256,256,mxREAL);//256行256列
	//第26—第28行：创建需要传递给MATLAB的实数变量指针，并根据上面创建的初始化变量指定该指针的维度和大小
	memcpy(mxGetPr(xx),x,N*sizeof(double));
	memcpy(mxGetPr(yy),y,N*sizeof(double));
	memcpy(mxGetPr(zz),z,256*256*sizeof(double));
	//第31行—第33行：将MATLAB的变量指针指向初始化变量地址
	engPutVariable(ep,"xx",xx);
	engPutVariable(ep,"yy",yy);
	engPutVariable(ep,"zz",zz);
	//第36行—第38行：将矩阵写入MATLAB空间，并为其在MATLAB空间中命名
	//调用MATLAB中plot函数，绘制曲线
	engEvalString(ep,"plot(xx,yy)"); 
	//调用MATLAB中的imread函数，读取一张图片
	engEvalString(ep,"zz=imread('cameraman.tif')");	
	//调用MATLAB中的figure函数及imshow函数显示这张图片
	engEvalString(ep,"figure"); 
	engEvalString(ep,"imshow(zz)");
	printf("press any key to exit!");
	getchar();
	mxDestroyArray(xx); 
	mxDestroyArray(yy);
	mxDestroyArray(zz);
	engClose(ep);
	// 第52行—第55行：释放内存空间，并关闭MATLAB引擎
	return 0;
}
