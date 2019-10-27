# BAT/Julia Tutorial at Advanced School on Statistics in HEP, DESY, Oct. 2019

Welcome to the BAT/Julia tutorial.


## Software installation

Before beginning this tutorial, please install ensure you have Jupyter, Julia and BAT.jl installed and everything is set up correctly.


### Running on your laptop

Follow the [installation instructions](https://bat.github.io/BAT.jl/stable/installation/) in the BAT.jl documentation.

You will find installers for Jupyter, Julia, source-code editors and other software on your tutorial USB pen-drive.


### Running on CERN SWAN

Using a few tricks, it's possibly to install Julia on [CERN SWAN](https://swan.cern.ch) and run BAT.jl there.

Note: For the purposes of this tutorial, installing and running Julia on your laptop will likely be more convenient and responsive.

Warning: The following procedure seems to work, but has not been extensively tested - use at your own risk!

Start a SWAN environment with software stack "96 Python3". Then source the script [cern-swan-init-julia.sh](cern-swan-init-julia.sh) within a SWAN terminal session (`source ./cern-swan-init-julia.sh`). This should install Julia into "$HOME/sw/julia" and register the IJulia kernel with the SWAN Jupyter instance. 

Afterwards, you should be able to run the command `julia` in the terminal session and install all Julia packages required for this tutorial:

    julia> using Pkg
    julia> pkg"add BAT ArraysOfArrays Distributions ElasticArrays IntervalSets Parameters Plots ValueShapes StatsBase Tables TypedTables HDF5" 

See the [BAT.jl documentation](https://bat.github.io/BAT.jl/stable/installation/#Installing-BAT.jl-and-related-Julia-packages-1) for details.

Reload the SWAN "My Projects" web-page before starting Julia notebooks.


## Running the tutorial

Please clone the tutorial Git repository

    git clone https://github.com/bat/bat-julia-tutorial.git

(If you're using SWAN, ensure that "bat-julia-tutorial" ends up in the "SWAN_projects" directory. It's easiest to use the "Download Project from git" function on the "My Projects" web-page).

Start a jupyter server using either

    jupyter lab

or

    jupyter notebook

depending on which Jupyter UI style you prefer.

Start the notebook "Exercise-1.ipynb" to begin the tutorial.


## Learning Julia

Due to the format of the tutorial, you should (hopefully) not need to consult documentation frequently. Still, here are a few resources that should help you get started with the Julia language quickly:

* The ["MATLAB–Python–Julia cheatsheet"](https://cheatsheets.quantecon.org/) show MATLAB, Python and Julia code for common operations in direct comparison.

* ["The Fast Track to Julia"](https://juliadocs.github.io/Julia-Cheat-Sheet/) is a convenient online cheatsheet for quick reference.

* The official [Julia language documentation](https://docs.julialang.org/en/v1/).

* ["Think Julia"](https://benlauwens.github.io/ThinkJulia.jl/latest/book.html) is a good, detailed online book about the Julia language.

* The Julia homepage has a [large section with introductory material](https://julialang.org/learning/).
