set -e

rm -rf student-submission
git clone $1 student-submission
FILE=student-submission/ListExamples.java
if [ ! -f "$FILE" ]; then
 	echo "File does not exist."
fi
CPATH=.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar
set +e
javac -cp $CPATH *.java 2>error.txt
if [[ $? -ne 0 ]]; then
	echo "Compiler error."
	exit
fi
java -cp $CPATH org.junit.runner.JUnitCore TestListExamples 