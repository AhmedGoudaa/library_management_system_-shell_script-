#!/usr/bin/ksh
insert_shelve_record(){
	echo $* >>"shelves"
	return
}
# check_shelve
addShelve(){
				echo "addShelve"


				#prompt for information
				tmp="";
			 while [[ $tmp = "" ]]; do
				printf 'Please Enter shelve location:- '
					read tmp
					 if [[ $tmp == +([A-za-z]) ]]; then
					 	chk="";
					 	chk=$(awk -F: -v env_var="$tmp" '{if($1==env_var) print  $1}' shelves);

					 	#  t=$(awk -F: -v a=$tmp '{if($1==$a) print $1}' shelves)
					 	#  echo "$t"
					 	# echo "$chk"
					 	if [[ $chk ]]; then
					 		echo "shelve location exist try another one "
					 		tmp="";
					 	else 
					 		shelveLoc=${tmp};
					 	fi
			 			

					 else
					 		echo "shelve location cann't contain space or numbers ";
					 		tmp="";		
					 fi	
			 done

		
			 tmp="";
			 while [[ $tmp = "" ]]; do
				printf 'Please Enter shelve number:- '
					read tmp
					 if [[ $tmp == +([0-9])  ]]; then
					 	chk="";
					 	chk=$(awk -F: -v env_var="$tmp" '{if($2==env_var) print  $2}' shelves);
					 	if [[ $chk ]]; then
					 		echo "shelve number exist try another one "
					 		tmp="";

					 	else 
					 		shelveNum=${tmp};
					 		
					 	fi

					 else
					 		print "shelve number cann't contain space or characters ";
					 		tmp="";		
					 fi	
			 done

			 
			#Check that they want to enter the information
			printf 'About to add new entry\n'
			printf "$liCatNum\t$liTitleNum\t$liAutherNum\n"
			 
			#If confirmed then append it to the record file
			if get_confirm; then
			   insert_shelve_record $shelveLoc:$shelveNum
			fi
			 
			return
}
deleteShelve(){
	echo "deleteShelve"
	a=($(awk -F: '{print  $1}' shelves))
		# echo $a;
		a[${#a[*]}]="Quit"

	echo "chose shelve to delete by entering it's number or quit by choseing Quit "

		select alias_select in ${a[@]} ; do
		   if [[ -z "$alias_select" ]]; then
		      echo "Invalid Choice"
		   elif [[ $alias_select == "Quit" ]]; then
		      break
		   else
		      echo "You selected: $alias_select";
		      alias_select=$alias_select":";
		      sed -i '/^'"$alias_select"'/d' shelves

		      #func
		      
		   fi
		done


}

shelve_choice(){
echo " Enter 1 to add shelve or 2 to delete shelve or 3 to quit"
printf 'Options:-'
printf '\n'
printf '\t1) add shelve\n'
printf '\t2)  delete shelve \n'
printf '\t3) Quit\n'
read shelve_ch
return
}
shelvebooks(){
	echo "chose shelves or books or quit by choseing Quit "
	echo " 1) shelves"
	echo " 2) books"
	echo " 3) quits"
}

shelve_selected(){

	quit="n"
while [ "$quit" != "y" ];
do

shelve_choice
case "$shelve_ch" in
	1) addShelve ;;
	2) deleteShelve;;
	3) shelvebooks 
		 quit=y ;;
	*) printf "Sorry, choice not recognized";;
	esac
done

}