function str2cmdstr(str::AbstractString)
    split(str,r"\s+")
    convert(Vector{ByteString},split(str,r"\s+"))
end

function str2cmdstr(c::Vector{ByteString},str::AbstractString)
    append!(c,str2cmdstr(str))
end

function pandoc(
    filename::AbstractString;
    o::Union{AbstractString,Void}=nothing,
    toc::Bool=false,
    toc_depth::Integer=2,
    standalone::Bool=false,
    revealjs::Bool=false,
    template::Union{AbstractString,Void}=nothing
    )
    iname = match(r"(.*).md",filename).captures[1]
    
    @show filename
    @show iname

    args = str2cmdstr("pandoc $(iname).md")

    o!=nothing?str2cmdstr(args,"-o $(o)"): str2cmdstr(args,"-o $(iname).html")

    toc==true?str2cmdstr(args,"--toc --toc-depth=$(toc_depth)"):nothing

    # By default, pandoc produces a document fragment, not a standalone docu‐
    # ment with a proper header and footer.  To produce  a  standalone  docu‐
    # ment, use the -s or --standalone flag:
    standalone==true?str2cmdstr(args,"-s"):nothing

    revealjs==true?str2cmdstr(args,"-t revealjs"):nothing

    template!=nothing?str2cmdstr(args,"--template=$(template)"):nothing

    @show string(Cmd(args))

    run(Cmd(args))
end

function init()
    return ""
end

function gen()
    pandoc("README.md";o="index.html",toc=true,toc_depth=2,template="index.revealjs")
    
    @show readdir("_contents")
    for file in readdir("_contents")
        file = match(r"(.*).md",file)
        @assert file!=nothing
        file = file.captures[1]
        pandoc("_contents/$(file).md";o="contents/$(file).html",revealjs=true,standalone=true,template="slide.revealjs")
    end

    run(`git add *`)
    run(`git commit -m"update contents $1"`)
    run(`git push origin gh-pages`)
end

gen()