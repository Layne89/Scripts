#!/bin/bash
#罗列指定目录下的所有重复文件，用于查找同名文件，从而去重
unset file_arr
index=0

function getDir(){
	for element in `ls $1`
	do
		dir_or_file=$1"/"$element
		if [ -d $dir_or_file ];then
			getDir $dir_or_file
		else
			file_arr[$index]=$dir_or_file
			index=$index+1
		fi
	done
}

root_dir=$1
getDir $root_dir

unset file_names
index=0

for var in ${file_arr[*]}
do 
	tmp=${var##*/} #截取最后的文件名
	if echo ${file_names[*]} | grep -w $tmp &>/dev/null; then
		echo $tmp
	else
		file_names[$index]=$tmp
		index=$index+1
	fi
done