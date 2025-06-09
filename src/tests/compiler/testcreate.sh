#!/bin/bash

# Set the main class and test directory
MAINCLASS="Main"
TESTDIR="tests"

# List of test files (without extensions)
TESTS="add conc.1 fib fibSer fn1 fn2 fn3 ftst hello infix infix2 odd_even pairs1 pairs2 pairs3 picture towers vectorsum defns.1"

echo "Generating .out files in $TESTDIR..."

# Compile if needed
echo "Compiling Java files..."
make > /dev/null

# Generate .out files
for test in $TESTS; do
    if [[ -f "$TESTDIR/$test" ]]; then
        echo "Running $test..."
        java $MAINCLASS "$TESTDIR/$test" > "$TESTDIR/$test.out"
    else
        echo "Warning: $TESTDIR/$test not found"
    fi
done

echo "✅ .out files generated."
