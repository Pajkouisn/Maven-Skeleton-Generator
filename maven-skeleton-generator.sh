#!/bin/bash

#	Moce to the path where the sample repository exists.
cd $SAMPLE_MAVEN_PROJECT_PATH

# 	Get the folder name.
folder_name=$1

#	Validate and try creating a directory.
while true; do
{
	#	Ensures that a valid target target folder name is entered.
	if [ ${#folder_name} -ge 1 ]; then 
	{
		echo 'Building new project directory ' $folder_name

		#	Try deleting directory if it doesn't exist.
		rm -r ./$folder_name 
		echo deleted

		#	Create a copy of the sample in a new directory.
		cp -r sample/ $folder_name/
		break
	}
	else
		echo wrong
		read -p "Please enter a valid directory name to create the project in: " folder_name 
	fi
}	
done

#	Update the folder name in the POM.
sed -i -e "s/{sample}/$folder_name/g" ./$folder_name/pom.xml

#	Enter a project name.
read -p "Enter a project name: " project_name
sed -i -e "s/{sample_name}/$project_name/g" ./$folder_name/pom.xml

#	Enter a description
read -p "Enter a project description: " description
sed -i -e "s/{sample_description}/$description/g" ./$folder_name/pom.xml
sed -i -e "s/{project_name}/$project_name/g" ./$folder_name/readme.md
echo $description >> ./$folder_name/readme.md

#	Create a new package name similar to the group ID sor src/ main.
mkdir ./$folder_name/src/main/java/pajkouisn/utilities/$folder_name/
read -p "Enter a classname for the default class: " class_name
sed -i -e "s/sample/$folder_name/g" ./$folder_name/src/main/java/pajkouisn/utilities/sample/Sample.java
sed -i -e "s/Sample/$class_name/g" ./$folder_name/src/main/java/pajkouisn/utilities/sample/Sample.java
mv ./$folder_name/src/main/java/pajkouisn/utilities/sample/Sample.java ./$folder_name/src/main/java/pajkouisn/utilities/sample/$class_name.java
cp -r ./$folder_name/src/main/java/pajkouisn/utilities/sample/* ./$folder_name/src/main/java/pajkouisn/utilities/$folder_name/
rm -r ./$folder_name/src/main/java/pajkouisn/utilities/sample

# 	Add test resources
mv ./$folder_name/src/"test"/java/pajkouisn/unit/Test.java ./$folder_name/src/"test"/java/pajkouisn/unit/Test$class_name.java
sed -i -e "s/{classname}/$class_name/g" ./$folder_name/src/"test"/java/pajkouisn/unit/Test$class_name.java
