#!/usr/bin/ksh
insert_book_record(){
	echo $* >>"books"
	return
}
# getBookCols(){

	
# }
# check_shelve




addBook(){


a=($(awk -F:: '{print $1 ,$2}' meta))
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
									         tmp=$tmp"::";
									         book[j]=${tmp}
									         break
									         ;;
									      hard_cover)
									         echo "Hard cover"
									         tmp=$tmp"::";
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
							 			# echo "im in titile $tmp"
									 		chk=$(awk -F:: -v env_var="$tmp" '{if($2==" "env_var) print  $2}' books);
									 		# awk -F::  '{if($2=="omar") print  $2}' books
									 	#  t=$(awk -F: -v a=$tmp '{if($1==$a) print $1}' shelves)
									 	#  echo "$t"
									 	# echo "$chk"
									 	if [[ $chk ]]; then
									 		echo "book Title exist try another one "
									 		tmp="";
									 	else 
									 		tmp=$tmp"::";
									 		book[j]=${tmp};
									 	fi

								 	
							 	elif  [[ ${a[$i]} == "ISBN" ]]; then
									 		chk=$(awk -F:: -v env_var="$tmp" '{if($1==env_var) print  $1}' books);

									 	#  t=$(awk -F: -v a=$tmp '{if($1==$a) print $1}' shelves)
									 	#  echo "$t"
									 	# echo "$chk"
									 	if [[ $chk ]]; then
									 		echo "book ISBN exist try another one "
									 		tmp="";
									 	else 
									 		tmp=$tmp"::";
									 		book[j]=${tmp};
									 	fi

								elif [[ ${a[$i]} == "Shelve_No" ]]; then
											chk=$(awk -F: -v env_var="$tmp" '{if($2==env_var) print  $2}' shelves);

									 	if [[ $chk ]]; then
									 		tmp=$tmp"::";
									 		book[j]=${tmp};
									 		
									 	else 
									 		echo "shelve dosn't exist try another one exists "
									 		tmp="";
									 	fi
	 	




									else
									 	tmp=$tmp"::";
									 	book[j]=${tmp};
 	
							 	fi
							 		
							 	
							 	
					 			

							 else
							 		echo "Non vallid entery ";
							 		tmp="";		
							 fi	


					 	fi


			 done

done
# for i in words; do
# 	#statements
# done

echo ${book[@]} >>"books"
}


