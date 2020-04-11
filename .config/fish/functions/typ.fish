# this will create empty file and open typora 
# because typora will throw error if we open it from non-existing file 

function typ
    touch $argv
    typora $argv
end
