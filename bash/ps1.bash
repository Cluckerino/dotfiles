#!/usr/bin/env bash
#
# Mimic the zsh settings so I don't get sad when forced to bash
#

# get current branch in git repo
parse_git_branch() {
    BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
    echo "${BRANCH}"
}

# get current status of git repo
parse_git_status () {
    status=`git status 2>&1 | tee`
    dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
    untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
    ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
    newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
    renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
    deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
    bits=''
    if [ "${renamed}" == "0" ]; then
        bits=">${bits}"
    fi
    if [ "${ahead}" == "0" ]; then
        bits="*${bits}"
    fi
    if [ "${newfile}" == "0" ]; then
        bits="+${bits}"
    fi
    if [ "${untracked}" == "0" ]; then
        bits="?${bits}"
    fi
    if [ "${deleted}" == "0" ]; then
        bits="x${bits}"
    fi
    if [ "${dirty}" == "0" ]; then
        bits="!${bits}"
    fi
    if [ ! "${bits}" == "" ]; then
        echo " ${bits}"
    else
        echo ""
    fi
}

# green if clean, yellow if dirty
git_status_color() {
    bits=`parse_git_dirty`
    if [ "${bits}" == "" ]; then
        echo "30;42m"
    else
        echo "30;43m"
    fi
}

# Called for every prompt
prompt_command() {
    ps1_user_host='\[\e[30;33m\] \u@\h \[\e[m\]'
    ps1_dir='\[\e[30;44m\] \w \[\e[m\]'
    ps1_time='\[\e[30;47m\] \t \[\e[m\]'
    ps1_git=`parse_git_branch`
    if [ ! "${ps1_git}" == "" ]; then
        git_status=`parse_git_status`
        git_is_dirty=`echo $git_status | grep '[>+x!]'`
        git_color=''
        if [ "${git_is_dirty}" == "" ]; then
            git_color='30;42m'
        else
            git_color='30;43m'
        fi
        ps1_git="[$ps1_git$git_status]"
        ps1_git="\[\e[$git_color\] $ps1_git \[\e[m\]"
    fi
    export PS1="\n$ps1_user_host $ps1_dir $ps1_git $ps1_time\n\\$ "
}

PROMPT_COMMAND=prompt_command
