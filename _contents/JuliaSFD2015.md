%The Julia Language
%科学计算的银弹
%Roger Luo

#平时你怎么做科学计算呢？
R? Fortran? C++? C?

#现在

#试试Julia吧

#我默认了来听的童鞋都是要装Julia的，我的slide暂时放在了这里

home.ustc.edu.cn/~rogerluo/slide.html

#如果你没有下载我的slide，你可以访问

http://julialang.org/downloads/

#或者自己百度或者google julialang

#
windows用户[戳这里](https://s3.amazonaws.com/julialang/bin/winnt/x64/0.4/julia-0.4.0-win64.exe)

#
Ubuntu用户可以直接

    sudo apt-get install julia

或者[戳这里](https://launchpad.net/~staticfloat/+archive/juliareleases)
其它Linux用户可以添加ppa:

    ppa:staticfloat/juliareleases


或者[戳这里](http://julialang.org/downloads/)使用其它方式安装

#
Mac用户
我没有Mac，所以我没有真的安装过，但是你应该可以[戳这里](https://s3.amazonaws.com/julialang/bin/osx/x64/0.4/julia-0.4.0-osx10.7+.dmg)

#银弹？
银弹是指某一项技术或方法使软件工程的生产力在十年内提高十倍。
No Silver Bullet应该是一句很有名的话了

#当然有点夸张了
并不知道Julia将来会成为什么

#但是现在对于很多问题，Julia已经能够胜任了

#为什么创造Julia {#why-create-julia data-background="#DAA520" data-background-transition="slide"}
(摘自豆瓣的翻译，我自己懒得翻译了...)


# {data-background="#DAA520"}
简单的说，因为我们很贪心。

我们是Matlab的重度用户。我们中间有Lisp高手，Python专家，Ruby专家，还有Perl高手。有些家伙从嘴上无毛的年纪就开始用Mathematica了，当然我们中间也有人现在也还是不长胡子的。我们比正常人画了更多的R图。C更加是我们最喜欢的大杀器。

我们热爱所有这些语言，他们实在是很好很强大。在我们从事的领域中——包括科学计算、机器学习、数据挖掘、大规模线性代数、分布式与并行计算这些——每种语言都对某些问题来说很完美，但对另一些就变得很糟糕。我们需要做出取舍。

# {data-background="#DAA520}
我们很贪心：我们想要更多。

我们需要一种语言，它是开源的，有自由的许可。我们需要C语言的速度，又要有Ruby社区的活力。我们需要一种homoiconic风格的编程语言，像Lisp那样有真正的宏，又要有Matlab里那些熟悉的数学概念。我们需要的东西既能像Python那样可以作为通用编程语言使用的工具，又要能够像R那样适用于统计分析，能像Perl那样自然地处理字符串，能像Matlab那样给力地处理矩阵运算，还要能像shell一样能把各种程序粘合在一起。它必须让初学者觉得简单易学，同时又可以让高级用户们挥洒自如。它既要是交互式的，又能被编译执行。

# {data-background="#DAA520"}
(前面提到过的，它要有C那么快！)

我们在构思这些需求的时候，我们还发现它得有Hadoop这样强大的分布式能力——却不想要Hadoop里面那些冗繁的Java和XML，不想在几百台机器庞大的日志文件里去寻找那些bug。我们不想要那些令人费解的层次结构。我们想让简单的标量循环能在单个CPU的寄存器里编译出精致的机器代码。我们想要写一个A*B就能让上千台机器为我们完成一次规模庞大的矩阵乘法。

# {data-background="#DAA520}
我们不需要的时候，就不用做类型申明。但我们需要多态函数（polymorphic functions）时，希望能通过泛型编程（generic programming ）使得只写一次的算法能在无穷多的数据类型上套用。我们希望通过多重分派（multiple dispatch ），能够为一个函数所有可能的参数选出最有效的执行方法。这些参数可能有着不同的定义，来自不同的数据类型，却能提供相同的功能。在拥有这些能力得的同时，我们还希望这种语言简单、干净！

# {data-background="#DAA520}
要求有点多，是不是？

尽管我们意识到了自己有多贪心，我们还是想把这些都统统拥入怀中。大概在两年半之前，我们开始创造这种能满足我们贪念的语言。它还没有完工——但是已经可以发布一个1.0版本了——我们创造的语言叫做Julia。她已经实现了我们那些乱七八糟需求的90\%，而现在她需要来自更多人更乱七八糟的需求，来让她走得更远。如果你也是一位贪心不足，不可理喻，需索无度的码场二逼青年，希望你能来试试这个东东。

#正式介绍 {data-background="#6B8E23" data-background-transition="slide"}
(来自官方doc)


 Julia 是个灵活的动态语言，适合科学和数值计算，性能可与传统静态类型语言媲美。

#与传统动态语言的区别 {data-background="#6B8E23"}
- 核心语言很小；标准库是用 Julia 本身写的，如整数运算在内的基础运算
- 完善的类型，方便构造对象和做类型声明
- 基于参数类型进行函数重载
- 参数类型不同，自动生成高效、专用的代码
- 高性能，接近静态编译语言，如 C 语言

#其它优势 {data-background="#6B8E23"}
- 免费开源
- 自定义类型与内置类型同样高效、紧凑
- 不需要把代码向量化；非向量化的代码跑得也很快
- 为并行和分布式计算而设计
- 低调又牛逼的类型系统
- 优雅、可扩展的类型转换
- 高效支持 Unicode, 包括且不只 UTF-8
- 直接调用 C 函数（不需封装或 API）
- 像 Shell 一样强大的管理其他进程的能力
- 像 Lisp 一样的宏和其他元编程工具


#一些具体的例子 {data-background="#6B8E23"}

#数字分隔符 {data-background="#6B8E23"}
数字分割符可以使数字位数更加清晰：

    julia> a=100_000
    100000

#使用希腊字母 {data-background="#6B8E23"}
作为一个(在实验室)天天要写代码的码农,当一个波函数被命名成phi,某个角度值被写成alpha或者xxx....
作为一个多年使用希腊字母在纸上做验算的人，是不是总觉得这样的代码不够漂亮？

# {data-background="#6B8E23"}
在julia里打入：

    \phi
再按Tab试试

# {data-background="#6B8E23"}
$\phi$出现了，在Julia里这样的unicode字符可以像其它ASCIII字符一样使用，命名变量，函数名等等

#在Julia中调用C或者Fortran代码 {data-background="#6B8E23"}
被调用的代码应当是共享库的形式，大多数 C 和 Fortran 库都已经被编译为共享库。
如果自己使用 GCC （或 Clang ）编译代码，需要添加 -shared 和 -fPIC 选项


#Julia 调用这些库的开销与本地 C 语言相同 {data-background="#6B8E23"}


#运行外部程序 {data-background="#6B8E23"}
Julia使用倒引号(``)创建一个cmd对象，用run函数来执行


    run(`eog speed.png`)


#高性能 {data-background="#6B8E23"}
网传关于Julia的图最多的除了某国演员外应该就是这张图了


![C的性能为1.0](speed.png)


#容易上手 {data-background="#6B8E23"}
Julia的语法和python,MATLAB以及C有很多相似之处，它被设计成能让新手迅速掌握，又能让高手灵活发挥

#让我们先来写一个最经典的hello world程序 {data-background="#CD5C5C" data-background-transition="slide"}
    print("hello world\n")

如果学过python的同学会发现和python并不只是像...


#让我再进一步，写一个hello world程序 {data-background="#CD5C5C"}


#定义一个字符串 {data-background="#CD5C5C"}
    str = "hello world\n"
}


#打印这个字符串 {data-background="#CD5C5C"}
    print(str)
}

#换一种方式打印 {data-background="#CD5C5C"}
    print("我要打印$(str)!>_<\n")
}

可以看到输出了这个字符串str的值


#在Julia中输出一个变量的值不需要说明类型，在字符串中$()写入需要打印的变量即可 {data-background="#CD5C5C"}


#让我们来写一个简单的抛物运动的模拟程序 {data-background="#6B8E23"}


#定义重力加速度常量g {data-background="#6B8E23"}
    const g = 9.8#m/s²


#迭代速度 {data-background="#6B8E23"}
    function next_speed(v,dt=1e-6)
        res = [v[1],v[2]-g⋅dt]
        return res
    end


#在Julia里函数的声明是function而在python中是def {data-background="#6B8E23"}


#Julia的代码块是由end关键字来结尾的 {data-background="#6B8E23"}


#函数的返回值和python一样都是return {data-background="#6B8E23"}


#迭代位置 {data-background="#6B8E23"}
    function next_timestep(pos,v,dt=1e-6)
        res = [pos[1]+v[1]⋅dt,pos[2]+v[2]⋅dt]
        return res
    end


#现在来写抛物线的代码 {data-background="#6B8E23"}
    function parabola(initial_pos,initial_v,file,dt=1e-6)

initial_pos是初始位置,initial_v是初始速度,file是我们要输出的数据文件名,dt就是时间步长了


#写一些赋值语句，让初始值定义进来 {data-background="#6B8E23"}
    function parabola(initial_pos,initial_v,file,dt=1e-6)
        MAX_TIMESTEP = 100
        cur_pos = initial_pos
        cur_v   = initial_v
    end


#打开一个文件,在Julia中打开一个文件需要使用open函数,用法和c语言的fopen很像 {data-background="#6B8E23"}


# {data-background="#6B8E23"}
    function parabola(initial_pos,initial_v,file,dt=1e-6)
        MAX_TIMESTEP = 100
        cur_pos = initial_pos
        cur_v   = initial_v
        f = open(file,"w")
    end


#如果不知道open具体怎么用怎么办？ {data-background="#6B8E23"}


#输入 {data-background="#6B8E23"}
    @doc open

就可以看到open函数的文档

#for循环 {data-background="#6B8E23"}


# {data-background="#6B8E23"}
    function parabola(initial_pos,initial_v,file,dt=1e-6)
        MAX_TIMESTEP = 100
        cur_pos = initial_pos
        cur_v   = initial_v
        f = open(file,"w")
        
        #####################################
        ####        For  Loop       ####################
        for i in [1:MAX_TIMESTEP]
            cur_pos = next_timestep(cur_pos,cur_v,dt)
            cur_v   = next_speed(cur_v,dt)
            write(f,"$(cur_pos[1])\t$(cur_pos[2])\t$(i*dt)\n")
        end
        #####################################
        close(f)
    end

#最后不要忘记关闭文件 {data-background="#6B8E23"}
    close(f)


#然后调用这个函数 {data-background="#6B8E23"}
    parabola([0,2],[1,0],"line.txt")


#绘图 
绘图可以采用python的绘图库matplotlib,这个库在Julia中是PyPlot.jl它需要你已经安装了PyCall.jl用来调用python函数


#
也可以使用外部绘图程序如gnuplot等,就像我们之前使用的一样直接用run在命令行中调用即可


#
当然julia本身也是有一些绘图库的，比如winston，gadfly等，甚至还有ASCIIPlots这种卖萌的东西

#这里为了简单(不一定是最好的)使用gnuplot来完成模拟数据的可视化


#运行已经写好的gnuplot脚本
    run(`gnuplot draw.gnu`)

#用linux自带图片查看器查看图片
    run(`eog path.png`)

#
![](../img/path.png)

#你的需求没有解决？
何必对一门只有0.4版本的语言这么急呢？

开发组非常活跃，请直接前往Github提出你的问题


#Juno\\IJulia\\Sublime Text

#
如果想使用这样一门语言，一款养眼又好用的编辑器是很重要的，这是我问了一些julia用户得到的结果：

 - Juno是julia的官方IDE，基于最近很火atom开发，虽然我也不得不说有时候Juno会出点毛病，但是对于Julia特性的支持应该是最好的
 - Sublime Text作为一款著名的编辑器，当然也有关于Julia的插件，提供了高亮，unicode自动补全(不知为何有时候会失灵)
 - Ijulia是一款基于Ipython开发的网页编辑器，长得和ipython的notebook一样，但是可以编译julia
 - juliabox 是一款在线编辑器，基于IJulia，然而如果没有加速服务国内访问暂时还很慢，很有可能什么都看不到


#Sublime Text:Julia Completions
打开Installed Packages,中JuliaCompletions.sublime-package这个包中的julia-ustf.sublime-completions,如果其中有keyword.operator.arithmetic.julia
删去它,否则补全功能可能不能正常使用


#加入USTC Julia User Group
USTC Julia User Group是一个正在筹建中的兴趣小组，目的是增(*An*)加(*Li*)Julia用户人数，互相交流学习这门语言，
同时作为一个(也许是中国第一个)比较正式的Julia User Group为我们学校的Julia用户提供各种指导（前提得是有人会）
并且还可以作为大家组建Julia扩展包开发组的平台，共同帮助一门更加适用于科学界的编程语言成长。

#QQ群:316628299

#Julia还很年轻

#但我认为她将会是最适合学术界使用的语言
Fortran的特性已经很老了，而当使用计算机时，作为一个非计算机科学专业的研究工作者，
如果不是因为兴趣，那么他更应当关注理论本身，同时也要尽可能地完整地用到本世纪最强大的工具
numpy+python的组合固然很好，但专为科学计算设计的Julia会更好


#还没结束

#有请和开发组一起che过的徐浩童鞋

#![](../img/photo.jpg)