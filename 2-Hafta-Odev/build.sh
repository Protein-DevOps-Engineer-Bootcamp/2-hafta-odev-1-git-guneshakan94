#!/bin/bash
#################help################
if [[ "$1" == "--help" ]];
then
    echo "Usage:
    -b  <branch_name>     Branch name
    -n  <new_branch>      Create new branch
    example:
    build.sh -b branchname
    build.sh -n newbranchname"
fi
#################help################

#################build_and_debug################
read -p "Do you want to open the Debug Mode for build process? (yes or no, default:no): "$'\n' debug
debug=${debug:-no}
if [[ "$debug" == "yes" ]];
then
    if [[ "$1" == "-n" ]];
    then
        git clone https://github.com/Protein-DevOps-Engineer-Bootcamp/2-hafta-odev-1-git-guneshakan94.git
        cd 2-hafta-odev-1-git-guneshakan94
        git checkout -b $2
        mvn -X compile
        mvn -X package
    elif [[ "$1" == "-b" ]];
    then
        git clone https://github.com/Protein-DevOps-Engineer-Bootcamp/2-hafta-odev-1-git-guneshakan94
        if [[ "$2" == main ]];
        then    
            echo "WARNING!!! You are building the main or master branch at the moment!"
            sleep 2
            cd 2-hafta-odev-1-git-guneshakan94
            git checkout $2
            mvn -X compile
            mvn -X package
        else
            cd 2-hafta-odev-1-git-guneshakan94
            git checkout $2
            mvn -X compile
            mvn -X package
        fi
    fi
   
elif [[ "$debug" == "no" ]];
then
    if [[ "$1" == "-n" ]];
    then
        git clone https://github.com/Protein-DevOps-Engineer-Bootcamp/2-hafta-odev-1-git-guneshakan94
        cd 2-hafta-odev-1-git-guneshakan94
        git checkout -b $2
        mvn compile
        mvn package
    #   -b  <branch_name>     Branch name
    elif [[ "$1" == "-b" ]];
    then
        git clone https://github.com/Protein-DevOps-Engineer-Bootcamp/2-hafta-odev-1-git-guneshakan94
        if [[ "$2" == main ]];
        then    
            echo "WARNING!!! You are building the main or master branch at the moment!"
            sleep 2
            cd 2-hafta-odev-1-git-guneshakan94
            git checkout $2
            mvn compile
            mvn package
        else
            cd 2-hafta-odev-1-git-guneshakan94
            git checkout $2
            mvn compile
            mvn package
        fi
    fi	
fi
#################build_and_debug################

#################compress################
read -p "Choose the type of compression (zip or tar.gz, default:tar.gz):"$'\n' compress
compress=${compress:-tar.gz}
if [[ "$compress" == "tar.gz" ]];
then
    read -p "Write full path for compress."$'\n' path 
    path=${path:-/opt}
    tar -czvpf /$path/$2.tar.gz ./target  
elif [[ "$compress" == "zip" ]];
then
    read -p "Write full path for compress."$'\n' path
    path=${path:-/opt}
    zip /$path/$2.zip ./target
else
    Echo "You have entered the invalid type."
fi
#################compress################


