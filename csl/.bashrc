# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias rm="rm -i"
alias tmatlab="matlab -nodesktop -nosplash"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
# Make the bash prompt colorful
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ ' #Changed this to \W from \w
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\W\$ '        #Changed this to \W from \w
fi

# Add MATLAB scripts directory to MATLAB path
export MATLABPATH=$MATLABPATH:'/home/mahesh/MATLAB/Scripts/'

# Add OpenMPI to the path
export PATH=/usr/lib64/openmpi/bin/:$PATH 
export LD_LIBRARY_PATH=/usr/lib64/openmpi/lib/:$LD_LIBRARY_PATH

# Source OpenFOAM script
source /home/mahesh/OpenFOAM/OpenFOAM-2.4.x/etc/bashrc
# export PATH=/home/mahesh/OpenFOAM/OpenFOAM-2.4.x/platforms/linux64GccDPOpt/bin:$PATH

# ParaView for OpenFOAM
# export ParaView_DIR=/home/mahesh/OpenFOAM//ThirdParty-2.4.x/platforms/linux64Gcc/ParaView-4.1.0
# export PATH=$ParaView_DIR/bin:$PATH
export PV_PLUGIN_PATH=$FOAM_LIBBIN/paraview-4.1

# Add GCC 4.7 to the paht
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/mahesh/Software/buildtools-4.7/lib
#export PATH=$PATH:/home/mahesh/Software/buildtools-4.7/bin

# alias for TikzEdit
alias tikzedit="mono /home/mahesh/Software/TikzEdit/TikzEdtWForms.exe &"

# Export /usr/lib64 in LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/usr/lib64/:$LD_LIBRARY_PATH

# Short cut directories
export MSVN=/home/mahesh/SVN/mahesh
export PSVN=/home/mahesh/SVN/ptranq

# Add tapenade to path
export PATH=$PATH:/home/mahesh/Software/tapenade3.9/bin/
export TAPENADE_HOME=/home/mahesh/Software/tapenade3.9/

# Add anaconda to path
export PATH=$PATH:/opt/anaconda2/bin

# Setup PYTHONPATH
export PYTHONPATH=$PYTHONPATH:/usr/lib64/python2.7/site-packages/:/usr/lib/python2.7/site-packages/

# Add NodeJS to Path
export PATH=$PATH:/opt/node-v6.10.3-linux-x64/bin

# JAVA_HOME
export JAVA_HOME=/usr/java/jdk1.8.0_131/

# Add new Octave to path
export PATH=/home/mahesh/HG/octave:$PATH
