set v1Counter 0
set counter 0
loop
wait
read var
function y adapter controllerV1,100,10
if($y==30.0)
rdata $var sender val
if($sender==s1)
	plus v1Counter $v1Counter $val
	if($v1Counter>=500)
		send N 7
	else
		send A 7
	end
end
if($sender==s2)
	minus v1Counter $v1Counter $val
	if($v1Counter<500)
		send A 7
	else
		send N 7
	end
end
data p v1 $var
plus counter $counter 1
if($counter>=3)
	data p v1 $var
	set counter 0
	send $p 11
end
end
