clear
while [ 1 ]
do
	echo -ne "1.Create 2.Display 3.Insert 4.Search 5.Modify 6.Delete 7.Exit\n"
	echo -e "Enter Choice=\c"
	read ch
	case $ch in 
		1)
			echo -n "Enter File name:"
			read fname
			if [ -e $fname ]
			then 
				echo "File already Exists"
			else
				>> $fname
				echo "File Created Successfully"
			fi
			;;
		2)
			echo -n "Enter File name:"
			read fname
			if [ -e $fname ]
			then 
				echo "the content of File:"
				sort -n $fname
			else 
				echo "File not exists"
			fi
			;;
		3)
			echo -n "Enter file Name:"
			read fname
			if [ -e $fname ]
			then 
				echo -n "Enter roll number:"
				read roll
				grep -w "$roll" $fname
				ans=$?
				if [ $ans -eq 0 ]
				then 
					echo "Record already Exists"
				else 
					echo -n "Enter Name:"
					read name
					echo $roll $name >> $fname
					echo "Record inserted Successfully"
				fi
			else
				echo "File not Exists"
			fi
			;;
		4)
			echo -n "Enter file name:"
			read fname
			if [ -e $fname ]
			then 
				echo -n "Enter Roll number:"
				read roll
				grep -w "$roll" $fname
				ans=$?
				if [ $ans -eq 0 ]
				then
				       	echo "Record Found"
				else
					echo "Record not found"
				fi
			else
				echo "File doesnot Exists"
			fi
			;;
		5)
			echo -n "Enter file name:"
			read fname
			if [ -e $fname ]
			then
				echo -n "Enter the roll Number:"
				read roll
				grep -w "$roll" $fname
				ans=$?
				if [ $ans -eq 0 ]
				then 
					echo -n "Enter newRoll and new name:"
				       	read nroll nname
			       		grep -w "$nroll" $fname
			 		ans=$?
					if [ $ans -eq 0 ] 
					then 
						echo "New roll number already exists"
					else 
						grep -v "$roll" $fname >> temp
						echo "$nroll $nname" >> temp
						rm $fname
						cp temp $fname
						rm temp
						echo "Record modified successfully"
					fi
				else
					"Record not present"	
				fi	
			else 
				echo "File doesnot Exists"
			fi
			;;
		6)
			echo -n "Enter file name:"
			read fname
			if [ -e $fname ] 
			then 
				echo -n "Enter roll number:"
				read roll
				grep -w "$roll" $fname
				ans=$?
				if [ $ans -eq 0 ] 
				then 
					grep -v "$roll" $fname >> temp
					rm $fname
					cp temp $fname
					rm temp
					echo "Record deleted Successfully"
				else
					echo "Roll number doestNot exists"
				fi
			else 
				echo "File not exists"
			fi
			;;
		7) exit

			;;
		*) echo "Your choice not correct"
			;;
	esac
done


