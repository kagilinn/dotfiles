# Defined in - @ line 1
function gu --description 'alias gu=git merge origin/(git symbolic-ref --short HEAD)'
	git merge origin/(git symbolic-ref --short HEAD) $argv;
end
