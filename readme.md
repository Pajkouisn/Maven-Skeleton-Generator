# Maven Skeleton Generator

## Simple bash script to create a maven project skeleton to quickly begin development in Java. 

**Deafults**

	1. The script generates: 
		* An empty Class skeleton in src/main/java with your desired <class_name>.
		* Test class for unit testing <class_name> in src/test/java.
		* Constants class for storing all constants.
	2. The POM imports junit tests as a maven dependency
	2. Maven compiler build plugin 1.8 for source and target.
	3. Create a simple readme with a minimal description.

**Setup**
	
 Run the setup.sh script.
    
    	sh setup.sh
        
  **Generating Skeleton**
  
 Run the maven-skeleton-generator script
  
  		sh maven-skeleton-generator.sh
        
 