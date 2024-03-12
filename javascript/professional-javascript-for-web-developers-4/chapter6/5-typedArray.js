// typed array

/** 历史：为了让浏览器在canvas中渲染复杂的图形，而canvas是基于OpenGl规范的WebGL API，当JS将数据传递给WebGL时，JS默认的双精度浮点格式数值（在内存中的格式）不符合接口规范，传递前需要迭代转换格式，这样会导致性能问题。
  为了解决上述问题，Mozilla实现了CanvasFloatArray，便于不同于JS默认格式的数据传输。
  CanvasFloatArray到现在转变成了Float32Array，这是TypedArray的一种。
 */
const buf = new ArrayBuffer(16)
console.log("buf.byteLength", buf.byteLength)

const buf1 = new ArrayBuffer(16)
const buf2 = buf1.slice(4, 12)
console.log("buf2.byteLength", buf2.byteLength)

//arrayBuffer的引用无法用来读写数据，操作其数据需要通过“视图”（有多种类型，但都是指定arrayBuffer中存储的二进制数据。）

/**
 * 视图1. DataView
 * 主要用来处理文件/网络的输入输出
 * 使用时要先指定视窗“可以看到的位置”
 * 然后再使用指定的“ElementType”获取对应的数据格式
 */



const buf3 = new ArrayBuffer(16)
const firstDataView = new DataView(buf3)
console.log("firstDataView", firstDataView)
console.log("firstDataView.byteOffset", firstDataView.byteOffset)
console.log("firstDataView.byteLength", firstDataView.byteLength)
console.log("firstDataView.buffer === buf3", firstDataView.buffer === buf3)


const firstHalfDataView = new DataView(buf3, 0, 8)
console.log("fullHalfDataView", firstHalfDataView)
console.log("fullHalfDataView.byteOffset", firstHalfDataView.byteOffset)
console.log("fullHalfDataView.byteLength", firstHalfDataView.byteLength)
console.log("fullHalfDataView.buffer === buf3", firstHalfDataView.buffer === buf3)

const secondHalfDataView = new DataView(buf3, 8)
console.log("secondHalfDataView", secondHalfDataView)
console.log("secondHalfDataView.byteOffset", secondHalfDataView.byteOffset)
console.log("secondHalfDataView.byteLength", secondHalfDataView.byteLength)
console.log("secondHalfDataView.buffer === buf3", secondHalfDataView.buffer === buf3)


/**
 * ElementType
 * 每一种type都是JS to C 数据的一种映射
 */
// 1个字节有8位
// a byte has 8 bits
const buf4 = new ArrayBuffer(2)
const view4 = new DataView(buf4)

console.log(view4.getInt8(0)) // 0
console.log(view4.getInt8(1)) // 0
console.log(view4.getInt16(16)) // 0

//255的无符号整数2进制表达时 1111 1111 （2的8次方-1）
view.setUnit8(0, 255)
//有自动转换喔，没想到吧
view.setUnit8(1, 0xFF)

// buf4里是 1111 1111 1111 1111 将该数据转换成有符号整数Int格式，就是-1
console.log(view.getInt16(0)) // -1

/**
 * 字节序 Byte Order
 * 
 * 1. 大端序 Big Endian （又称网络字节序：计算机物理顺序反着来，第一个物理字节存最后一个数据位）
 * 2. 小端序 Little Endian （计算机物理顺序顺着来，第一个物理字节存第一个数据位。）
 * 感觉就像是文字的左起始阅读顺序和右起始阅读顺序
 * 计算机中只有1个维度，所以只有大和小
 * JS为web诞生，所以默认是大端序，但也可以调整成小端序
 * 蓝牙的数据传输一般是小端序。
 */

//TODO 继续敲接下来的代码

//适合暖色，浅色，浑浊，对比度低但好像也不能太低

/**
 * 肤色：暖绿
 * 静脉测试；动脉绿色，静脉紫色，不知道
 * 金属测试：感觉也都有，不清楚
 * 
 * 发色：棕黄？
 * 
 * 瞳色：棕
 * 
 * 唇色：豆沙
 * 
 * 服装：黑白灰大地
 * 
 * 造型不知道
 * 
 */
/**
 * 浅+透光 =  浅
 * 服装：白调
 * 造型：我又不知道
 * 
 */
/**
 * 彩度，对比度
 * 皮肤：不发灰吧+光泽感= 净*2
 * 
 * 眉眼对比度： 洗漱+模糊 = 柔*2
 * 
 * 服装用色： 不知道
 * 
 * 美妆造型：不知道
 * 
 * 配置：不知道
 * 
 * 印花：不知道
 * 
 * 服装面料：不知道
 * 
 * 彩妆产品：不知道
 */