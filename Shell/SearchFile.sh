#!/bin/bash
#在指定文件夹下查找某一文件
#usage: SearchFile.sh [targetDirectory] [targetFile]
unset file_arr
index=0

function getDir() {
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

target=$2
result="Not Found"

for var in ${file_arr[*]}
do
	tmp=${var##*/} #截取最后的文件名（eg:myFile.txt）
	if [[ ! $target =~ "." ]]; then #若文件名参数不包含“.”,则tmp去除扩展名之后进行后续比较
		tmp=${tmp%.*} #去除截取文件名（eg:myFile）
	fi
	
	if [ "$target" = "$tmp" ]; then
		result=""
		echo $var
	fi
done
 
if [ "$result" = "Not Found" ]; then
	echo "Not Found"
fi
