package searching;

import java.util.Arrays;
import java.util.List;
import java.util.regex.Matcher;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author josu_
 */

public class SearchingTest {

    private String texto;
    private List<String> resultado;
    private List<String> esperado;

    @BeforeClass
    public static void setUpClass() throws Exception {
    }

    @AfterClass
    public static void tearDownClass() throws Exception {
    }

    @Before
    public void setUp() throws Exception {
    }

    @After
    public void tearDown() throws Exception {
    }

    /**
     * Test of retirarPadroes method, of class Searching.
     */
    @Test
    public void testRetirarPadroes() {
        texto = "This is my Small example String Which I'm going to use for Pattern matching.";
        Searching instance = new Searching(Arrays.asList("([A-Z]).\\w+"));
        esperado = Arrays.asList("This", "Small", "String", "Which", "I'm", "Pattern");
        resultado = instance.retirarPadroes(texto);
        Assert.assertEquals(esperado, resultado);
    }
    
    @Test
    public void deve_RetornarOTexto_QueEhPassadoNoPadrao() {
        String texto = "HEMOGRAMA\n" +
        "Série Vermelha (Eritrograma)\n" +
        "Valores de Referência\n" +
        "Eritrócitos 5,49 milhões/mm3 4,4 a 6,0 milhões/mmª\n" +
        "Hemoglobina 14,9 g/dL 13,0 a 17,5 g/dL\n" +
        "Hematócrito 43,7 % 38 a 53 %\n" +
        "V.C.M. 79,6 fl 80 a 94 fI\n" +
        "H.C.M. 27,1 pg 27 a 32 pg\n" +
        "C.H.C.M. 34,1 % 32 a 35 %\n" +
        "RDW 12,7% 10315 %";
        Searching instance = new Searching(Arrays.asList("(Eritrócitos)\\W+(\\d+.\\d+)\\W+(milhões/mm3)",
                "(Hemoglobina)\\W+(\\d+.\\d+)\\W+(g/dL)", "(Hematócrito)\\W+(\\d+.\\d+)\\W+(%)"));
        List<String> esperado = Arrays.asList("5,49", "14,9", "43,7");
        List<String> resultado = instance.retirarPadroes(texto, 2);
        Assert.assertEquals(esperado, resultado);
    }
}