deleteBook(){
	echo "deletebook"
	a=($(awk -F:: '{print  $1}' books))
		# echo $a;
		a[${#a[*]}]="Quit"
	echo "Delete book by ISBN "
	echo "chose book to delete by entering it's number in the list  or quit by choseing Quit "

		select alias_select in ${a[@]} ; do
		   if [[ -z "$alias_select" ]]; then
		      echo "Invalid Choice"
		   elif [[ $alias_select == "Quit" ]]; then
		      break
		   else
		      echo "You selected: $alias_select";
		      alias_select=$alias_select":";
		      sed -i '/^'"$alias_select"'/d' books
		      # sed -i '/^'"$alias_select"'/d' libs/lib1/books

		      #func
		      
		   fi
		done


}
editeBook(){

# a($(awk -F:: '{ for(i = 1; i <= NF; i++) { print $i; } }' libs/lib1/books))
# /home/ahmed/shellproject/libs
echo $1;
a=($(awk -F:: '{print $1 ,$2}' meta))
 w=($(awk -F:: -v env=$1  '{if($1==env) {for(i = 1; i <= NF; i++) { print $i; }} }' books))
  # w=($(awk -F::   '{if($1==3) {for(i = 1; i <= NF; i++) { print $i; }} }' libs/lib1/books))

 echo ${w[@]}
 sed -i '/^'"$1"'/d' books

 typeset -i i;	
  typeset -i j;

for ((j=0, i = 0; i < ${#a[*]}; i+=2,j++ )); do
tmp="";

			 while [[ $tmp = "" ]]; do
			 	# regex= ${!a[$i+1]};
			 	# if [[ ${a[$i]} == "Cover_type" ]]; then
					#  		echo "Enter 1 for soft_cover or 2 for hard_cover : "
					#  		select tmp in soft_cover hard_cover
					# 				do
					# 				   case $tmp in
					# 				      soft_cover) 
					# 				         echo "Soft cover"
					# 				         tmp=$tmp"::";
					# 				         book[j]=${tmp}
					# 				         break
					# 				         ;;
					# 				      hard_cover)
					# 				         echo "Hard cover"
					# 				         tmp=$tmp"::";
					# 				         book[j]=${tmp}
					# 				         break
									      
					# 				      ;;
					# 				      *) echo "ERROR: Invalid selection enter 1 or 2 only " 
					# 				      ;;
					# 				   esac
					# 				done

						

					


						 # echo "Please Enter ${a[$i]}   :-"
						 	read -e -p "Please Enter ${a[$i]} :- " -i "${w[$j]}" tmp
							# read tmp
							# ${${a[$i+1]}//""}
							regex=${a[$i+1]}
							regex="${regex%\"}"
							regex="${regex#\"}"
							# echo "$regex "
								
							 if [[ $tmp =~ $regex ]]; then
							 	chk="";
							 

							 	if [[ ${a[$i]} == "Title" ]]; then
									 		chk=$(awk -F:: -v env_var="$tmp" '{if($2==" "env_var) print  $2}' books);
									 	#  t=$(awk -F: -v a=$tmp '{if($1==$a) print $1}' shelves)
									 	#  echo "$t"
									 	# echo "$chk"
									 	if [[ $chk ]]; then
									 		echo "book Title exist try another one "
									 		tmp="";
									 	else 
									 		tmp=$tmp"::";
									 		book[j]=${tmp};
									 	fi

								 	
							 	elif  [[ ${a[$i]} == "ISBN" ]]; then
									 		chk=$(awk -F:: -v env_var="$tmp" '{if($1==env_var) print  $1}' books);

									 	#  t=$(awk -F: -v a=$tmp '{if($1==$a) print $1}' shelves)
									 	#  echo "$t"
									 	# echo "$chk"
									 	if [[ $chk ]]; then
									 		echo "book ISBN exist try another one "
									 		tmp="";
									 	else 
									 		tmp=$tmp"::";
									 		book[j]=${tmp};
									 	fi

								elif [[ ${a[$i]} == "Shelve_No" ]]; then
											chk=$(awk -F: -v env_var="$tmp" '{if($2==env_var) print  $2}' shelves);

									 	if [[ $chk ]]; then
									 		tmp=$tmp"::";
									 		book[j]=${tmp};
									 		
									 	else 
									 		echo "shelve dosn't exist try another one exists "
									 		tmp="";
									 	fi
	 	




									else
									 	tmp=$tmp"::";
									 	book[j]=${tmp};
 	
							 	fi
							 		
							 	
							 	
					 			

							 else
							 		echo "Non vallid entery ";
							 		tmp="";		
							 fi	


					 	


			 done

done

# for i in words; do
# 	#statements
# done

echo ${book[@]} >>"books"
	# choseBookToEdite


}
choseBookToEdite(){

		echo "editebook"
	a=($(awk -F:: '{print  $1}' books))
		 echo ${a[@]};
		a[${#a[*]}]="Quit"
	echo "edite book by ISBN "
	echo "chose book to edite by entering it's number in the list  or quit by choseing Quit "

		select alias_select in ${a[@]} ; do
		   if [[ -z "$alias_select" ]]; then
		      echo "Invalid Choice"
		   elif [[ $alias_select == "Quit" ]]; then
		      break
		   else
		      echo "You selected: $alias_select";
		      # alias_select=$alias_select":";
		      editeBook $alias_select
		      # break
		      # sed -i '/^'"$alias_select"'/d' libs/lib1/books

		      #func
		      
		   fi
		done	



}

addField(){
	tmp=""
	while [[ $tmp = "" ]]; do
		echo "Enter Field name : "
		read tmp	
		if [[ $tmp =~ ^[A-Za-z]+([[:space:]]{0,1}[a-z]{3,8})*$ ]]; then
				chk="";
							 
					chk=$(awk -F:: -v env_var="$tmp" '{if($1==env_var) print  $1}' meta);
									 	#  t=$(awk -F: -v a=$tmp '{if($1==$a) print $1}' shelves)
									 	#  echo "$t"
									 	# echo "$chk"
					if [[ $chk ]]; then
						echo "Field name exist try another one "
							tmp="";
						else 
							tmp=$tmp"::";
							echo $tmp
					fi
			fi						 	

	done

# 	//////////////
# 	ISBN::"^[0-9]+$"
# Title::"^[A-Za-z]+([[:space:]]{0,1}[a-z]{3,8})*$"
# Author::"^[A-Za-z]{2,8}([[:space:]]{0,1}[a-z]*)*$"
# Number_of_pages::"^[0-9]+$"
# Cover_type::"^soft_cover$|^hard_cover$"
# Edition_No::"^[0-9]+$"
# Shelve_No::"^[0-s]+$"
# Publisher::"^[A-Za-z]+([[:space:]]{0,1}[a-z0-9]*)*"
# Publishing_year::"^(199[0-9]|20[0-1][0-9])$"

# 	//////////

	echo "Enter Field datatype : "
	datatype=""
			select choice in numbers string mix
		do
			case $choice in
			numbers) datatype="\"^[0-9]*$\""
				break
			;;
			string) datatype="\"^[A-Za-z]*([[:space:]]{0,1}[a-z]*)*$\""
				
				break
			;;
			mix)  datatype="\"(^[A-Za-z]+([[:space:]]{0,1}[a-z0-9]*)*)*\""
				break
			;;
			 *) echo "ERROR: Invalid selection enter 1 or 2 only " 
									      ;;
			esac

			
		done
	

echo $tmp""$datatype >>"meta"


}


searchBook(){
		tmp=""
	while [[ $tmp = "" ]]; do
		echo "Enter ISBN  to find a book : "
		read tmp	
		if [[ $tmp =~ ^[0-s]+$ ]]; then
				chk="";
							 
					chk=$(awk -F:: -v env_var="$tmp" '{for(i = 1; i <= NF; i++){if($1==env_var) { print $i; }}}' books);
									 	#  t=$(awk -F: -v a=$tmp '{if($1==$a) print $1}' shelves)
									 	#  echo "$t"
									 	# echo "$chk"
					if [[ $chk ]]; then
						echo "book found  "
						 echo ${chk[@]}
						 	tmp=$tmp"::";
							# echo $tmp
							
						else 
							echo "book not found  "
						 # echo ${w[@]}
						 	tmp=$tmp"::";
							# echo $tmp
					fi
			fi						 	

	done

}



book_choice(){
echo " Enter 1 to add book or 2 to delete book or 3 update or 4 to search or 5 to quit"
printf 'Options:-'
printf '\n'
printf '\t1) add book\n'
printf '\t2) delete book \n'
printf '\t3) update book \n'
printf '\t4) search book \n'
printf '\t5) add Field \n'
printf '\t6) Quit\n'
read book_ch
return
}

 


book_selected(){

	quit="n"
while [ "$quit" != "y" ];
do

book_choice
case "$book_ch" in
	1) addBook 
		echo "addBook" ;;
	2) deleteBook;;
	3) choseBookToEdite;;
	4) searchBook;;
	5) addField;;
	6) shelvebooks 
		 quit=y ;;
	*) printf "Sorry, choice not recognized";;
	esac
done

}