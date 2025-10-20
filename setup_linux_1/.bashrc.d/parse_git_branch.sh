function parse_git_branch {
    git rev-parse --git-dir > /dev/null 2>&1

		if [ $? -ne 0 ]; then
			  # if the current directory is not a git-repo, display '*'
  			echo "*"
		else
        git_status="$(git status 2> /dev/null)"
        branch_pattern="^On branch ([^${IFS}]*)"
        detached_branch_pattern="# Not currently on any branch"
        remote_pattern="# Your branch is (.*) of"
        diverge_pattern="# Your branch and (.*) have diverged"
        untracked_pattern="# Untracked files:"
        new_pattern="new file:"
        not_staged_pattern="Changes not staged for commit"

        #files not staged for commit
        if [[ ${git_status}} =~ ${not_staged_pattern} ]]; then
            state="✔"
        fi
        # add an else if or two here if you want to get more specific
        # show if we're ahead or behind HEAD
        if [[ ${git_status} =~ ${remote_pattern} ]]; then
            if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
                remote="↑"
            else
                remote="↓"
            fi
        fi
        #new files
        if [[ ${git_status} =~ ${new_pattern} ]]; then
            remote="+"
        fi
        #untracked files
        if [[ ${git_status} =~ ${untracked_pattern} ]]; then
            remote="✖"
        fi
        #diverged branch
        if [[ ${git_status} =~ ${diverge_pattern} ]]; then
            remote="↕"
        fi
        #branch name
        if [[ ${git_status} =~ ${branch_pattern} ]]; then
            branch=${BASH_REMATCH[1]}
        #detached branch
        elif [[ ${git_status} =~ ${detached_branch_pattern} ]]; then
            branch="NO BRANCH"
        fi

        # stash stuff
        ref=$(git symbolic-ref HEAD 2> /dev/null) || return
        stash_count=$(git reflog show stash 2> /dev/null | wc -l| sed 's/ //g') || return
        if [[ $stash_count != "0" ]]; then
            stash_info=" [${stash_count}]"
        fi

        echo "${branch}${state}${remote}${stash_info}"
    fi

    return
}
