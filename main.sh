#!/usr/bin/ksh


RED='\033[0;31m' #red
NC='\033[0m' # No Color

. ./shelv.sh
clear
toilet  -F metal Library  management system
#####datatyps
# number="/^[0-9]+$/"
# mix="/^[A-Za-z]+ [a-z0-9]*/"
# text="/^[A-Za-z]+ [a-z]*/"
#  menu="/^soft_cover$\|^hard_cover$/"
#  year="/^[0-9][0-9][0-9][0-9]$/"



#####



set_menu_choice(){
echo " Enter a to list Libraries or b to add_Library or c to delete_Library or d to quit"
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
get_confirm(){
	printf '\tAre you sure [Y|N]?\n'
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

#select  shelves or books to manpulate 
choseShelvOrBooks(){
	clear
echo "chose shelves or books or quit by choseing Quit "

	select opt in shelves books quit
		do
		   case $opt in
		      shelves) 
		         shelve_selected
		         ;;
		      books)
				. /home/ahmed/shellproject/book.sh

		         book_selected
		      ;;
		      quit) 
					cd ..
		   			cd ..
		   			clear
		   			arr=(`ls libs/ `);
					arr[${#arr[*]}]="Quit"	
		   			echo "chose library : "
		   			typeset -i i
		   			for (( i = 0,j = 1; i < ${#arr[*]}; i++ , j++ )); do
		   				echo "$j) ${arr[$i]}"
		   			done

		         break 
		      ;;
		      *) echo " ${RED} ERROR: Invalid selection${NC}" 
		      ;;
		   esac
		done


}



#chose library  function 
function choseLib {
			clear
		arr=(`ls libs/ `);
		# echo "${arr[@]}"
		# echo ${#arr[*]} 
		arr[${#arr[*]}]="Quit"
		# echo "${arr[@]}"



		echo "chose libs by entering it's number or quit by choseing Quit "

		select alias_select in ${arr[@]} ; do
		   if [[ -z "$alias_select" ]]; then
		      echo " ${RED} Invalid Choice ${NC}"
		   elif [[ $alias_select == "Quit" ]]; then
		      break
		   else
		      echo "You selected: $alias_select";
		      cd  libs/$alias_select 
		      choseShelvOrBooks

		      #func
		      
		   fi
		done

}
function deleteLib {
			
		arr=(`ls libs/ `);
		# echo "${arr[@]}"
		# echo ${#arr[*]} 
		arr[${#arr[*]}]="Quit"
		# echo "${arr[@]}"



		echo "delete library by entering it's number or quit by choseing Quit "

		select alias_select in ${arr[@]} ; do
		   if [[ -z "$alias_select" ]]; then
		      echo "${RED} Invalid Choice ${NC}"
		   elif [[ $alias_select == "Quit" ]]; then
		      break
		   else
		      echo "You selected: $alias_select to be deleted";
		      if  get_confirm; then
		      		rm -rf  libs/$alias_select 
		      		echo "$alias_select has been deleted";
		      		break
		      fi
		      
		      #func
		      
		   fi
		done

}
function addLib {
			
		echo "Please enter library name :"
	read dname

	arr=(`ls libs/ `);
	if [[ $dname == +([A-za-z]) ]]; then
			if [[ " ${arr[@]} " =~ " ${dname} " ]]; then
			   echo " library exits try another name Please  "
			else
				cp -r default/ libs/$dname
			    echo " library created "
			fi
		else
			echo "${RED}library name cann't contain number or white space ${NC}"	

	fi


}




echo -n  "Enter User name: "
read  name
echo -n "Password: "

stty -echo
read mypassword
stty echo

echo ""         # force a carriage return to be output

if [[ $mypassword = "ahmed123" && $name = "ahmed" ]]; then
	


quit="n"
while [ "$quit" != "y" ];
do

set_menu_choice
case "$menu_choice" in
	a) choseLib ;;
	b) addLib;;
	c) deleteLib ;;
	d) quit=y;;
	*) printf "${RED}Sorry, choice not recognized  ${NC}";;
	esac
done
# menu=1;
# 	while [[ $menu -eq 1 ]]
# 	do
		# select choice in chose_Libraries add_Library delete_Library
		# do
		# 	case $choice in
		# 	chose_Libraries) choseLib
		# 	;;
		# 	add_Library) ls -a
		# 	;;
		# 	delete_Library) exit
		# 	;;
		# 	esac

		# 	print " press 1 to continue  or  0 to exit "
		# 	read menu
		# 	if [[ menu -eq 0 ]]
		# 	then
		# 		break
		# 	fi
		# done
# 	done

























else
		echo " ${RED} User name or Password not correct  ${NC}"


fi
 





	













