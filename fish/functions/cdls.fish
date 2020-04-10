# a simple iplementtatin of cdls to cd and ls together 

function cdls
if count $argv > /dev/null
        builtin cd "$argv"; and ls
    else
        builtin cd ~; and ls
    end
end
