%Julia简介
%Roger Luo

# Intro
Julia 是一款具有高性能的动态语言,速度快,很好的结合现在流型的一些新的计算机技术,如云计算,分布式计算等等.在机器学习方面已经开始崭露头角.

# 特性
- 支持多重派发
- 动态类型系统
- 近乎于静态编译语言的速度
- 内建的包管理器
- 类似于Lisp的宏命令和其它metaprogramming功能
- 可以调用Python
- 无其额外开销地调用C

#
- 强大的类shell的命令管理
- 为分布式和并行计算设计
- 支持协程
- 用户定义的类型和内建类型一样快
- 简洁可扩展的类型转换和类型提升
- 对unicode的有效支持
- MIT license


# Benchmarks

#

|               | Fortran | Julia | Python |   R    | Matlab |  Octave |
|---------------|---------|-------|--------|--------|--------|---------|
| fib           |    0.70 |  2.11 |  77.76 | 533.52 |  26.89 | 9324.35 |
| parse_int     |    5.05 |  1.45 |  17.02 |  45.73 | 802.52 | 9581.44 |
| quicksort     |    1.31 |  1.15 |  32.89 | 264.54 |   4.92 | 1866.01 |
| mandel        |    0.81 |  0.79 |  15.32 |  53.16 |   7.58 |  451.81 |
| pi_sum        |    1.00 |  1.00 |  21.99 |   9.56 |   1.00 |  299.31 |
| rand_mat_stat |    1.45 |  1.66 |  17.93 |  14.56 |  14.52 |   30.93 |
| rand_mat_mul  |    3.48 |  1.02 |   1.14 |   1.57 |   1.12 |    1.12 |

#

|               | Mathematica | JavaScript |  Go  | LuaJIT | Java |
|---------------|-------------|------------|------|--------|------|
| fib           |      118.53 |       3.36 | 1.86 |   1.71 | 1.21 |
| parse_int     |       15.02 |       6.06 | 1.20 |   5.77 | 3.35 |
| quicksort     |       43.23 |       2.70 | 1.29 |   2.03 | 2.60 |
| mandel        |        5.13 |       0.66 | 1.11 |   0.67 | 1.35 |
| pi_sum        |        1.69 |       1.01 | 1.00 |   1.00 | 1.00 |
| rand_mat_stat |        5.95 |       2.30 | 2.96 |   3.27 | 3.92 |
| rand_mat_mul  |        1.30 |      15.07 | 1.42 |   1.16 | 2.36 |

# Hello World!

从最基本的开始

Julia可以直接在命令行中运行
```bash
julia -e 'print("hello world!\n")'
```

或者打开Julia的shell,输入
```bash
julia> print("hello world!\n")
```

或者可以在一个脚本文件`hello.jl`中写入
```julia
print("hello world!\n")
```

# 变量 Variables

Julia的变量不需要特别声明,变量类型会由值自动确定
```julia
# 将10赋值给变量x
julia> x=10
10
# 对变量x进行运算
julia> x+1
11
# 重新给x赋值
julia> x=1+1
# 也可以给x赋其它类型的值
julia> x="hello world!"
hello world!
```

#Julia的变量名称支持unicode比如
```julia
julia> δ = 0.00001
1.0e-5
julia> 你好 = "hello"
hello
```

#

支持以LaTex语法输入特殊字符,在Julia的命令行,Jupyter,有juliacompletions插件的sublime编辑器中都可以用类似于的LaTex命令+Tab输入特殊字符,比如`δ` 可以通过输入`\delta`-Tab来得到

#

Julia有一些自带的常量,这些常量是允许重载的.比如
```julia
julia> pi
π = 3.1415926535897...
julia> pi = 3
WARNING: imported binding for pi overwritten in module Main
3
julia> π
3
```

# 整数和浮点数
- 整数从8位整数支持到128位整数(Signed/Unsigned)
- 浮点数从16位浮点数支持到64位浮点数,如果有高精度的计算需求还可以使用内建的高精度浮点数`BigFloat`(256位)

# 整数
整数默认跟随系统位数,比如在32位系统上整数类型为`Int32`,在64位系统上整数类型为`Int64`

# 浮点数
浮点数的-0和-0在二进制表示下不一致(有符号位),但不影响大小比较
```julia
julia> 0.0 == -0.0
true
```

# 浮点精度
浮点精度可以用函数`eps`直接求出,比如`eps(Float32)`

# 数学算符和基本函数

| 表达式 |      名称      |                  描述                  |
|--------|----------------|----------------------------------------|
| +x     | unary plus     | the identity operation                 |
| -x     | unary minus    | maps values to their additive inverses |
| x+y    | binary plus    | performs addition                      |
| x-y    | binary minus   | performs subtraction                   |


#

| 表达式 |      名称      |              描述             |
|--------|----------------|-------------------------------|
| x\*y   | times          | performs multiplication       |
| x/y    | divide         | performs division             |
| x\\y   | inverse divide | equivalent to `y/x`           |
| x^y    | power          | raises `x` to the `y`th power |
| x%y    | remainder      | equivalent to `rem(x,y)`      |

# 数值比较

|  表达式  |           名称           |
|----------|--------------------------|
| `==`     | equality                 |
| `!=` `≠` | inequality               |
| `<`      | less than                |
| `<=` `≤` | less than or equal to    |
| `>`      | greater than             |
| `>=` `≥` | greater than or equal to |

# Tips
可以使用类似于`1<x<2` 这样更自然的表达

# 复数和分数
复数和分数是两个内建的类型,已经为他们写好了几乎所有的函数和运算符

# 复数
虚数单位是`im`

```julia
julia> 1+2im
1 + 2im
```

