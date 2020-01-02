/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.List;

/**
 *
 * @author josu_
 */
public class Export {
    
    private final List<String> fields;
    private final String extractText;
    private final List<String> extraData;

    public Export(List<String> fields, String extractText, List<String> extraData) {
        this.fields = fields;
        this.extractText = extractText;
        this.extraData = extraData;
    }

    public List<String> getFields() {
        return fields;
    }

    public String getExtractText() {
        return extractText;
    }

    public List<String> getExtraData() {
        return extraData;
    }
    
}
