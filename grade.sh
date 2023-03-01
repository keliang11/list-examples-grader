CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf ListExamples
git clone $1 ListExamples
echo 'Finished cloning'

    if [[ -f ListExamples/ListExamples.java ]]
    then
        echo "File Found"
    else
        echo "File NOT found. Possible causes: wrong filenane, file saved in next directory, etc."
        exit
    fi

    cp -r ListExamples/ListExamples.java .
    if [[ -f ListExamples.java ]]
    then
        echo "Successfully moved file to same directory"
    else
        echo "Not moved"
        exit
    fi

    javac ListExamples.java 2>error-output.txt
   
    #cat error-output.txt

    java ListExamples 2>out.txt
    
    #cat out.txt
    
    javac -cp ".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar" *.java
    #echo $?
    java -cp ".;lib/junit-4.13.2.jar;lib/hamcrest-core-1.3.jar" org.junit.runner.JUnitCore TestListExamples
    echo $? "ERROR(S)"
    
