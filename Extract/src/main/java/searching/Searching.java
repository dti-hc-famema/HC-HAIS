/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package searching;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @author josu_
 */
public class Searching {

    private List<String> listaDePadroes;
    private Pattern padrao;

    public Searching(List<String> lista) {
        this.listaDePadroes = lista;
    }
    
    public Searching(String padrao) {
        this.listaDePadroes = new ArrayList<>();
        listaDePadroes.add(padrao);
    }

    public void setListaDePadroes(List<String> padroes) {
        this.listaDePadroes = padroes;
    }

    public List<String> getListaDePadroes() {
        return this.listaDePadroes;
    }

    /**
     * Faz uma busca no texto enviado por parâmetro
     * e retorna as Strings encontradas referente ao padrão passado.
     *
     * @param texto texto para analise de padrões.
     *
     * @return retorna uma lista dos padrões encontrados.
     **/
    public List<String> retirarPadroes(String texto) {
        List<String> padroesEncontrados = new ArrayList<>();
        for (int i = 0; i < listaDePadroes.size(); i++) {
            padrao = Pattern.compile(listaDePadroes.get(i));
            Matcher matcher = padrao.matcher(texto);
            while (matcher.find()) {
                padroesEncontrados.add(matcher.group());
            }
        }
        return padroesEncontrados;
    }

    /**
     * Faz uma busca no texto e retorna as Strings encontradas referente ao
     * padrão grupo selecionado.
     *
     * @param texto texto para analisar os padrões.
     * @param grupo número do grupo para extrair o texto.
     *
     * @return retorna uma lista dos padrões encontrados do grupo selecionado.
     **/
    public List<String> retirarPadroes(String texto, int grupo) {
        List<String> padroesEncontrados = new ArrayList<>();
        for (int i = 0; i < listaDePadroes.size(); i++) {
            padrao = Pattern.compile(listaDePadroes.get(i));
            Matcher matcher = padrao.matcher(texto);
            while (matcher.find()) {
                padroesEncontrados.add(matcher.group(grupo));
            }
        }
        return padroesEncontrados;
    }

}
