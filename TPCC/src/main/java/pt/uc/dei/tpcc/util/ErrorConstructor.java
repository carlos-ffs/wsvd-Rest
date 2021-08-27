package pt.uc.dei.tpcc.util;

public class ErrorConstructor {

    private String error;

    public ErrorConstructor(int size, Exception e, String inicialPhrase) {
        String exp = e.toString();
        if(exp.length() >= size)
            exp = inicialPhrase + exp.substring(0,size) + "...";
        else
            exp = inicialPhrase + exp + "...";

        this.error = exp;
    }

    public String getError() { return error; }
}
