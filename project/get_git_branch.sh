#!/bin/bash

function current_git_branch()
{
    current_git_branch=${CI_COMMIT_BRANCH}
    if [ "$current_git_branch" = "" ]; then
        current_git_branch=`git branch --show-current`
    fi
    if [ "$current_git_branch" = "" ]; then
        current_git_branch="Unknow git branch"
    fi
    echo $current_git_branch
}

function current_git_branch_v2()
{
    current_git_branch=${CI_COMMIT_BRANCH} -o `git branch --show-current` -o "Unknow"
    echo $current_git_branch
}

current_git_branch
