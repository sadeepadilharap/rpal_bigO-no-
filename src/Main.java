import lexar.LexAnalyzer;

import java.io.File;

public class Main {
    public static void main(String[] args) {
        File file = new File(args[0]); // for makefile

        LexAnalyzer lexicalAnalyzer = new LexAnalyzer(file);
    }
}