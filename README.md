# BouncingBall

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://LilithHafner.github.io/BouncingBall.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://LilithHafner.github.io/BouncingBall.jl/dev/)
[![Build Status](https://github.com/LilithHafner/BouncingBall.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/LilithHafner/BouncingBall.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Coverage](https://codecov.io/gh/LilithHafner/BouncingBall.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/LilithHafner/BouncingBall.jl)

# Installation using [Quickdraw](https://github.com/LilithHafner/quickdraw)

To install this software on Linux or Mac, run the following command:

```
curl -fLsS https://lilithhafner.com/quickdraw | sh -s https://github.com/LilithHafner/BouncingBall.jl
```

To install this software on Windows, install Julia and then run the following command:
```
(echo julia -e "import Pkg; Pkg.activate(\"BouncingBall\", shared=true); try Pkg.add(url=\"https://github.com/LilithHafner/BouncingBall.jl\"); catch; println(\"Warning: update failed\") end; using BouncingBall: main; main()" %0 %* && echo pause) > BouncingBall.bat
```

In all cases, the command will create an executable called `BouncingBall` that can be double clicked to run.
