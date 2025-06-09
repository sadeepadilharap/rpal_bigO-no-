JFLAGS = -g
JC = javac
JAR = jar
.SUFFIXES: .java .class
.java.class:
	$(JC) $(JFLAGS) $*.java

# List all the Java source files here
CLASSES = \
	Lexar/LexicalAnalyzer.java \
	Lexar/Token.java \
	Parser/AST.java \
	Parser/LeafNode.java \
	Parser/Node.java \
	Parser/ParseException.java \
	Parser/ParseTree.java \
	CS/ControlStructures.java \
	CS/CSNode.java \
	cse_machine/CSE.java \
	cse_machine/EnvironmentTree.java \
	cse_machine/EnvNode.java \
	cse_machine/EvaluationException.java \
	cse_machine/RPALFunc.java \
	cse_machine/RPALBinaryOps.java \
	cse_machine/RPALUnaryOps.java \
	rpal20.java

# Target for building the classes
default: classes

# Rule for compiling Java source files into classes
classes: $(CLASSES:.java=.class)

# first test is sample test following the naming convention in the project description
# rest of the tests are the sample programs provided with the rpal 
test:

# both build and test
check: default test

# clean all the class files
clean:
	find -name "*.class" -exec $(RM) {} +