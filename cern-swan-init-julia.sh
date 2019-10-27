#!/bin/bash

# This program licensed under the terms of the MIT license. For a copy,
# see <https://opensource.org/licenses/MIT>.

# This script sets up Julia for personal use on the CERN SWAN service. It is
# indended to be run in a SWAN terminal session via
#
#     source cern-swan-init-julia.sh
#
# The script checks the current state of the user-specific Julia installation
# and only performs necessary actions. It can therefore be sourced sourced
# multiple times (e.g. once in each new SWAN session).
#
# You may need to reload the main SWAN page in your web browser to see
# the Julia Jupyter kernel appear in the list of available kernels.


mkdir -p "$HOME/.julia"
mkdir -p "/tmp/`whoami`/.julia/registries"
test -e "$HOME/.julia/registries" || ln -s "/tmp/`whoami`/.julia/registries" "$HOME/.julia/registries"

if [ -z "`command -v julia`" ] ; then
    if [ ! -e "$HOME/sw/julia" ] ; then
        echo "Installing Julia to \"$HOME/sw/julia\"" >&2
        mkdir -p "$HOME/sw/julia" && \
            curl "https://julialang-s3.julialang.org/bin/linux/x64/1.3/julia-1.3.0-rc4-linux-x86_64.tar.gz" | \
            tar xz --strip-components=1 -C "$HOME/sw/julia"
    fi
    echo "Adding \"$HOME/sw/julia/bin\" to PATH" >&2
    export PATH="$HOME/sw/julia/bin:$PATH"
fi

if [ ! -d "$HOME/.julia/packages/IJulia" ] ; then
    echo "Installing IJulia" >&2
    export JUPYTER_DATA_DIR="/scratch/`whoami`/.local/share/jupyter"
    julia -e 'using Pkg; pkg"add IJulia"'
fi

# Directory "/scratch" does not persist between sessions, reinstall
# Julia Jupyter kernel if necessary:
export JUPYTER_DATA_DIR="/scratch/`whoami`/.local/share/jupyter"
julia -e 'using IJulia; installkernel("julia", env=merge(Dict("JULIA_NUM_THREADS"=>"4"), Dict(ENV)))'
