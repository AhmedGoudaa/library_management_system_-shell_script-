#!/usr/bin/ksh
tst="north";
test=$tst":";
# echo $test;
number='"/^[0-9]+$/"'
mix='"/^[A-Za-z]+ [a-z0-9]*/"'
text='"/^[A-Za-z]+ [a-z]*/"'
 menu='"/^soft_cover$\|^hard_cover$/"'
 year='"/^[0-9][0-9][0-9][0-9]$/"'
n="32aa2fd87338e241978c48ab319641bc -"
echo "Please Enter User Name "
read name
echo "Please Enter User password "
read pass
hash="$(echo -n "$pass" | md5sum )"
if [[ $pass = $hash && $name = "ahmed" ]]; then

print"hi ahmed "
fi
break



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
									 		chk=$(awk -F:: -v env_var="$tmp" '{if($2==env_var) print  $2}' libs/lib1/books);
									 		awk -F:: '{if($2=="ali") print  $2}' libs/lib1/books
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
									 		chk=$(awk -F:: -v env_var="$tmp" '{if($1==env_var) print  $1}' libs/lib1/books);

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
											chk=$(awk -F: -v env_var="$tmp" '{if($2==env_var) print  $2}' libs/lib1/shelves);

									 	#  t=$(awk -F: -v a=$tmp '{if($1==$a) print $1}' shelves)
									 	#  echo "$t"
									 	# echo "$chk"
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

echo ${book[@]} >>"libs/lib1/books"
}

# adddddbook 

# read -e -p "Enter Your Name:" -i "Ricardo" NAME

RED='\033[0;31m' #red
NC='\033[0m' # No Color
printf "${RED} ${NC}\n"
editebook(){
# a($(awk -F:: '{ for(i = 1; i <= NF; i++) { print $i; } }' libs/lib1/books))
# /home/ahmed/shellproject/libs
echo $1;
a=($(awk -F:: '{print $1 ,$2}' libs/lib1/meta))
 w=($(awk -F:: -v env=$1  '{if($1==env) {for(i = 1; i <= NF; i++) { print $i; }} }' libs/lib1/books))
  # w=($(awk -F::   '{if($1==3) {for(i = 1; i <= NF; i++) { print $i; }} }' libs/lib1/books))

 echo ${w[@]}
 # sed -i '/^'"$1"'/d' libs/lib1/books

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
									 		chk=$(awk -F:: -v env_var="$tmp" '{if($2==env_var) print  $2}' libs/lib1/books);
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
									 		chk=$(awk -F:: -v env_var="$tmp" '{if($1==env_var) print  $1}' libs/lib1/books);

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
											chk=$(awk -F: -v env_var="$tmp" '{if($2==env_var) print  $2}' libs/lib1/shelves);

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

echo ${book[@]} >>"libs/lib1/books"
}
choseBook(){

		echo "editebook"
	a=($(awk -F:: '{print  $1}' libs/lib1/books))
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
		      editebook $alias_select
		      # sed -i '/^'"$alias_select"'/d' libs/lib1/books

		      #func
		      
		   fi
		done	



}
choseBook

 if ($registForm->isValid($this->_request->getPost())) {
                $user_info["image"] = $_FILES["image"];
                if (!empty($_FILES["image"]["name"])) {
                    $originalFilename = pathinfo($registForm->image->getFileName());
                    $newName = uniqid() . "." . $originalFilename['extension'];
                    var_dump($newName);
                    $registForm->image->addFilter('Rename', $newName);
                }
                
                 
                      $data = $registForm->getValues();
                     var_dump($data);
     
        }

        $this->view->registForm = $registForm;
        	