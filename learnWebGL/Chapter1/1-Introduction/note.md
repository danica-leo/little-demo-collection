OpenGL shader programs that perform critical parts of the graphical rendering

CPU central processing units
GPU graphics processing units

RAM random  access memory
Graphics memory(显存)


the client store the web page in RAM!

It will configure and copy the model data to the GPU’s memory.  (Technically the data is copied to GPU’s vertex object buffers).

In a typical graphics program, the model data is copied to the GPU’s memory only once. 

When we use the term “real-time graphics” we mean that rendering can be done in less than 1/30 of a second and the user can view smooth graphical animations. Such fast rendering is only possible if the transfer of data between the GPU’s memory and RAM is minimized.