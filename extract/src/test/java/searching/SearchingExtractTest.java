/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package searching;

import model.Export;
import model.Extract;
import org.junit.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import static org.junit.Assert.assertEquals;

/**
 * @author josu_
 */
public class SearchingExtractTest {

    public SearchingExtractTest() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    @Before
    public void setUp() {
    }

    @After
    public void tearDown() {
    }

    /**
     * Test of findPattener method, of class SearchingExtract.
     */
    @Test
    public void testFindPattener() {
        System.out.println("findPattener");
        String texto = "HEMOGRAMA\n"
                + "Série Vermelha (Eritrograma)\n"
                + "Valores de Referência\n"
                + "Eritrócitos.. 5,49 milhões/mm3 4,4 a 6,0 milhões/mmª\n"
                + "Hemoglobina 14,9 g/dL 13,0 a 17,5 g/dL\n"
                + "Hematócrito 43,7 % 38 a 53 %\n"
                + "V.C.M. 79,6 fl 80 a 94 fI\n"
                + "H.C.M. 27,1 pg 27 a 32 pg\n"
                + "C.H.C.M. 34,1 % 32 a 35 %\n"
                + "RDW 12,7% 10315 %";
        List<Extract> lista = new ArrayList<>();
        lista.add(new Extract(Arrays.asList("(Eritrócitos)\\W+(\\d+.\\d+)\\W+(milhões/mm3)"), 3, Arrays.asList("")));
        lista.add(new Extract(Arrays.asList("(Hemoglobina)\\W+(\\d+.\\d+)\\W+(g/dL)"), 3, Arrays.asList("")));
        lista.add(new Extract(Arrays.asList("(Hematócrito)\\W+(\\d+.\\d+)\\W+(%)"), 3, Arrays.asList("")));
        SearchingExtract instance = new SearchingExtract(lista);
        List<Export> expResult = new ArrayList<>();
        expResult.add(new Export(
                Arrays.asList("Eritrócitos", "5,49", "milhões/mm3"),
                "(Eritrócitos)\\W+(\\d+.\\d+)\\W+(milhões/mm3)",
                Arrays.asList("")));
        expResult.add(new Export(
                Arrays.asList("Hemoglobina", "14,9", "g/dL"),
                "(Hemoglobina)\\W+(\\d+.\\d+)\\W+(g/dL)",
                Arrays.asList("")));
        expResult.add(new Export(
                Arrays.asList("Hematócrito", "43,7", "%"),
                "(Hematócrito)\\W+(\\d+.\\d+)\\W+(%)",
                Arrays.asList("")));
        List<Export> result = instance.findPattener(texto);
        for (int i = 0; i < lista.size(); i++) {
            Export exportResult = result.get(i);
            Export expected = expResult.get(i);
            assertEquals(expected.getExtraData(), exportResult.getExtraData());
            assertEquals(expected.getExtractText(), exportResult.getExtractText());
            assertEquals(expected.getFields(), exportResult.getFields());
        }
    }

}
