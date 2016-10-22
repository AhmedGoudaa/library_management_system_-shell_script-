#!/usr/bin/ksh
tst="north";
test=$tst":";
# echo $test;
number='"/^[0-9]+$/"'
mix='"/^[A-Za-z]+ [a-z0-9]*/"'
text='"/^[A-Za-z]+ [a-z]*/"'
 menu='"/^soft_cover$\|^hard_cover$/"'
 year='"/^[0-9][0-9][0-9][0-9]$/"'




# x=$(awk -F: -v env_var="$tst" '{if($2==env_var) print  $2	}' libs/lib1/shelves);
# echo $x;

# sed -i '/^'"$test"'/d' libs/lib1/shelves
# echo $a;
   # echo ${a[@]}
# 
# # # sed 's/$t'"$t"'//'.
# for x in ${a[@]}
# do
# 	echo $x
# done

# for (( i = 0; i <${#a[*]}; i+=2 )); do
# 	echo "thea =" ${a[$i]};
# 	 x=  $"a[$i+1]";
# 	 # echo '$x '
# done   
adddddbook(){

a=($(awk -F:: '{print $1 ,$2}' libs/lib1/meta))
 typeset -i i;	
  typeset -i j;

for ((j=0, i = 0; i < ${#a[*]}; i+=2,j++ )); do
tmp="";

			 while [[ $tmp = "" ]]; do
			 	# regex= ${!a[$i+1]};
			 	if [[ ${a[$i]} == "Cover_type" ]]; then
					 		echo "Enter 1 for soft_cover or 2 for hard_cover : "
					 		select tmp in soft_cover hard_cover
									do
									   case $tmp in
									      soft_cover) 
									         echo "Soft cover"
									         tmp=$tmp" ::";
									         book[j]=${tmp}
									         break
									         ;;
									      hard_cover)
									         echo "Hard cover"
									         tmp=$tmp" ::";
									         book[j]=${tmp}
									         break
									      
									      ;;
									      *) echo "ERROR: Invalid selection enter 1 or 2 only " 
									      ;;
									   esac
									done

						

						else



						 echo "Please Enter ${a[$i]}   :-"
						 
							read tmp
							# ${${a[$i+1]}//""}
							regex=${a[$i+1]}
							regex="${regex%\"}"
							regex="${regex#\"}"
							# echo "$regex "
								
							 if [[ $tmp =~ $regex ]]; then
							 	chk="";
							 

							 	if [[ ${a[$i]} == "Title" ]]; then
									 		chk=$(awk -F:: -v env_var="$tmp" '{if($2==env_var) print  $2}' libs/lib1/books);

									 	#  t=$(awk -F: -v a=$tmp '{if($1==$a) print $1}' shelves)
									 	#  echo "$t"
									 	# echo "$chk"
									 	if [[ $chk ]]; then
									 		echo "book Title exist try another one "
									 		tmp="";
									 	else 
									 		tmp=$tmp" ::";
									 		book[j]=${tmp};
									 	fi

									else
										tmp=$tmp" ::";
										book[j]=${tmp}; 	
							 	fi
							 		if [[ ${a[$i]} == "ISBN" ]]; then
									 		chk=$(awk -F:: -v env_var="$tmp" '{if($1==env_var) print  $1}' libs/lib1/books);

									 	#  t=$(awk -F: -v a=$tmp '{if($1==$a) print $1}' shelves)
									 	#  echo "$t"
									 	# echo "$chk"
									 	if [[ $chk ]]; then
									 		echo "book ISBN exist try another one "
									 		tmp="";
									 	else 
									 		tmp=$tmp" ::";
									 		book[j]=${tmp};
									 	fi
 	
							 	fi
							 	
							 	
					 			

							 else
							 		echo "Non vallid entery ";
							 		tmp="";		
							 fi	


					 	fi


			 done

done

echo ${book[@]} >>"libs/lib1/books"
}

adddddbook 
