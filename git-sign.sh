#!/bin/bash -xe
git filter-branch --commit-filter '
        if [ "$GIT_AUTHOR_EMAIL" = "13964689+mailman-2097@users.noreply.github.com" ];
        then
                # GIT_AUTHOR_NAME="Nishad Saithaly";
                # GIT_AUTHOR_EMAIL="13964689+mailman-2097@users.noreply.github.com";
                git commit-tree -S "$@";
        else
                git commit-tree "$@";
        fi' -f HEAD
