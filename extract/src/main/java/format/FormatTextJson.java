/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package format;

import model.Export;

import java.util.List;

/**
 * @author josu_
 */
public class FormatTextJson {

    private final List<Export> exports;
    private final StringBuilder buildExportText;

    public FormatTextJson(List<Export> export) {
        this.exports = export;
        this.buildExportText = new StringBuilder();
    }

    @Override
    public String toString() {
        buildExportText.append("<html>");
        for (Export item : exports) {
            buildTextExport(item);
        }
        buildExportText.append("</html>");
        return buildExportText.toString();
    }

    private void buildTextExport(Export item) {
        buildExportText.append("&nbsp; ").append("export: {").append("<br>");
        buildTextField(item);
        buildTextExtractText(item);
        buildTextExtraData(item);
        buildExportText.append("&nbsp; ").append("}").append("<br>");
    }

    private void buildTextExtraData(Export item) {
        buildExportText.append("&nbsp; &nbsp; ").append("extraData: [");
        for (String extraData : item.getExtraData()) {
            buildExportText.append("&nbsp; &nbsp; &nbsp; ").append(extraData).append(", ");
        }
        buildExportText.append("&nbsp; &nbsp; ").append("]").append("<br>");
    }

    private void buildTextExtractText(Export item) {
        buildExportText.append("&nbsp; &nbsp; ").append("extractText: [");
        buildExportText.append("&nbsp; &nbsp; &nbsp; ").append(item.getExtractText()).append(", ");
        buildExportText.append("&nbsp; &nbsp; ").append("]").append("<br>");
    }

    private void buildTextField(Export item) {
        buildExportText.append("&nbsp; &nbsp; ").append("field: [");
        for (String field : item.getFields()) {
            if (!field.isEmpty()) {
                buildExportText.append("&nbsp; &nbsp; &nbsp; ").append(field).append(", ");
            }
        }
        buildExportText.append("&nbsp; &nbsp; ").append("]").append("<br>");
    }

}
