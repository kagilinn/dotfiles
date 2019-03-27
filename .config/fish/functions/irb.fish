# Defined in - @ line 1
function irb --description 'alias irb=irb -I.'
	command irb -I. $argv;
end
