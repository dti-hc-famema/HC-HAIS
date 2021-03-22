/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ocr;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.logging.Level;
import java.util.logging.Logger;
import net.sourceforge.tess4j.Tesseract;
import net.sourceforge.tess4j.TesseractException;
import net.sourceforge.tess4j.util.PdfBoxUtilities;

/**
 *
 * @author josu_
 */
public class TesseractOCR {
    
    private static final String ERRO_CAPTURA_TEXTO = "Houve um erro na captura do texto!";
    public static final String PORTUGUES = "por";
    public static final String INGLES = "eng";
    
    private final Tesseract tesseract;
    
    public TesseractOCR() {
        tesseract = new Tesseract();
        setDataPath(getClass().getClassLoader().getResource("tessdata").getPath());
        setLanguage("por");
    }
    
    public TesseractOCR(String pathData, String language) {
        tesseract = new Tesseract();
        setDataPath(pathData);
        setLanguage(language);
    }
    
    public final void setDataPath(String pathData) {
        tesseract.setDatapath(pathData);
    }
    
    public final void setLanguage(String language) {
         tesseract.setLanguage(language);
    }
    
    public String getImageText(File imagem) {
        try { 
            return tesseract.doOCR(imagem);
        } catch (TesseractException ex) {
            Logger.getLogger(TesseractOCR.class.getName()).log(Level.SEVERE, null, ex);
            return ERRO_CAPTURA_TEXTO;
        }
    }
    
    public String getPdfText(File pdf) {
        final File image;
        try {
            image = PdfBoxUtilities.convertPdf2Tiff(pdf);
        } catch (IOException ex) {
            return ERRO_CAPTURA_TEXTO;
        }
        return getImageText(image);
    }

    public static void separePdfText(File pdf) {
        File splitPdf = new File("file.pdf");
        PdfBoxUtilities.splitPdf(pdf, splitPdf, 1, PdfBoxUtilities.getPdfPageCount(pdf));

    }
    
}
