package com.nmt.universitysb.formatters;

import com.nmt.universitysb.model.ScoreColumn;
import org.springframework.format.Formatter;

import java.text.ParseException;
import java.util.Locale;

public class ScoreColumnFormatter implements Formatter<ScoreColumn> {


    @Override
    public ScoreColumn parse(String id, Locale locale) throws ParseException {
        return new ScoreColumn(Integer.parseInt(id));
    }

    @Override
    public String print(ScoreColumn object, Locale locale) {
        return String.valueOf(object.getId());
    }
}
