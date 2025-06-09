JFLAGS = -g
JC = javac
JAR = jar

.SUFFIXES: .java .class
.java.class:
	$(JC) $(JFLAGS) $*.java

CLASSES = \
	Lexar/LexAnalyzer.java \
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
	myrpal.java

TESTS = add conc.1 fib fibSer fn1 fn2 fn3 ftst hello infix infix2 odd_even pairs1 pairs2 pairs3 picture towers vectorsum defns.1

MAINCLASS = myrpal

default: classes

classes: $(CLASSES:.java=.class)

test: default
	@echo "Running test comparisons..."
	@fail=0; \
	for t in $(TESTS); do \
		echo "Comparing $$t..."; \
		java $(MAINCLASS) tests/$$t > tmp.out; \
		if diff -q tests/$$t.out tmp.out; then \
			echo "✅ $$t PASSED"; \
		else \
			echo "❌ $$t FAILED"; \
			fail=1; \
		fi; \
	done; \
	rm -f tmp.out; \
	exit $$fail

help:
	@echo "📘 Usage Guide for RPAL System"
	@echo ""
	@echo "👉 To compile the project:"
	@echo "   make"
	@echo ""
	@echo "👉 To clean compiled files:"
	@echo "   make clean"
	@echo ""
	@echo "👉 To run tests and compare output:"
	@echo "   make test"
	@echo ""
	@echo "👉 To run the RPAL interpreter manually:"
	@echo "   java myrpal [-token] [-ast] [-st] <filename>"
	@echo ""
	@echo "   Example:"
	@echo "     java myrpal -ast -st tests/add"
	@echo ""
	@echo "💡 Flags:"
	@echo "   -token   Print token list from lexer"
	@echo "   -ast     Print abstract syntax tree"
	@echo "   -sast      Print standardized tree"


clean:
	find . -name "*.class" -exec $(RM) {} +