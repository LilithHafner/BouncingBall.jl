using BouncingBall
using Documenter

DocMeta.setdocmeta!(BouncingBall, :DocTestSetup, :(using BouncingBall); recursive=true)

makedocs(;
    modules=[BouncingBall],
    authors="Lilith Hafner <Lilith.Hafner@gmail.com> and contributors",
    repo="https://github.com/LilithHafner/BouncingBall.jl/blob/{commit}{path}#{line}",
    sitename="BouncingBall.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://LilithHafner.github.io/BouncingBall.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/LilithHafner/BouncingBall.jl",
    devbranch="main",
)
