JFLAGS = -g
JC = javac
JAR = jar

.SUFFIXES: .java .class
.java.class:
	$(JC) $(JFLAGS) $*.java

CLASSES = \
	src/Lexar/LexAnalyzer.java \
	src/Lexar/Token.java \
	src/Parser/AST.java \
	src/Parser/LeafNode.java \
	src/Parser/Node.java \
	src/Parser/ParseException.java \
	src/Parser/ParseTree.java \
	src/CS/ControlStructures.java \
	src/CS/CSNode.java \
	src/cse_machine/CSE.java \
	src/cse_machine/EnvironmentTree.java \
	src/cse_machine/EnvNode.java \
	src/cse_machine/EvaluationException.java \
	src/cse_machine/RPALFunc.java \
	src/cse_machine/RPALBinaryOps.java \
	src/cse_machine/RPALUnaryOps.java \
	src/Main.java

TESTS = add conc.1 fib fibSer fn1 fn2 fn3 ftst hello infix infix2 odd_even pairs1 pairs2 pairs3 picture towers vectorsum defns.1

MAINCLASS = Main

default: classes

classes: $(CLASSES:.java=.class)

test: default
	@echo "Running test comparisons..."
	@fail=0; \
	for t in $(TESTS); do \
		echo "Comparing $$t..."; \
		java $(MAINCLASS) src/tests/$$t > tmp.out; \
		if diff -q src/tests/$$t.out tmp.out; then \
			echo "✅ $$t PASSED"; \
		else \
			echo "❌ $$t FAILED"; \
			fail=1; \
		fi; \
	done; \
	rm -f tmp.out; \
	exit $$fail


clean:
	find . -name "*.class" -exec $(RM) {} +