#!/usr/bin/ksh


# while true
# do
#    ATIME=`stat %Z /var/mail/ahmed`
#    if [[ "$ATIME" != "$LTIME" ]]
#    then
#        echo "RUN U have new mail "
#        LTIME=$ATIME
#    fi
#    sleep 10
# done

# q7
# typeset -i n1
# typeset -i n2
# n1=1
# n2=1
# while test $n1 -eq $n2
# do
# n2=$n2+1
# print $n1
# if [ $n1 -gt $n2 ]
# then
# break
# else
# continue
# fi
# n1=$n1+1
# print $n2
# done	

# # q8
	 menu=1;
	while [[ $menu -eq 1 ]]
	do
		select choice in 1 2 3 
		do
			case $choice in
			1) ls
			;;
			2) ls -a
			;;
			3) exit
			;;
			esac

			print "press 1 to continue  or  0 to exit "
			read menu
			if [[ menu -eq 0 ]]
			then
				break
			fi
		done
	done

# q9
# echo " Enetr  num of elements  in array "
# read num
# typeset -i sum
# sum=0
# for (( i = 0; i < num; i++ )); do
# 	echo " Enetr  element num  $i"
# 	read line
# 	sum=$sum+$line
# 	echo $sum
#     my_array[$i]=$line



# done
# echo ${my_array[@]}
# echo "average  of numbers is $((sum/num))"

#10
# function squar {
# typeset sum
# (( sq = $1 *$1 ))
# return $sq
# }
# print The squar is
# squar 5
# print $?