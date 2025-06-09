import CS.CSNode;
import CS.ControlStructures;
import Lexar.LexAnalyzer;
import Lexar.Token;
import Parser.ParseTree;
import Parser.AST;
import cse_machine.CSE;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        if (args.length < 1) {
            System.out.println("Usage: java Main [-token] [-ast] [-st] <filename>");
            return;
        }

        // Initialize flags
        boolean printTokens = false;
        boolean printAST = false;
        boolean printST = false;

        // The last argument must be the filename
        String fileName = args[args.length - 1];
        if (fileName.startsWith("-")) {
            System.out.println("Error: Missing input file.");
            return;
        }

        // Parse flags from args (excluding the last argument which is the filename)
        for (int i = 0; i < args.length - 1; i++) {
            switch (args[i]) {
                case "-token":
                    printTokens = true;
                    break;
                case "-ast":
                    printAST = true;
                    break;
                case "-st":
                    printST = true;
                    break;
                default:
                    System.out.println("Unknown flag: " + args[i]);
                    return;
            }
        }

        File file = new File(fileName);

        // 2. Lexical Analysis
        LexAnalyzer lexicalAnalyzer = new LexAnalyzer(file);
        ArrayList<Token> tokenList = lexicalAnalyzer.getTokenList();

        if (printTokens) {
            System.out.println("🔍📝 Token List 📝🔍");
            for (Token token : tokenList) {
                System.out.println(token);
            }
        }

        // 3. Parse the tokens to a ParseTree
        ParseTree parser = new ParseTree(tokenList);
        AST ast = parser.buildAst();

        if (printAST) {
            System.out.println("🌳✨ Abstract Syntax Tree ✨🌳");
            ast.print();
        }

        // 4. Standardize AST
        ast.standardize();

        if (printST) {
            System.out.println("🎯⚡ Standardized Tree ⚡🎯");
            ast.print();
        }

        // 5. Generate Control Structures
        ControlStructures ctrlstruct = new ControlStructures();
        ctrlstruct.genControlStructures(ast.getRoot());
        List<List<CSNode>> deltc_struct = ctrlstruct.getCS();

        // 6. Run CSE Machine
        CSE cse_m = new CSE(deltc_struct);
        cse_m.runCSE();
        System.out.println();
    }
}