#!/usr/bin/ksh
set_menu_choice(){
printf 'Options:-'
printf '\n'
printf '\ta) select library\n'
printf '\tb)  Add library \n'
printf '\tc)  delete library \n'
printf '\td) Quit\n'
printf 'Please enter the choice then press return\n'
read menu_choice
return
}




# fi
func(){
	while [[ true ]]; do
	echo "enter name "
	read name
	echo "$name"
done
}
get_confirm(){
	printf '\tAre you sure?\n'
	while true
	do
	  read x
	  case "$x" in
	      y|yes|Y|Yes|YES)
	          return 0;;
	      n|no|N|No|NO)
	          printf '\ncancelled\n'
	          return 1;;
	      *) printf 'Please enter yes or no';;
	  esac
done
}
addl(){
	echo "Please enter database name :"
	read dname

	arr=(`ls libs/ `);
	if [[ $dname == +([A-za-z]) ]]; then
			if [[ " ${arr[@]} " =~ " ${dname} " ]]; then
			   echo " database exits try another name Please  "
			else
				cp -r /home/ahmed/shellproject/default/ /home/ahmed/shellproject/libs/$dname
			    echo " database created "
			fi
		else
			echo "database name cann't contain number or white space"	

	fi

		
}
#select  shelves or books to manpulate 
cho(){
echo "chose shelves or books or quit by choseing Quit "

	select opt in shelves books quit
		do
		   case $opt in
		      shelves) 
		         shelve_selected
		         ;;
		      books)
		         echo "books selected"


		         book_selected
		      ;;
		      quit) 
					cd ..
		   			cd ..
		   			arr=(`ls /home/ahmed/shellproject/libs/ `);
					arr[${#arr[*]}]="Quit"	
		   			echo "chose library : "
		   			typeset -i i
		   			for (( i = 0,j = 1; i < ${#arr[*]}; i++ , j++ )); do
		   				echo "$j) ${arr[$i]}"
		   			done
		         break 
		      ;;
		      *) echo "ERROR: Invalid selection" 
		      ;;
		   esac
		done


}

#chose library  function 
function choseLib {
			clear
		arr=(`ls libs/ `);
		arr[${#arr[*]}]="Quit"
		# echo "${arr[@]}"



		echo "chose libs by entering it's number or quit by choseing Quit "

		select alias_select in ${arr[@]} ; do
		   if [[ -z "$alias_select" ]]; then
		      echo "Invalid Choice"
		   elif [[ $alias_select == "Quit" ]]; then

		      break
		   else
		      echo "You selected: $alias_select";
		      cd  libs/$alias_select 
		      cho
		      #func
		      
		   fi
		done

}

. ./shelv.sh
. ./book.sh

quit="n"
while [ "$quit" != "y" ];
do

set_menu_choice
case "$menu_choice" in
a) choseLib ;;
b) addl ;;
c) print "delete library";;
d) quit=y;;
*) printf "Sorry, choice not recognized";;
esac
done

# echo -n  "Enter User name: "
# read  name
# echo -n "Password: "

# stty -echo
# read mypassword
# stty echo

# echo ""         # force a carriage return to be output

# if [[ $mypassword = "ahmed123" && $name = "ahmed" ]] then
# 	sed -i '/ff/d' test.txt
# 	print "hhhhhhhhhhh";
# else
# 		echo " User name or Password not correct "




# arr=(`ls libs/ `);
# # echo "${arr[@]}"
# # echo ${#arr[*]} 
# arr[${#arr[*]}]="Quit"
# # echo "${arr[@]}"



# echo "chose libs by entering it's number or quit by choseing Quit "

# select alias_select in ${arr[@]} ; do
#    if [[ -z "$alias_select" ]]; then
#       echo "Invalid Choice"
#    elif [[ $alias_select == "Quit" ]]; then
#       break
#    else
      
#       	if get_confirm; then
#       		echo "You selected: $alias_select";
#      	    cd  libs/$alias_select 
#        	fi
      
#    fi
# done



