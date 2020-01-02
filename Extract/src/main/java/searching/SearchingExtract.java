/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package searching;

import model.Export;
import model.Extract;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * @author josu_
 */
public class SearchingExtract {

    private final List<Extract> lista = new ArrayList<>();

    public SearchingExtract(List<Extract> lista) {
        this.lista.addAll(lista);
    }

    public List<Export> findPattener(String texto) {
        Searching searching;
        List<Export> exports = new ArrayList<>();
        for (Extract extract : lista) {
            for (int i = 0; i < extract.getExtractText().size(); i++) {
                String text = extract.getExtractText().get(i);
                searching = new Searching(text);
                List<String> pattern = new ArrayList<>();
                for (int j = 1; j <= extract.getExtractionGroupQuantity(); j++) {
                    pattern.addAll(searching.retirarPadroes(texto, j));
                }
                if (!pattern.isEmpty()) {
                    exports.add(new Export(pattern, text , extract.getExtraData()));
                    break;
                }
            }
        }
        return exports;
    }
}
