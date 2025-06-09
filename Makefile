JFLAGS = -g -cp src
JC = javac
JAR = jar

.SUFFIXES: .java .class

src/%.class: src/%.java
	$(JC) $(JFLAGS) -d src $<

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

# Compile all Java files at once to handle dependencies properly
compile-all:
	$(JC) $(JFLAGS) -d src src/**/*.java src/*.java

test: compile-all
	@echo "Running test comparisons..."
	@fail=0; \
	for t in $(TESTS); do \
		echo "Comparing $$t..."; \
		java -cp src $(MAINCLASS) tests/$$t > tmp.out; \
		if diff -q tests/$$t.out tmp.out; then \
			echo "✅ $$t PASSED"; \
		else \
			echo "❌ $$t FAILED"; \
			fail=1; \
		fi; \
	done; \
	rm -f tmp.out; \
	exit $$fail

clean:
	find src -name "*.class" -exec rm -f {} +

.PHONY: default classes compile-all test clean