#
```julia
julia> real(1+2im)
1
julia> imag(1+2im)
2
julia> conj(1+2im)
1 - 2im
julia> abs(1+2im)
2.23606797749979
julia> angle(1 + 2im)
1.1071487177940904
```

# 构造函数
虚数的构造函数是`complex`

```julia
julia> complex(1,2)
1 + 2im
```

# 分数
分数线用`//`表示,比如$\frac{2}{3}$在julia中写作`2//3`,所有的分数会自动化简为真分数,比如
```julia
julia> 6//9
2//3
```

# 字符串
字符串存在一个数组中
```julia
julia> str = "Hello, world.\n"
"Hello, world.\n"

julia> str[1]
'H'

julia> str[6]
','

julia> str[end]
'\n'
```

# 函数
函数声明如下
```julia
function f(x,y)
    return x+y
end
```

`return` 关键会返回后面跟随的值,并退出函数

julia支持多返回值,比如

```julia
function foo(x,y)
    return x,y
end
```

#

将以tuple类型返回多个值
```julia
julia> foo(1,2)
(1,2)
```

#

函数也可以用这样简单的方式声明
```julia
f(x) = sqrt(x)+1

julia> f(1)
2
```

# 运算符也是函数

# 匿名函数
```julia
julia> x->x^2+x
(anonymous function)

julia> function (x)
            x^2 + 2x - 1
       end
(anonymous function)
```

# 匿名函数很有用,举个例子

```julia
# 找出值为1的元素在数组中的位置
julia> find(x->x==1,[1,2,3,1])
2-element Array{Int64,1}:
 1
 4
```

# 

函数的变量不需要专门进行类型约束,但在需要的时候(比如需要提高程序性能),可以用`::`来强制变量类型

```julia
julia> function foo(a::Int64)
       return a
       end
foo (generic function with 2 methods)

julia> foo(1.1)
ERROR: MethodError: `foo` has no method matching foo(::Float64)
```

# 函数变量中可以出现可选变量
```julia
function foo(a = 1)
    return a
end

julia> foo()
1
julia> foo(2)
2 
```

# 可以出现关键词变量
```julia
function foo(x,y;t=1)
    print("x = $(x),y = $(y),t=$(t)")
end

julia> foo(1,2)
x = 1,y = 2,t=1
julia> foo(1,2,t=2)
x = 1,y = 2,t=2
julia> foo(1,2,2)
ERROR: MethodError: `foo` has no method matching foo(::Int64, ::Int64, ::Int64)
```

# 

注意函数中的变量都是call by reference,但函数中不允许改变除了Array类型以外的外部变量的值.如果所创建的函数对外部值进行了修改,则在**Julia的命名规范**中建议以`xxx!`的形式进行命名,比如

```julia
function foo!(x::AbstractArray)
    x[1] = 2
end
```

# if else语句

```julia
if x < y
  println("x is less than y")
elseif x > y
  println("x is greater than y")
else
  println("x is equal to y")
end
```

# a?b:c
如果a为`true` 那么执行`b`,如果a为`false` 执行`c`

# Loops

# while
```julia
julia> i = 1;

julia> while i <= 5
         println(i)
         i += 1
       end
1
2
3
4
5
```

# for
```julia
julia> for i = 1:5
         println(i)
       end
1
2
3
4
5
```

#

```julia
julia> for i in [1,4,0]
         println(i)
       end
1
4
0

julia> for s in ["foo","bar","baz"]
         println(s)
       end
foo
bar
baz
```

# 变量
变量可以用`type`来创建,类似与c++和python的`class`,但由于Julia的面向对象采用的是多重派发,并不支持在类型内部创建属于本类型的函数(method),但可以穿件构造函数

```julia
type foo
    a::Int64
    b
    foo(x,y) = new(x,y)
end
```

`new`函数按照顺序给`foo`中的两个变量赋值

# 使用package/modules

module关键词提供了命名空间,一般类库或者框架都会用module进行封装.使用某个库的方法是(以IJulia为例)


```julia
using IJulia
notebook()
```

#

这样就将在`IJulia` 这个module中`export` 出的函数(包括构造函数)直接放在了当前的名字空间里.

而如果采用 `import` 则需要先指出名字空间
```julia
import IJulia
IJulia.notebook()
```

# 安装package
Julia大部分的开源库都会托管在github上,Julia内置了git,可以自动从github等网站上下载库文件.

若某个库的名字叫`xxx`使用`Pkg.add("xxx")`就可以自动安装这个库

# 矩阵

Julia的矩阵是直接用数组进行声明的,并且是列主序的

#

若要声明一个矩阵
$$
\begin{pmatrix}
1 & 0\\
2 & 1
\end{pmatrix}
$$

```julia
julia> [1 0;2 1]
2x2 Array{Int64,2}:
 1  0
 2  1
```

# 

矩阵计算会自动调用在安装时配置的BLAS库,默认的BLAS是openBLAS.在小型服务器和个人电脑上表现可能会比MKL好.

# 稀疏矩阵
使用`sparse`函数将dense matrix转化为稀疏矩阵存储

```julia
julia> sparse([0 1;1 0])
2x2 sparse matrix with 2 Int64 entries:
    [2, 1]  =  1
    [1, 2]  =  1
```


# JuliaQuantum
JuliaQuantum 是一个使用Julia语言的开源组织,NumFocus为其保护伞组织(为其提供主要支持),致力于用Julia语言实现高性能的量子力学相关计算框架,类库.现在已经有了QuDynamics.jl,QuDirac.jl,QuBase.jl三个正在开发的库,其中QuDynamics.jl是15年参加GSoC的项目.

NumFocus是一个目标实现更加用户友好,更加高性能的科学计算的开源社区.下面有很多有名的项目如numpy,Julia等等.